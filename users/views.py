from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from api.mysql_conn import *
from api.models import Userinfo, UserinfoDetail, Shop, ShopFile, Designer, Hairstyle
from datetime import datetime

from django import forms
import requests


from django.views.decorators.csrf import csrf_protect

import json
from django.http import JsonResponse
import bcrypt

from django.urls import reverse
from .helper import send_mail
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_text
from django.contrib.auth.tokens import default_token_generator

import secrets

from django.utils import timezone
import logging
from django.conf import settings
from django.core.files.storage import default_storage
import numpy as np
import cv2
import string
from keras.models import load_model

from api.models import RecommendHair
from imutils import face_utils
import imutils
import dlib
import os
import random
import pandas as pd
import numpy as np
import cv2
from keras.models import load_model
from keras.applications.vgg16 import preprocess_input
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from django.core.files.storage import FileSystemStorage  # 이미지 저장

import secrets
# Create your views here.

import pyotp
from django.contrib import messages

#import asyncio
from threading import Timer
# Create your views here.

@csrf_protect
def Userinfo_Create(request):
    print('usercreate')
    if request.method == 'GET':  
        return render(request, 'users/10_joinMbs.html')
    else:
         
        data = json.loads(request.body)
        print(data)    
        
        try:        
            user_name = data['user_name']
            email = data['email']
            user_pw = data['user_pw']
            gender = data['gender']
            birth_year = data['birth_year']
            birth_month = data['birth_month']
            birth_day = data['birth_day']
            hp = '010-3333-3333'
            agree_must = data['agree_must']
            agree_select = data['agree_select']
            access_token = data['access_token']
        except KeyError:
            return JsonResponse({'message': "키 에러"}, status=400)
        
        
        #인증토큰 토큰 비교
        session_token = request.session.get('token')
        
        if access_token == session_token:
            print('이메일 인증 성공')
        else:
            return JsonResponse({'message': "본인 인증 실패."}, 
                             status = 400)
        
            
        #생년월일 변경
        age = '{}-{}-{}'.format(birth_year, birth_month, birth_day)
        
        

        
        
        #동의 정보 처리( 프론트에서 처리시 삭제 )
        agree_yn = '' 
        agree_type = ''
        
        # 개인정보 동의 유무 
        # Y로 무조건 넘어가나 
        # N일 경우 서비스를 이용(X)
        if agree_must == True:
            agree_yn = 'Y'
        elif agree_must == False:
            agree_yn = 'N'
        else:
            agree_yn = 'N'
        
        # 전체 동의 시 All => A로 표기
        # 필수 동의 시 One => O로 표기    
        if agree_select == True:
            agree_type = 'A'
        elif agree_select == False:
            agree_type = 'O'
        else:
            agree_type = 'O'
        
         
        #인증 토큰 초기화
        #access_token = ''

        # 회원 조회
        exist_user = Userinfo.objects.filter(email=email)
        
        #이미 회원일 경우
        if exist_user:
            print('회원존재')
            return JsonResponse({'message': "이미 존재하는 회원 입니다"}, status = 400)
        
        else: 
            print('회원성공')
            
            # 패스워드 암호화   
            hashed_pass = bcrypt.hashpw(user_pw.encode('utf-8'), bcrypt.gensalt()).decode('utf-8') 
                        
            #회원 저장
            cursor = connection.cursor()
            sql_query = 'INSERT \
                        INTO userinfo(user_name, email, user_pw, gender, age, hp) \
                        VALUES (%s, %s, %s, %s, %s, %s);'
            
            cursor.execute(sql_query, (user_name, email, hashed_pass, gender, age, hp))
            cursor.close()
            
            
            #개인 정보동의 저장
            cursor = connection.cursor()
            sql_query = 'INSERT INTO agree_info(user_id, AGREE_YN, AGREE_TYPE, AGREE_DATE, EXPIRE_DATE) \
                        select user_id, %s, %s, curdate(), date_add(curdate(), interval 2 YEAR) \
                        from userinfo \
                        where user_name = %s  \
                        and email= %s \
                        and hp = %s;'  
                        
            cursor.execute(sql_query, (agree_yn, agree_type, user_name, email, hp))
            cursor.close()
            
       
            
            
            return JsonResponse({
                                 'message': "회원가입을 완료 하였습니다.",
                                }, status = 200)
    
    

    
