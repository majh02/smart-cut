from django.shortcuts import render, redirect
from api.models import Userinfo, ReservReview, Shop, Reservation
from django.utils import timezone
from api.mysql_conn import *
from api.models import Reservation, ReservReview
from django.db.models import Sum

from django.views.decorators.csrf import csrf_protect
from django.http import JsonResponse

from django.core.files.storage import FileSystemStorage  # 이미지 저장

from django.contrib import messages




@csrf_protect
def review(request, id):
    # 샵 정보
    shopinfo = Shop.objects.get(shop_id = id)
    # 리뷰 정보
    reviews = ReservReview.objects.select_related('user').filter(shop_id=id)

    if request.method == 'GET':
        print(f"session: {request.session['user']}")
        userinfo = Userinfo.objects.get(email=request.session['user'])
        
        # shop 별점 반영하기
        all_review = ReservReview.objects.filter(shop_id=id)
        review_count = all_review.count()
        sum_score = ReservReview.objects.filter(shop_id=id).aggregate(Sum('star'))['star__sum']
        
        cur_score = 0.0
        if sum_score!=None: cur_score = round(sum_score/review_count, 1)
        
        sql_query = 'UPDATE shop SET score = %s WHERE shop_id=%s;'
        cursor = connection.cursor()
        cursor.execute(sql_query, (cur_score, id))
        cursor.close()
        
        return render(request, 'review/15_review.html', {'reviews' : reviews,
                                                        'salon' : shopinfo,
                                                        'userinfo' : userinfo,})
    else:
        print(request.POST)
        data = request.POST
        
        try:
            # user_id는 로그인 시 받아와야함
            user = Userinfo.objects.get(email=request.session['user'])
            user_id = user.user_id
            
            ReservCheck = False
            ReviewCheck = False
            if Reservation.objects.filter(user_id=user_id).filter(shop_id=id).exists():
                reserv = Reservation.objects.filter(user_id=user_id).filter(shop_id=id).last().reserv_id
                print(f'reserv : {reserv}')
                
                # 리뷰 등록하기
                star = request.POST.get('ratevalue')
                content = data['content']
                Modulated_writer = user.user_name[0]+'*'+user.user_name[-1]
                regdatetime = timezone.datetime.now()
                photo = request.FILES.get('photo', '')
                print(f"photo : {photo}")
                
                # shop 별점 반영하기
                all_review = ReservReview.objects.filter(shop_id=id)
                review_count = all_review.count()+1
                sum_score = ReservReview.objects.filter(shop_id=id).aggregate(Sum('star'))['star__sum']
                if sum_score==None: sum_score=0.0
                cur_score = round((sum_score + float(star))/review_count, 1)
                
                if not ReservReview.objects.filter(reserv_id=reserv).exists():
                    if photo!='':
                        photo = request.FILES['photo']
                        fs = FileSystemStorage()  # 이미지 파일을 저장할때 쓰는 함수
                        filename = fs.save('review/' + photo.name, photo)

                        sql_query = 'INSERT \
                                    INTO reserv_review(reserv_id, user_id, shop_id, star, content, writer, photo, regdatetime) \
                                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s);'

                        cursor = connection.cursor()
                        cursor.execute(sql_query, (reserv, user_id, id, star, content, Modulated_writer, filename, regdatetime))
                        cursor.close()
                    else:
                        sql_query = 'INSERT \
                                    INTO reserv_review(reserv_id, user_id, shop_id, star, content, writer, regdatetime) \
                                    VALUES (%s, %s, %s, %s, %s, %s, %s);'
                        
                        cursor = connection.cursor()
                        cursor.execute(sql_query, (reserv, user_id, id, star, content, Modulated_writer, regdatetime))
                        cursor.close()

                    sql_query = 'UPDATE shop SET score = %s WHERE shop_id=%s;'
                    cursor = connection.cursor()
                    cursor.execute(sql_query, (cur_score, id))
                    cursor.close()
                else:
                    ReviewCheck = True
            else:
                ReservCheck = True
                    
        except KeyError:
            return JsonResponse({'message': "키 에러"}, status=400)
        
        context = {
                'reviews' : reviews,
                'salon' : shopinfo,
                'ReservCheck' : ReservCheck,
                'ReviewCheck' : ReviewCheck                
                }
        print(f"context['salon'].score {context['salon'].score}")
        return render(request, 'review/15_review.html', context)