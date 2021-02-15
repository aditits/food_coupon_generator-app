from django.urls import path, include
from rest_framework.routers import DefaultRouter
from user import views

router = DefaultRouter()

app_name = 'user'

urlpatterns = [
    path('admin-token/', views.CreateAdminTokenView.as_view(), name='admin-token'),
    path('', include(router.urls)),
]
