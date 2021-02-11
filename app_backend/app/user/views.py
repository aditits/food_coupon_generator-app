from rest_framework import generics, authentication, \
    permissions, viewsets, mixins, status
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.generics import GenericAPIView, get_object_or_404
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated, BasePermission
from rest_framework.authentication import TokenAuthentication

import random
from core import models
from user.serializers import UserOutputSerializer, AuthTokenSerializer, UserInputSerializer
from user import selectors, services
from django.contrib.auth import get_user_model


# from coupon-app.core.models import UserAccountInformation
# from coupon-app.user.serializers import UserAccountInformationSerializer


class IsAdminUser(BasePermission):

    def has_permission(self, request, view):
        if request.user.user_type == 1:
            return True
        return False


class CreateUserView(
    viewsets.GenericViewSet,
    mixins.ListModelMixin,
    mixins.CreateModelMixin,
    mixins.UpdateModelMixin
):
    """Create a new user in the system"""
    serializer_class = UserOutputSerializer
    queryset = models.User.objects.all()

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())

        lookup_url_kwarg = self.lookup_url_kwarg or self.lookup_field

        assert lookup_url_kwarg in self.kwargs, (
            (self.__class__.__name__, lookup_url_kwarg)
        )

        filter_kwargs = {self.lookup_field: self.kwargs[lookup_url_kwarg]}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        # self.check_object_permissions(self.request, obj)

        return obj

    def get_queryset(self):
        if self.action == 'list':
            if self.request.user.user_type == 1:
                return models.User.objects.all()
            if self.request.user.user_type == 2:
                return models.User.objects.filter(fk_restaurant=self.request.user.fk_restaurant)

        return models.User.objects.none()

    def get_serializer_class(self):
        if self.action == 'list':
            return self.serializer_class
        if self.action == 'create':
            return UserInputSerializer
        if self.action == 'update':
            return UserInputSerializer

    def create(self, request, *args, **kwargs):
        user_type = request.data.get('user_type', 3)
        if int(user_type) == 2:
            restaurant_code = request.data.pop('fk_committee')
            restaurant = selectors.get_restaurant(restaurant_code).pk_restaurant_id
        if int(user_type == 4):
            phone = request.data.get('phone', '')
            password = request.data.get('password', '')
            name = request.data.get('name', '')
            if password is None or password == '':
                raise ValidationError(ValidationError(_(f'Password give is invalid'), ))
            user = get_user_model().objects.create_delivery_agent_user(phone=phone, password=password,
                                                                       name=name)
            delivery_agent = models.DeliveryAgent.objects.create(agent_details=user,
                                                                 vehicle_number='dummy-number',
                                                                 contact_number=user.phone)
            return Response(serialized_user.data, status=status.HTTP_201_CREATED, headers=headers)
        else:
            restaurant = None
        user_serializer = self.get_serializer_class()
        request.data['fk_restaurant'] = restaurant
        serialized_user = user_serializer(data=request.data)
        serialized_user.is_valid(raise_exception=True)
        serialized_user.save()
        headers = self.get_success_headers(serialized_user.data)
        return Response(serialized_user.data, status=status.HTTP_201_CREATED, headers=headers)


def generate_otp(phone):
    if phone:
        otp = random.randint(99999, 999999)
        print(otp)
        return otp


