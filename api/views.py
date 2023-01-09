from django.shortcuts import render
from django.http import JsonResponse

from django.views import View
from rest_framework.views import APIView
from rest_framework.response import Response
from django.views.generic.detail import BaseDetailView

from .models import *
from .serializers import ShopSerializer
import bcrypt
from .mysql_conn import *

class ShopList(APIView):
    
    def get(self, request, format=None):
        
        shops = Shop.objects.all()[0:4]
        serializer = ShopSerializer(shops, many=True)
        return Response(serializer.data)
    

class SalonDetailAPIView(ShopSerializer):

    def get(self, request, *args, **kwargs):
        shop_id = 1
        salon = Shop.objects.get(shop_id=shop_id)
        print(salon.shop_name)
        data = {
            'remark' :salon.shop_name,
 
        }    

        serializer = ShopSerializer(instance=data)
        return Response(serializer.data)
        
    
class UserPwCheck(View):
    def get(self, request, *args, **kwargs):
        userinfo = Userinfo.objects.get(email=request.session['user'])
        print(kwargs['pk'].encode('utf-8'))
        print(userinfo.user_pw.encode('utf-8'))
        returnResult = -1

        if bcrypt.checkpw(kwargs['pk'].encode('utf-8'), userinfo.user_pw.encode('utf-8')):
            returnResult = 0
            
        print(returnResult)
        jsonData = {
            'returnResult' : returnResult,
        }
        return JsonResponse(data=jsonData, safe=True, status=200)


class RoomCheck(View):
    def get(self, request, *args, **kwargs):
        userinfo = Userinfo.objects.get(email=request.session['user'])
        user_id = userinfo.user_id
        designer_id = kwargs['designer_id']
        room_id = 0
        print(user_id, designer_id)

        r_bool, room_id = Procedure('check_chatroom', user_id, designer_id)
        message = ''
        
        if not r_bool:
            message = 'Failed mysql'
        else:
            print(room_id)
            message = 'Success mysql'

        return JsonResponse(data=room_id[0], safe=True, status=200)


