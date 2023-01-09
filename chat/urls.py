from django.urls import path
from . import views
from django.views.generic import TemplateView

urlpatterns = [
    path('', views.index, name='chatting'),
    path('room/<str:room_name>/', views.room, name='chatRoom'),

    path('room/test/<str:room_name>/', views.room_test, name='chatRoom_test'),
]