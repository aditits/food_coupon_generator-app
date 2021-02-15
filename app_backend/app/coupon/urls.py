from django.urls import path, include
from rest_framework.routers import DefaultRouter
from coupon import views

router = DefaultRouter()

app_name = 'coupon'
router.register('coupons', views.CouponViewSet, basename='coupons')


urlpatterns = [
    path('', include(router.urls)),
]
