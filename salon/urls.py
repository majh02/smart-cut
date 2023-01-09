from django.urls import path
from . import views
from django.views.generic import TemplateView

app_name = 'salon'
urlpatterns = [
    path('detail/<int:id>/', views.salonDetail, name='salonDetail'),
    path('designer/<int:id>/', views.salonDesigner, name='salonDesigner'),
    path('photo/<int:id>/', views.salonPhoto, name='salonPhoto'),
]