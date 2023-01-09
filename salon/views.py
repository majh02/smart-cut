from django.shortcuts import render
from api.models import *
from api.serializers import ShopSerializer
from rest_framework.response import Response
import json
from django.http import JsonResponse

# 미용실 상세정보 페이지
def salonDetail(request, id):
    
    template_name = 'salon/14_1_salonDetails.html'
    userinfo = Userinfo.objects.get(email=request.session['user'])
    salon = Shop.objects.get(shop_id=id)
    
    return  render(
                    request, 
                    template_name = template_name,  
                    context={ 'userinfo':userinfo, 'salon' : salon }                    
                    )
  
# 미용실 디자이너 페이지  
def salonDesigner(request, id):
    userinfo = Userinfo.objects.get(email=request.session['user'])
    salon = Shop.objects.get(shop_id=id)
    designer_list = Designer.objects.filter(shop_id=id)
    
    return render(request, 'salon/14_2_salonDesigner.html', context={'userinfo':userinfo, 'salon':salon, 'designer_list':designer_list})

# 미용실 사진 페이지
def salonPhoto(request, id):
    userinfo = Userinfo.objects.get(email=request.session['user'])
    salon = Shop.objects.get(shop_id=id)
    
    photo_list = []
    shop_photo_list = ShopFile.objects.filter(shop_id=id)
    review_allList = ReservReview.objects.all()    
    
    for review in review_allList:
        if review.photo and review.reserv.shop.shop_id==id:
            photo_list.append(review.photo)
            
    for shop_photo in shop_photo_list:
        if shop_photo.main_img:
            photo_list.append(shop_photo.main_img)
        if shop_photo.img1:
            photo_list.append(shop_photo.img1)
        if shop_photo.img2:
            photo_list.append(shop_photo.img2)
        if shop_photo.img3:
            photo_list.append(shop_photo.img3)
        if shop_photo.img4:
            photo_list.append(shop_photo.img4)
        if shop_photo.img5:
            photo_list.append(shop_photo.img5)
    
    return render(request, 'salon/14_3_salonPhoto.html', context={'userinfo':userinfo, 'salon':salon, 'photo_list':photo_list})