#이메일 인증
def MailAuth(request):

    data = json.loads(request.body)
    user_name = data['user_name']
    email = data['email']
    
    #사용자 이름 없을 때 처리
    if not user_name:
        user_name = '고객'
    print('MailAuth:',user_name, email)
    
    #인증 토큰 생성
    token = secrets.token_hex(nbytes=4)
    
    #세션에 토큰 저장
    request.session['token'] = token
    #세션에 만료시간 적용
    request.session.set_expiry(request.session.get_expiry_age())
    
    #이메일을 html 형식으로 사용자 이름, 도메인 주소, 토큰을 동봉하여 송부

    if email:
        
        send_mail(
            subject='스마트컷 본인인증',
            recipient_list=[email],
            body='{}님의 회원가입을 위한 인증메일 입니다.'.format(user_name), 
            from_email='smartcut22@naver.com',
            html=render_to_string('users/register_email.html',{
            'name': user_name,
            'domain': request.META['HTTP_HOST'],
            'token' : token
        }),
            to=[email], 
            fail_silently=False
        )
        
        
        return JsonResponse({'message': "메일 본인 인증 요청 완료." }, status = 200)    
    else:
        
        return JsonResponse({ 'message': "이메일이 비어있습니다."}, status = 400)



#비밀번호 찾기 OTP 생성 및 이메일 발송
@csrf_protect
def Find_Password_View(request):
            
    data = json.loads(request.body)
    
    try:
        email = data['email']
    except KeyError:
            return JsonResponse({'message': "키 에러"}, status=400)
    
    #1.해당 이메일이 DB에 있는지 확인
    exist_user = Userinfo.objects.filter(email=email).values('user_id')
    
    #존재하지 않으면 에러
    if not exist_user:
        return JsonResponse({'message': "존재하지 않는 이메일 입니다.", }, status = 400)
    
    
    #2.현재 시간으로 OTP 토큰(5개) 생성
    token = pyotp.random_base32()
    totp = pyotp.TOTP(token)
    otp = totp.now()[:5]
    
 


    #3. 서버에 임시 사용자의 계정 및 OTP 값을 저장
    request.session[f'TempUser_{email}'] = {
        'email' : email,
        'otp' : otp
    }

    if email:
        
        send_mail(
            subject='스마트컷 비밀번호 변경',
            recipient_list=[email],
            body='비밀번호 변경 OTP 코드 입니다.', 
            from_email='smartcut22@naver.com',
            html=render_to_string('users/register_email.html',{
            'name' : '회원',
            'token' : otp
        
        }),
            to=[email], 
            fail_silently=False
        )
        
       
        return JsonResponse({'message': "메일 발송 성공.","email": email}, status = 200)
    else:   
        return JsonResponse({'message': "메일 발송 실패.", }, status = 400)



          


# 비밀번호 찾기 - OTP 인증번호 넣는 View
@csrf_protect
def SelfCertification_View(request):
    
#세션 데이터 삭제
    def Delete_Session():
        
        try:
            
            if request.session.get(f'TempUser_{email}') != None:
                print('Before Delete:', request.session.get(f'TempUser_{email}'))
                del request.session[f'TempUser_{email}'] 
                print('After Delete:', request.session.get(f'TempUser_{email}'))
            
        except KeyError:
            return JsonResponse({'message': "키 에러"}, status=400)
    

    
    email = request.COOKIES.get('email')

    
    if request.method == "GET":
        Timer(180, Delete_Session).start()
        
        
        #timer.start()
        
        print('SelfCertification_View email:',email)

        
        return render(request,'users/7_selfCertification.html')
    

    