class ListUserView(viewsets.GenericViewSet,
                   mixins.ListModelMixin,
                   mixins.UpdateModelMixin,
                   ):
    serializer_class = UserOutputSerializer
    queryset = models.User.objects.all()
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated, IsAdminUser)

    lookup_field = 'phone'

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        lookup_url_kwarg = self.lookup_url_kwarg or self.lookup_field
        assert lookup_url_kwarg in self.kwargs, (
            (self.__class__.__name__, lookup_url_kwarg)
        )

        filter_kwargs = {self.lookup_field: self.kwargs[lookup_url_kwarg]}
        obj = get_object_or_404(queryset, **filter_kwargs)
        # May raise a permission denied
        # self.check_object_permissions(self.request, obj)

        return obj

    def get_queryset(self):
        if self.action == 'list':
            if self.request.user.user_type == 1:
                return models.User.objects.all()
            if self.request.user.user_type == 2:
                return models.User.objects.filter(fk_restaurant=self.request.user.fk_restaurant)
        if self.action == 'update':
            if self.request.user.user_type == 1:
                return models.User.objects.all()
            if self.request.user.user_type == 2:
                return models.User.objects.filter(fk_restaurant=self.request.user.fk_restaurant)

        return models.User.objects.none()

    def get_serializer_class(self):
        if self.action == 'list':
            return self.serializer_class
        if self.action == 'create':
            return UserInputSerializer
        if self.action == 'update':
            return UserInputSerializer

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        user = self.get_object()
        user_type = request.data.get('user_type', 3)
        if int(user_type) == 2:
            restaurant_code = request.data.pop('fk_restaurant')
            restaurant = selectors.get_restaurant(restaurant_code).pk_restaurant_id
        else:
            restaurant = None
        user_serializer = self.get_serializer_class()
        request.data['fk_restaurant'] = restaurant
        serialized_user = user_serializer(user, data=request.data, partial=True)
        serialized_user.is_valid(raise_exception=True)
        serialized_user.save()
        return Response(serialized_user.data, status=status.HTTP_200_OK)


# class CreateTokenView(ObtainAuthToken):
#     """Create a new auth token for user"""
#     serializer_class = AuthTokenSerializer
#     renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES
#
#     def post(self, request, *args, **kwargs):
#         serializer = self.serializer_class(data=request.data,
#                                            context={'request': request})
#         phone = request.data.get('phone', '')
#         request_otp = request.data.get('otp', '')
#         otp_data = PhoneOTP.objects.filter(phone__iexact=phone)[0]
#
#         if int(otp_data.otp) == int(request_otp):
#             user = selectors.get_user_using_phone(phone)[0]
#             token, created = Token.objects.get_or_create(user=user)
#             services.delete_otp_records(phone)
#             old = PhoneOTP.objects.filter(phone__iexact=phone)
#             old.delete()
#             dct_response = {
#                 'status': 'SUCCESS',
#                 'message': 'User validated',
#                 'token': token.key,
#             }
#             return Response(dct_response, status=status.HTTP_200_OK)
#         dct_response = {
#             'status': 'FAILED',
#             'message': 'Invalid credentials'
#         }
#         return Response(dct_response, status=status.HTTP_400_BAD_REQUEST)


class CreateAdminTokenView(ObtainAuthToken):
    """Create a new auth token for user"""
    serializer_class = AuthTokenSerializer
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        print(request.data)
        if serializer.is_valid():
            user = serializer.validated_data['user']
            if user.user_type in [1, 2, 3, 4, 5]:
                token, created = Token.objects.get_or_create(user=user)
                dct_response = {
                    'status': 'SUCCESS',
                    'message': 'User validated',
                    'token': token.key,
                    'user_type': user.user_type
                }
                return Response(dct_response, status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_401_UNAUTHORIZED)
        print(serializer.errors)

        dct_response = {
            'status': 'FAILED',
            'message': 'Invalid credentials'
        }
        return Response(dct_response, status=status.HTTP_400_BAD_REQUEST)


class CreateRestaurantTokenView(ObtainAuthToken):
    """Create a new auth token for user"""
    serializer_class = AuthTokenSerializer
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        if serializer.is_valid():
            user = serializer.validated_data['user']

            if user.user_type in [1, 2]:
                user.device_fcm_token = request.data.get('fcm_token', '')
                print('------------------------')
                print(request.data)
                user.save()
                token, created = Token.objects.get_or_create(user=user)
                dct_response = {
                    'status': 'SUCCESS',
                    'message': 'User validated',
                    'token': token.key,
                }
                return Response(dct_response, status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_401_UNAUTHORIZED)
        dct_response = {
            'status': 'FAILED',
            'message': 'Invalid credentials'
        }
        return Response(dct_response, status=status.HTTP_400_BAD_REQUEST)


