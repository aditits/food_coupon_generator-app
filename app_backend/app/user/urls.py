from django.urls import path, include
from rest_framework.routers import DefaultRouter
from user import views

router = DefaultRouter()

app_name = 'user'

# router.register('account-detail', views.CustomerAccountDetailsViewSet, basename='account-detail')
router.register('create', views.CreateUserView, basename='create')
router.register('list', views.ListUserView, basename='list')

urlpatterns = [
    # path('token/', views.CreateTokenView.as_view(), name='token'),
    path('admin-token/', views.CreateAdminTokenView.as_view(), name='admin-token'),
    # path('restaurant-token/', views.CreateRestaurantTokenView.as_view(), name='restaurant-token'),
    # path('agent-token/', views.CreateDeliveryAgentTokenView.as_view(), name='agent-token'),
    # path('generate-otp/', views.ValidatePhoneSendOTP.as_view(), name='generate-otp'),
    path('me/', views.ManageUserView.as_view(), name='me'),
    path('', include(router.urls)),
]