#OTP 인증 확인         
@csrf_protect      
def Verify_Password(request):
    
    
    data = json.loads(request.body)
    try:
        otp = data['otp']
        email = request.COOKIES.get('email')
    except KeyError:
            return JsonResponse({'message': "키 에러"}, status=400)
    
    print('Verify_Password:' + email)
    print(request.session.get(f'TempUser_{email}'))
    
    if request.session.get(f'TempUser_{email}') == None:
         return JsonResponse({'message': "해당 이메일은 인증 시간이 만료되었습니다."}, status=400)
        
    session_temp = request.session.get(f'TempUser_{email}')
    session_otp = session_temp['otp']
    session_email = session_temp['email']
    print('session_otp:',session_otp)
    print('session_email:',session_email)
    if otp == session_otp and email == session_email:
        del request.session[f'TempUser_{email}']
        session_temp=''

        return JsonResponse({'message': "인증 성공.", 'email': email }, status = 200)
    else:
        return JsonResponse({'message': "인증 실패.", }, status = 400)
       
       
        
#비밀번호 변경
@csrf_protect 
def Change_Password(request):
  
    
    if request.method == 'GET':  
        
        return render(request, 'users/8_changePW.html')
   
    else:
        data = json.loads(request.body)
        try:        
            user_pw = data['user_pw']
            email = request.COOKIES.get('email')
        except KeyError:
            return JsonResponse({'message': "키 에러"}, status=400)
        print(user_pw, email)
        
        # 패스워드 암호화   
        hashed_pass = bcrypt.hashpw(user_pw.encode('utf-8'), bcrypt.gensalt()).decode('utf-8') 
                            
        #비밀번호 변경
        cursor = connection.cursor()
        sql_query = 'UPDATE userinfo SET \
                    user_pw = %s \
                    WHERE email =  %s ;'
        
        cursor.execute(sql_query, ( hashed_pass, email))
        cursor.close()
            
        return JsonResponse({'message': "비밀번호 변경 완료.", }, status = 200)
    
    
         
        
        

   
@csrf_protect    
def activate(request):
    
    
        
        
    data = json.loads(request.body)
    
    token = data['access_token']
    # 인증하기를 누르면 사용자에게 전달된 토큰과 세션의 토큰이 같은 비교
    # 시간 지나면 session token 소멸 
    session_token = request.session.get('token')
      
    #토큰있으면 인증 누르면 무조건 완료 
    if token == session_token:
        
        request.session.pop('token')
        
        return JsonResponse({'message': "본인 인증 성공.",
                             'email_auth': True }, 
                             status = 200)
    
    else:
        return JsonResponse({'message': "본인 인증 실패.", }, status = 400)





# profile 페이지 view 함수
def profile(request):
    userinfo = Userinfo.objects.get(email=request.session['user'])
    return render(request, 'users/31_profile.html', {'userinfo':userinfo})


# 로그아웃
def Logout(request):
    if settings.KAKAO_CHECK == "":
        #세션에서 user 삭제
        del request.session['user'] 
        return render(request, 'users/5_login.html')
    else:
        requests.post(
            "https://kapi.kakao.com/v1/user/unlink",
                headers={
                "Content-Type" : "application/x-www-form-urlencoded",
                "Authorization": f"Bearer {settings.KAKAO_CHECK}"},
        )
        settings.KAKAO_CHECK = ""
        return redirect(reverse("users:login"))
        
        
@csrf_protect
def Userinfo_Update(request):
    user_id = Userinfo.objects.get(email=request.session['user']).user_id
    if request.method == 'GET':
        r_bool, userinfo = Procedure('get_userinfo', user_id)
        message = ''
        
        if not r_bool:
            print(userinfo)
            message = 'Failed mysql'
        else:
            print(userinfo)
            message = 'Success mysql'
        print(userinfo[0])
        return render(request, 'users/32_modifyProfile.html', {'userinfo':userinfo[0]})
    else:
        print(request.POST)
        age = request.POST['age']
        # hp = request.POST['hp']
        gender = request.POST['gender']
        filename = ''
        if 'thumbnail' in request.FILES:
            thumbnail = request.FILES['thumbnail']

            fs = FileSystemStorage()  # 이미지 파일을 저장할때 쓰는 함수
            filename = fs.save('profile_thumbnail/' + thumbnail.name, thumbnail)
        else:
            filename = "profile_thumbnail/profile.png"

        skin_condition = ''
        hair_bold = ''
        curl = ''
        hair_condition = ''
        thick_hair = ''
        hair_age = ''
        if 'skin_condition' in request.POST:
            skin_condition = request.POST['skin_condition']
        
        if 'hair_bold' in request.POST:
            hair_bold = request.POST['hair_bold']

        if 'curl' in request.POST:
            curl = request.POST['curl']

        if 'hair_condition' in request.POST:
            hair_condition = request.POST['hair_condition']

        if 'thick_hair' in request.POST:
            thick_hair = request.POST['thick_hair']

        if 'hair_age' in request.POST:
            hair_age = request.POST['hair_age']
        
        
        r_bool, result = Procedure('set_userinfo'
                                    , user_id, age, '0', gender
                                    , skin_condition, hair_bold, curl
                                    , hair_condition, thick_hair, hair_age
                                    , filename
                                    )
        message = ''
        
        if not r_bool:
            print(result)
            message = 'Failed mysql'
        else:
            print(result)
            message = 'Success mysql'
        
        return redirect('/users/profile')
    

