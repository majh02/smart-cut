from django.urls import path
from . import views
from django.views.generic import TemplateView

app_name = "reservation"

urlpatterns = [
    path('add_reserv/<designer_id>/<shop_id>', views.ReservCreate, name='add_reserv'),
    path('reservation/<pk>', views.ReservDetail, name='reservation'),
    path('reservationHistory/', views.ReservList, name='reservationHistory'),
]
