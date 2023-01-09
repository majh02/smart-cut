from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from api.mysql_conn import *
from api.models import Reservation, Userinfo, Designer, Shop, ShopFile, RecommendHair

from datetime import datetime
from django.utils import timezone
from django.views.decorators.csrf import csrf_protect

def ReservList(request):
    userinfo = Userinfo.objects.get(email=request.session['user'])
    user_id = userinfo.user_id
    reserv_list = Reservation.objects.select_related('designer').select_related('shop').filter(user = user_id).order_by('-reserv_date', '-reserv_time')
    
    if len(reserv_list) > 0:
        latest_reserv=reserv_list[0].reserv_id
    else:
        latest_reserv = 0
    print(latest_reserv)
    return render(request, 'reservation/19_reservationHistory.html'
                , {'reserv_list':reserv_list
                    ,'latest_reserv':latest_reserv})

def ReservDetail(request, pk):
    print(pk)
    reserv = Reservation.objects.select_related('user').select_related('designer').select_related('shop').get(reserv_id=pk)
    shop_file = ShopFile.objects.select_related('shop').get(shop_id=reserv.shop.shop_id).main_img

    print(reserv)
    return render(request, 'reservation/18_reservation.html'
                , {'reservation': reserv, 'shop_file':shop_file})

@csrf_protect
def ReservCreate(request, designer_id, shop_id):
    userinfo = Userinfo.objects.get(email=request.session['user'])
    user_id = userinfo.user_id


    if request.method == 'GET':
        date_now = timezone.now()
        designer = Designer.objects.get(designer_id=designer_id)
        shop = Shop.objects.get(shop_id=shop_id)

        return render(request, 'reservation/33_reservSet.html'
                    , {'date_now':date_now
                        ,'shop':shop})
    else:
        print(request.POST)
        userinfo = Userinfo.objects.get(user_id=user_id)
        designer = Designer.objects.get(designer_id=designer_id)
        shop = Shop.objects.get(shop_id=shop_id)
        
        if RecommendHair.objects.filter(user_id=user_id).exists():
            recommand = RecommendHair.objects.filter(user_id=user_id)
            if recommand[0].user_faceshape == "하트형":
                shop.heart += 1
            elif recommand[0].user_faceshape == "긴 얼굴형":
                shop.oblong += 1
            elif recommand[0].user_faceshape == "계란형":
                shop.oval += 1
            elif recommand[0].user_faceshape == "둥근형":
                shop.round += 1
            elif recommand[0].user_faceshape == "각진형":
                shop.square += 1

            shop.save()

        reserv = Reservation()
        reserv.user = userinfo
        reserv.designer = designer
        reserv.shop = shop
        
        reserv.reserv_date = request.POST['reserv_date']
        reserv.reserv_time = request.POST['hour'] + ':' + request.POST['min']
        reserv.cut = request.POST['cut']
        reserv.perm = request.POST['perm']
        reserv.color = request.POST['color']
        reserv.clinic = request.POST['clinic']
        reserv.regdatetime = str(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        reserv.updatedatetime = str(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        reserv.save()
        print(reserv.reserv_id)
        return redirect('reservation:reservation', reserv.reserv_id )
    