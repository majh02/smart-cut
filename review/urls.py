from django.urls import path
from . import views

app_name = 'review'
urlpatterns = [
    path('<int:id>/', views.review, name='review'),
]

# from django.conf import settings
# from django.conf.urls.static import static

# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
