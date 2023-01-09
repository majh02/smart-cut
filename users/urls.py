from django.urls import path, include
from django.views.generic import TemplateView
from django.contrib.auth import views as auth_views
from . import views

app_name = 'users'

urlpatterns = [
    # 로그인, 회원가입(1~12)
    path('logo/', TemplateView.as_view(template_name='users/1_logoScreen.html'), name='logo'),
    path('serviceExp1/', TemplateView.as_view(template_name='users/2_serviceExp1.html'), name='serviceExp1'),
    path('serviceExp2/', TemplateView.as_view(template_name='users/3_serviceExp2.html'), name='serviceExp2'),
    path('serviceExp3/', TemplateView.as_view(template_name='users/4_serviceExp3.html'), name='serviceExp3'),
    path('login/', views.login, name='login'),
    path('logout/', views.Logout, name='logout'),
    
    # 카카오 로그인
    path('login/kakao/', views.kakao_login, name='kakao-login'),
    path('login/kakao/callback', views.kakao_callback, name='kakao-callback'),
    
    #비밀번호 찾기
    path('findPW/', TemplateView.as_view(template_name='users/6_findPW.html'), name='findPW'),
    path('mailSubmit/', views.Find_Password_View, name='mailSubmit'),
    path('selfCertification/', views.SelfCertification_View, name='selfCertification'),
    path('verifyOtp/', views.Verify_Password, name='verifyOtp'),
    path('changePW/', views.Change_Password, name='changePW'),
    path('changePW_complete/', TemplateView.as_view(template_name='users/9_changePW_complete.html'), name='changePW_complete'),

    path('join/',  views.Userinfo_Create, name='join'),
    path('mail_auth/',  views.MailAuth, name='mail_auth'),


    path('authNum/', TemplateView.as_view(template_name='users/11_authNum.html'), name='authNum'),
    path('joinMbs_complete/', TemplateView.as_view(template_name='users/12_joinMbs_complete.html'), name='joinMbs_complete'),
    
    # 메인화면(12) 
    path('main/', views.main, name='main'),
    
    # 미용실 정보(14~15)
    path('salonDetails/', TemplateView.as_view(template_name='users/14_1_salonDetails.html'), name='salonDetails'),
    path('salonDesigner/', TemplateView.as_view(template_name='users/14_2_salonDesigner.html'), name='salonDesigner'),
    path('salonPhoto/', TemplateView.as_view(template_name='users/14_3_salonPhoto.html'), name='salonPhoto'),
    # path('review/', TemplateView.as_view(template_name='users/15_review.html'), name='review'),
    
    # 지도(16~17)
    path('map/', TemplateView.as_view(template_name='users/16_map.html'), name='map'),
    path('map_search/', TemplateView.as_view(template_name='users/17_map_search.html'), name='map_search'),
    
    # 예약(18~19)
    # path('reservation/', TemplateView.as_view(template_name='users/18_reservation.html'), name='reservation'),
    # path('reservationHistory/', TemplateView.as_view(template_name='users/19_reservationHistory.html'), name='reservationHistory'),
    
    # 채팅(20~21)
    # path('chatting/', TemplateView.as_view(template_name='users/20_chatting.html'), name='chatting'),
    # path('chatRoom/', TemplateView.as_view(template_name='users/21_chatRoom.html'), name='chatRoom'),
    
    # AI분석(22~24)
    path('AI_Photo/', views.model_upload, name='AI_Photo'),
    path('AI_Complete/', TemplateView.as_view(template_name='users/24_AI_Complete.html'), name='AI_Complete'),
    
    # 프로필(31~32)
    path('profile/', views.profile, name='profile'),
    path('checkPW/', TemplateView.as_view(template_name="users/32_1checkPW.html"), name='check_password'),
    path('modifyProfile/', views.Userinfo_Update, name='modifyProfile'),
]