class LoginForm(forms.Form):
    username = forms.CharField(error_messages={"required" : "이메일을 입력해주세요"}, max_length=32, label = "이메일")
    password = forms.CharField(error_messages={"required" : "비밀번호를 입력해주세요."}, 
            max_length= 64, label = "비밀번호", widget=forms.PasswordInput)

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')
        
        if password and username:
            try:
                user = Userinfo.objects.get(email = username)
            except Userinfo.DoesNotExist:
                self.add_error("username", "이메일이 존재하지 않습니다.")
                return
            if not bcrypt.checkpw(password.encode('utf-8'), user.user_pw.encode('utf-8')):
                self.add_error("password", "비밀번호가 일치하지 않습니다.")
            else:
                self.user_id = user.email

def login(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            request.session['user'] = form.user_id
            return redirect('/users/main')
    else:
        form = LoginForm()
    return render(request,'users/5_login.html', {'form':form} )

# main 페이지 view 함수
def main(request):
    userinfo = Userinfo.objects.get(email=request.session['user'])
    salon_list = Shop.objects.select_related('shopfile')
    designer_list = Designer.objects.select_related('shop')
    recommend = RecommendHair.objects.select_related('user').filter(user=userinfo.user_id).last()

    static_url = "faceshape_image/"
    if not recommend:
        heart = Hairstyle.objects.filter(hair="하트형").first()
        oblong = Hairstyle.objects.filter(hair="긴형").first()
        round = Hairstyle.objects.filter(hair="둥근형").first()
        square = Hairstyle.objects.filter(hair="각진형").first()
        
        if userinfo.gender == "M":
            recent_result = "💇🏻‍♂️"
            hair_list = [{"0" : static_url+"m_heart.jpg", "1" : "하트형", "2":heart.content, "3":heart.tags},
                         {"0" : static_url+"m_oblong.jpg", "1" : "긴형", "2":oblong.content, "3":oblong.tags},
                         {"0" : static_url+"m_round.jpg", "1" : "둥근형", "2":round.content, "3":round.tags},
                         {"0" : static_url+"m_square.jpg", "1" : "각진형", "2":square.content, "3":square.tags}]
        else:
            recent_result = "💇🏻‍♀️"
            hair_list = [{"0" : static_url+"w_heart.jpg", "1" : "하트형", "2":heart.content, "3":heart.tags},
                         {"0" : static_url+"w_oblong.jpg", "1" : "긴형", "2":oblong.content, "3":oblong.tags},
                         {"0" : static_url+"w_round.jpg", "1" : "둥근형", "2":round.content, "3":round.tags},
                         {"0" : static_url+"w_square.jpg", "1" : "각진형", "2":square.content, "3":square.tags}]
    
    else:
        recent_result = recommend.user_faceshape
        
        hairstyle1 = Hairstyle.objects.filter(hair=recommend.hair1, gender=userinfo.gender).first()
        hairstyle2 = Hairstyle.objects.filter(hair=recommend.hair2, gender=userinfo.gender).first()
        hairstyle1_tags = hairstyle1.tags
        hairstyle2_tags = hairstyle2.tags
        hair_list = [{'0':recommend.hair3, '1':recommend.hair1, '2':hairstyle1.content, '3':hairstyle1_tags},
                    {'0':recommend.hair4, '1':recommend.hair2, '2':hairstyle2.content, '3':hairstyle2_tags}]

    
    print(f'userinfo : {userinfo}')
    print(f'salon_list : {salon_list}')
    print(f'designer_list : {designer_list}')
    print(f"hair_list : {hair_list}")
    
    context = {
        'userinfo':userinfo,
        'salon_list':salon_list,
        'designer_list':designer_list,
        'hair_list' : hair_list,
        'recent_result' : recent_result,
    }
    return render(request, 'users/13_main.html', context)

def model_upload(request):
    result_list = []
    count = 0
    # model.predict 값 format 설정
    np.set_printoptions(precision=6, suppress=True)
    pd.options.display.float_format = '{:.1f}'.format
    pd.reset_option('display.float_format')

    # 헤어스타일 영어 : 한글 mapping
    hair_style_kor = {'elisabethperm' : '엘리자벳펌', 'baby' : '베베컷', 'paper' : '페이퍼컷', 'windperm' : '윈드펌', 
                    'miroperm' : '미로펌', 'mistyperm' : '미스티펌', 'volumemagic' : '볼륨매직', 'leaf' : '리프컷',
                    'frillperm' : '프릴펌', 'bonnieperm' : '보니펌', 'candyperm' : '캔디펌', 'scurllayerdperm' : 'S컬 레이어드 펌',
                    'ponytail' : '포니테일', 'layered' : '레이어드 컷', 'block' : '블럭컷', 'lowbun' : '로우번',
                    'shotpart' : '단발 6:4 가르마', 'longpart' : '긴머리 5:5 가르마', 'glam' : '글램펌', 'build' : '빌드컷',
                    'scurlperm' : 'S컬 펌', 'janeperm' : '제인펌', 'hursh' : '허쉬컷', 'faceline' : '페이스라인 컷', 
                    'seethroughbang' : '시스루 뱅', 'sidebang' : '사이드 뱅', 'curtainbang' : '커튼 뱅', 'bob' : '보브컷',
                    'naturalup' : '네추럴업', 'hugperm' : '허그펌', 'scurlwaveperm' : 'S컬 웨이브 펌',
                    'Wave_perm' : '웨이브펌', 'Two_block' : '투블럭', 'Short_pomade' : '소프트포마드', 'Shadow_perm' : '쉐도우펌',
                    'Regent_perm' : '리젠트펌', 'Ivy_league' : '아이비리그컷', 'Guile_cut' : '가일컷', 'Baby_perm' : '베이비펌',
                    'As_perm' : '애즈펌', 'Two_block_wolf' : '투블럭울프컷', 'Soft_mohican' : '소프트모히칸', 'Skinfade_cut' : '스킨페이드컷',
                    'Semicrop' : '세미크롭', 'Regent_cut' : '리젠트컷', 'Volume_perm' : '볼륨펌', 'Soft_two_block' : '소프트투플럭',
                    'Part_perm' : '가르마펌', 'Leaf_perm' : '리프펌', 'Leaf_cut' : '리프컷', 'Dandy_perm' : '댄디펌',
                    'Spin_Swallow_perm' : '스핀스왈로펌', 'Hippie_perm' : '히피펌'}
    
    if request.method == 'POST':
        image = request.FILES['files']
        detector = dlib.get_frontal_face_detector()
        predictor = dlib.shape_predictor(settings.DAT_ROOT)
                
        userinfo = Userinfo.objects.get(email=request.session['user'])
        gender = userinfo.gender
        #todo form에서 전송한 파일을 획득한다.
        file = image

        fs = FileSystemStorage()  # 이미지 파일을 저장할때 쓰는 함수
        filename = fs.save('image/' + file.name, file)

        result = RecommendHair()

        result.image = filename
        result.user = userinfo
        result.save()
        
        # logger.error('file', file)
        img_array = np.fromfile(os.path.join(settings.MEDIA_ROOT, result.image), np.uint8)
        img = cv2.imdecode(img_array, cv2.IMREAD_COLOR)
        # print(img_path)
        # img = cv2.imread(img_path)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        
        # landmark
        rects = detector(gray, 1)
        
        if len(rects) == 0:
            result.delete()
            return render(request, 'users/22_AI_Photo.html', {'userinfo' : userinfo, 'message':'얼굴을 인식할수 없습니다.'}) 
            
        
        
        for (i, rect) in enumerate(rects):
            shape = predictor(gray, rect)
            shape = face_utils.shape_to_np(shape)
            clone=img.copy()
            (x_, y_, w_, h_) = face_utils.rect_to_bb(rect)
            for (name, (i,j)) in face_utils.FACIAL_LANDMARKS_IDXS.items():
                
                
                for (x,y) in shape[i:j]:
                    cv2.circle(clone, (x,y), 1, (0,0,255), -1)
                
                (x,y,w,h) = cv2.boundingRect(np.array([shape[i:j]]))
                roi = img[y:y + h, x:x + w]
                roi = imutils.resize(roi, width=250, inter=cv2.INTER_CUBIC)

            
            output = face_utils.visualize_facial_landmarks(img,shape)

            # crop
            cropped_img = output[y_-(h_//3):y_+h_+(h_//5), x_-(h_//10):x_+h_+(h_//10)]
            
            try:
                cv2.imwrite(settings.CROP_IMAGE_SAVING_ROOT + '/crop_landmark_image.jpg', cropped_img)
            
            except:
                return render(request, 'users/22_AI_Photo.html', {'userinfo' : userinfo})
        
        # result.crop_image = cropped_img
        # result.save()
        
        # crop_img_path = result.crop_image.url
        # vgg16 모델 테스트용 전처리를 위해 crop image 저장
        
        
        # class names 준비
        class_names = ['하트형', '긴 얼굴형', '계란형', '둥근형', '각진형']
        class_names_2 = ['Heart', 'Oblong', 'Oval', 'Round', 'Square']
        class_names = np.array(class_names)
        class_names_2 = np.array(class_names_2)
        
        # vgg16 모델 테스트 전처리
        TestDatagen = ImageDataGenerator(
            preprocessing_function= preprocess_input)
        
        test_data = TestDatagen.flow_from_directory(
            settings.CROP_IMAGE_ROOT,
            target_size = (224,224),
            batch_size = 16,
            class_mode = 'categorical')

        model_path = settings.MODEL_ROOT
        # model_path = Post.objects.get(used=True).file.path
        model = load_model(model_path)
                    
        #todo history 저장을 위해 객체에 담아서 DB에 저장한다.
        # 이때 파일시스템에 저장도 된다.
        
        # result.answer = request.POST.getlist('answer')[count] # answer를 채워봅시다.
        # result.image = file # image를 채워봅시다.
        # result.pub_date = timezone.datetime.now()
        # result.is_answer_check = False
        # result.save()
        pred = model.predict(test_data)
        pred_1 = pred.argmax(axis=1)
        pred_2 = np.round(pred[0] * 100)
        
        # 추천 헤어스타일 random
        hair_path = settings.HAIR_IMAGE_ROOT + '/' + gender + '/' + class_names_2[pred_1][0]
        filenames = os.listdir(hair_path)
        
        ran_file = random.sample(filenames, 2)
        
        style_path = hair_path + '/' + ran_file[0]
        style_path2 = hair_path + '/' + ran_file[1]
        
        fnames = os.listdir(style_path)
        style_image_1 = random.sample(fnames, 1)
        image1 = cv2.imread(style_path + '/' + style_image_1[0])
        image1 = cv2.resize(image1, (224,224))
        
        fnames = os.listdir(style_path2)
        style_image_2 = random.sample(fnames, 1)
        image2 = cv2.imread(style_path2 + '/' + style_image_2[0])
        image2 = cv2.resize(image2,(224,224))
        

        #예측결과
        result.user_faceshape = class_names[pred_1][0]
        result.heart = pred_2[0]
        result.oblong = pred_2[1]
        result.oval = pred_2[2]
        result.round = pred_2[3]
        result.square = pred_2[4]
        result.hair1 = hair_style_kor[ran_file[0]]
        result.hair2 = hair_style_kor[ran_file[1]]
        result.hair3 = 'hairstyle_image/' + gender + '/' + class_names_2[pred_1][0] + '/' + ran_file[0] + '/' + style_image_1[0]
        result.hair4 = 'hairstyle_image/' + gender + '/' + class_names_2[pred_1][0] + '/' + ran_file[1] + '/' + style_image_2[0]
        
        hairstyle1 = Hairstyle.objects.filter(hair=result.hair1, gender=userinfo.gender).first()
        hairstyle2 = Hairstyle.objects.filter(hair=result.hair2, gender=userinfo.gender).first()
        hairstyle1_tags = hairstyle1.tags
        hairstyle2_tags = hairstyle2.tags
        hair_list = [{'0':result.hair3, '1':result.hair1, '2':hairstyle1.content, '3':hairstyle1_tags},
                    {'0':result.hair4, '1':result.hair2, '2':hairstyle2.content, '3':hairstyle2_tags}]

        shape = {
            '하트형':'heart'
            , '긴 얼굴형':'oblong'
            , '계란형':'oval'
            , '둥근형':'round'
            , '각진형':'square'
        }
        shape_exp = Hairstyle.objects.filter(hair=result.user_faceshape).first().content
        shop = Shop.objects.all().order_by('-'+shape[result.user_faceshape])[0]
               
        result.save()
        context = {
                'userinfo' : userinfo,
                'result_user_faceshape': result.user_faceshape,
                'result_heart' : result.heart,
                'result_oblong' : result.oblong,
                'result_oval' : result.oval,
                'result_round' : result.round,
                'result_square' : result.square,
                'result_hair1' : result.hair1,
                'result_hair2' : result.hair2,
                'result_hair3' : result.hair3,
                'result_hair4' : result.hair4,
                'hair_list' : hair_list,
                'labels' : ['하트형', '긴 얼굴형', '계란형', '둥근형', '각진형'],
                'shape_exp': shape_exp,
                'data' : [result.heart, result.oblong, result.oval, result.round, result.square],
                'img_url' : result.image,
                'shop':shop,
                }
        
        
        
        return render(request, 'users/24_AI_Complete.html', context)
    else:
        userinfo = Userinfo.objects.get(email=request.session['user'])
        return render(request, 'users/22_AI_Photo.html', {'userinfo' : userinfo})


def kakao_login(request):
    client_id = "9d7400a0dbbb6685716c049eae109235"
    REDIRECT_URI = "http://" +  request.get_host() + "/users/login/kakao/callback"
    print('login',REDIRECT_URI)
    return redirect(
        f"https://kauth.kakao.com/oauth/authorize?client_id={client_id}&redirect_uri={REDIRECT_URI}&response_type=code&scope=profile_nickname,account_email,gender&prompt=login"
    )
    
class KakaoException(Exception):
    pass

def kakao_callback(request):
    try:
        code = request.GET.get("code") # 임시 코드를 받아옵니다.
        client_id = "9d7400a0dbbb6685716c049eae109235"
        redirect_uri = "http://" +  request.get_host() + "/users/login/kakao/callback"
        print('callback',redirect_uri)
        token_request = requests.get( # code로 access_token을 JSON형태로 요청
            f"https://kauth.kakao.com/oauth/token?grant_type=authorization_code&client_id={client_id}&redirect_uri={redirect_uri}&code={code}" 
        )
        
        token_json = token_request.json()
        print('token', token_json)
        error = token_json.get("error", None)
        if error is not None: # token 값이 없다면,
            raise KakaoException()
        access_token = token_json.get("access_token") # access_token 추출
        profile_request = requests.get(
            "https://kapi.kakao.com//v2/user/me",
            headers={"Authorization": f"Bearer {access_token}"},
        ) # "access_token"으로 API(profile) 요청
        profile_json = profile_request.json()
        email = profile_json.get("kakao_account").get("email") # email 
        if email is None: # email이 없다면 에러 발생
            raise KakaoException()
        properties = profile_json.get("kakao_account").get("profile")
        nickname = properties.get("nickname") # 이름
        gender = profile_json.get("kakao_account").get("gender")
        if gender == "male":
            gender = "M"
        else:
            gender = "F"
        try:
            user = Userinfo.objects.get(email=email)
        except Userinfo.DoesNotExist:
            user = Userinfo.objects.create(
                email=email,
                user_name=nickname,
                thumbnail = 'profile_thumbnail/profile.png',
                gender = gender,
            )
            user.save()
        request.session['user'] = email
        settings.KAKAO_CHECK = access_token
        return redirect(reverse("users:main"))
    except KakaoException:
        return redirect(reverse("users:login"))

    
