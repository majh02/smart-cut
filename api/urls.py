from django.urls import path, include
from django.views.generic import TemplateView
from api import views

urlpatterns = [
    path('shop/', views.ShopList.as_view()),
    path('pwCheck/<str:pk>/', views.UserPwCheck.as_view(), name='pwCheck'),
    path('roomCheck/<designer_id>/', views.RoomCheck.as_view(), name='roomCheck'),
]
