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
from django.contrib.auth import get_user_model


class IsAdminUser(BasePermission):

    def has_permission(self, request, view):
        if request.user.user_type == 1:
            return True
        return False

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