class CreateDeliveryAgentTokenView(ObtainAuthToken):
    """Create a new auth token for user"""
    serializer_class = AuthTokenSerializer
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        if serializer.is_valid():
            user = serializer.validated_data['user']

            if user.user_type in [1, 4]:
                user.device_fcm_token = request.data.get('fcm_token', '')
                user.save()
                token, created = Token.objects.get_or_create(user=user)
                dct_response = {
                    'status': 'SUCCESS',
                    'message': 'User validated',
                    'token': token.key,
                }
                return Response(dct_response, status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_401_UNAUTHORIZED)
        dct_response = {
            'status': 'FAILED',
            'message': 'Invalid credentials'
        }
        return Response(dct_response, status=status.HTTP_400_BAD_REQUEST)


class ManageUserView(generics.RetrieveUpdateAPIView):
    """Manage the authenticated user"""
    serializer_class = UserOutputSerializer
    authentication_classes = (authentication.TokenAuthentication,)
    permission_classes = (permissions.IsAuthenticated,)

    def get_object(self):
        """Retrieve and return authentication user"""
        return self.request.user

#
# class CustomerAccountDetailsViewSet(viewsets.GenericViewSet,
#                                     mixins.CreateModelMixin,
#                                     mixins.ListModelMixin):
#     serializer_class = CustomerDetailSerializer
#     authentication_classes = (authentication.TokenAuthentication,)
#     permission_classes = (permissions.IsAuthenticated,)
#     lookup_field = 'address_code'
#
#     def get_queryset(self):
#         if self.action == 'list':
#             return self.queryset
#         return self.queryset
#
#     def get_serializer_class(self):
#         if self.action == 'add_address':
#             return AddressInputSerializer
#
#     def list(self, request):
#         user = request.user
#         serialized_user = self.serializer_class(user)
#         return Response(serialized_user.data, status=status.HTTP_200_OK)
#
#     @action(methods=['POST'], detail=False, url_path='add-address')
#     def add_address(self, request):
#         response = {
#             'status': 'SUCCESS',
#             'message': ' Address added successfully',
#             'data': '',
#             'error': ''
#         }
#         address_data = request.data.copy()
#         user = request.user
#         address_input_serializer = self.get_serializer_class()
#         zipcode = address_data.pop('zipcode')
#         zipcode_obj = selectors.get_zipcode_obj(zipcode)
#         serialized_address = address_input_serializer(data=address_data)
#
#         if serialized_address.is_valid(raise_exception=True):
#             address_data['fk_created_by'] = user
#             address_data['fk_zipcode'] = zipcode_obj
#             address = services.create_address(address_data)
#             response['data'] = address
#             return Response(response, status=status.HTTP_201_CREATED)
#         response['status'] = 'FAIL',
#         response['message'] = 'Address could not be added'
#
#         response['error'] = serialized_address.errors
#         return Response(response, status=status.HTTP_400_BAD_REQUEST)
#
#     @action(methods=['POST'], detail=True, url_path='delete-address')
#     def delete_address(self, request, **kwargs):
#         response = {
#             'status': 'SUCCESS',
#             'message': 'Address deleted successfully',
#             'error': ''
#         }
#         address_code = kwargs.get('address_code')
#         address = selectors.get_address(address_code, request.user)
#         if address is not None:
#             services.delete_address(address)
#             return Response(response, status=status.HTTP_200_OK)
#         response['status'] = 'FAIL'
#         response['message'] = 'Address not found'
#         return Response(response, status=status.HTTP_404_NOT_FOUND)
#
#     @action(methods=['POST'], detail=False, url_path='add-user-information')
#     def add_user_information(self, request):
#         response = {
#             'status': 'SUCCESS',
#             'message': ' New User Information added successfully',
#             'data': '',
#             'error': ''
#         }
#         account_data = request.data.copy()
#         account_input_serializer = UserAccountInformationSerializer
#         serialized_user_account = account_input_serializer(request.user,data=account_data)
#         if serialized_user_account.is_valid(raise_exception=True):
#             user_account_information = serialized_user_account.save()
#             response['data'] = serialized_user_account.data
#             return Response(response, status=status.HTTP_201_CREATED)
#         response['status'] = 'FAIL',
#         response['message'] = 'User Account Information could not be created'
#         response['error'] = serialized_user_account.errors
#         return Response(response, status=status.HTTP_400_BAD_REQUEST)
