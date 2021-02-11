import uuid

from rest_framework.decorators import action
from rest_framework.generics import GenericAPIView, get_object_or_404
from rest_framework.response import Response
from rest_framework import viewsets, mixins, status
import json
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated, BasePermission
from core.models import Coupon, Item, Vendor, User
from rest_framework import generics
from django.contrib.auth.decorators import user_passes_test
from django.db.models import Q
from django.utils.translation import ugettext_lazy as _

from django.core.exceptions import ValidationError

from coupon import serializers, selectors, services


# Create your views here.

class CouponViewSet(viewsets.GenericViewSet):
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication,)
    queryset = Coupon.objects.all()
    serializer_class = serializers.CouponListSerializer
    lookup_field = 'pk_coupon_id'

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
        if self.action == 'get_coupons':
            queryset = Coupon.objects.filter(assigned_to=self.request.user).filter(redeemed=False)
            return queryset
        if self.action == 'get_items':
            queryset = Item.objects.all()
            return queryset
        if self.action == 'get_users':
            if self.request.user.user_type == 1:
                return User.objects.filter(user_type__in=[2, 3])
            if self.request.user.user_type == 2:
                return User.objects.filter(user_type=3)
            if self.request.user.user_type == 3:
                return User.objects.filter(user_type=4)
            queryset = User.objects.all()
            return queryset
        if self.action == 'get_all_users':
            return User.objects.all()
        if self.action == 'assign_coupons':
            if self.request.user.user_type == 1:
                return Coupon.objects.filter(fk_cg_user=None).filter(redeemed=False)
            if self.request.user.user_type == 2:
                return Coupon.objects.filter(fk_coordinator=None).filter(redeemed=False)
            if self.request.user.user_type == 3:
                return Coupon.objects.filter(fk_organizer=None).filter(redeemed=False)
            queryset = Coupon.objects.filter(redeemed=False)
            return queryset
        return Coupon.objects.all()

    def get_serializer_class(self):
        if self.action == 'get_coupons':
            return serializers.CouponListSerializer
        if self.action == 'get_items':
            return serializers.ItemSerializer
        if self.action == 'get_users' or self.action == 'get_all_users':
            return serializers.UserSerializer
        return self.serializer_class

    @action(methods=['GET'], detail=False, url_path='get-coupons')
    def get_coupons(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Fetched Coupons',
        }
        try:
            queryset = self.get_queryset()
            serializer = self.get_serializer_class()
            serialized_data = serializer(queryset, many=True)
            return Response(serialized_data.data, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Coupons could not be fetched"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False, url_path='get-users')
    def get_users(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Fetched Users',
        }
        try:
            queryset = self.get_queryset()
            serializer = self.get_serializer_class()
            serialized_data = serializer(queryset, many=True)
            return Response(serialized_data.data, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Users could not be fetched"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False, url_path='get-all-users')
    def get_all_users(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Fetched Users',
        }
        try:
            queryset = self.get_queryset()
            serializer = self.get_serializer_class()
            serialized_data = serializer(queryset, many=True)
            return Response(serialized_data.data, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Users could not be fetched"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False, url_path='get-items')
    def get_items(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Fetched Items',
        }
        try:
            dct_item_counts = {}
            if request.user.user_type is not 5:
                queryset = self.get_queryset()
                coupons_queryset = Coupon.objects.filter(fk_assigned_to=request.user, redeemed=False,
                                                 shared_to_student=False)
                for i in queryset:
                    item_count = len(coupons_queryset.filter(fk_item=i))
                    dct_item_counts[str(i.item_code)] = {'total_count': item_count}
                serializer = self.get_serializer_class()
                serialized_data = serializer(queryset, many=True)
                for i in serialized_data.data:
                    i['item_count'] = dct_item_counts[i['item_code']]
                return Response(serialized_data.data, status=status.HTTP_200_OK)
            else:
                coupons_queryset = Coupon.objects.filter(fk_vendor=request.user.fk_vendor, redeemed=True,)
                queryset = Item.objects.filter(vendors=request.user.fk_vendor)
                serializer = self.get_serializer_class()
                serialized_data = serializer(queryset, many=True)
                for i in serialized_data.data:
                    i['item_count'] ={'total_count': 0}
                return Response(serialized_data.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Items could not be fetched"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False, url_path='add-coupons')
    def add_coupons(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Coupons Generated',
        }
        try:
            if request.user.user_type == 1:
                item = Item.objects.get(item_code=request.data['item_code'])
                count = request.data['count']
                for i in range(count):
                    Coupon.objects.create(
                        fk_created_by=request.user,
                        fk_assigned_to=request.user,
                        fk_item=item,
                    )
            else:
                raise ValidationError(ValidationError(_(f'User does not have permission to generate coupons'), ))
            return Response('Success', status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Coupons could not be generated"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False, url_path='assign-coupons')
    def assign_coupons(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Coupons Assigned',
        }
        # try:

        username = request.data.get('name', None)
        user = User.objects.get(name=username)
        count = request.data.get('count', 0)
        item_code = request.data.get('item_code', None)
        item = Item.objects.get(item_code=item_code)
        if request.user.user_type == 1 and user.user_type in [2, 3]:
            queryset = Coupon.objects.filter(fk_item=item, fk_cg_user=None, redeemed=False,
                                             shared_to_student=False).values('pk_coupon_id')[:count]
            stripped_queryset = Coupon.objects.filter(pk__in=queryset)
            stripped_queryset.update(fk_assigned_to=user)
            if user.user_type == 2:
                stripped_queryset.update(fk_cg_user=user)
            else:
                stripped_queryset.update(fk_coordinator=user)
        elif request.user.user_type == 2 and user.user_type == 3:
            queryset = Coupon.objects.filter(fk_item=item, fk_coordinator=None, redeemed=False,
                                             shared_to_student=False).values('pk_coupon_id')[:count]
            stripped_queryset = Coupon.objects.filter(pk__in=queryset)
            stripped_queryset.update(fk_assigned_to=user)
            stripped_queryset.update(fk_coordinator=user)
        elif request.user.user_type == 3 and user.user_type == 4:
            queryset = Coupon.objects.filter(fk_item=item, fk_organizer=None, redeemed=False,
                                             shared_to_student=False).values('pk_coupon_id')[:count]
            stripped_queryset = Coupon.objects.filter(pk__in=queryset)
            stripped_queryset.update(fk_assigned_to=user)
            stripped_queryset.update(fk_organizer=user)
        else:
            raise ValidationError(ValidationError(_(f'Transfer permission denied'), ))
        return Response('Success', status=status.HTTP_200_OK)
        # except Exception as e:
        #     response['error'] = str(e)
        #     response['status'] = "FAIL"
        #     response['message'] = "Coupons could not be assigned"
        #     return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False, url_path='get-coupon')
    def get_coupon(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Fetched Coupon',
        }
        try:
            data = request.data
            item = Item.objects.get(item_code=data['item_code'])
            coupons_queryset = Coupon.objects.filter(fk_assigned_to=request.user, redeemed=False,
                                                     fk_item=item, shared_to_student=False)
            coupon = coupons_queryset[0]
            serialized_coupon = serializers.CouponListSerializer(coupon, many=False)
            return Response(serialized_coupon.data, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Coupon could not be fetched"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False, url_path='get-coupon-details')
    def get_coupon_details(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Fetched Coupon',
        }
        try:
            data = request.data
            coupon = Coupon.objects.get(coupon_code=data['coupon_code'])
            serialized_coupon = serializers.CouponListSerializer(coupon, many=False)
            return Response(serialized_coupon.data, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Coupon could not be fetched"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False, url_path='mark-as-shared')
    def mark_as_shared(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Shared coupon with student',
        }
        try:
            data = request.data
            coupon = Coupon.objects.get(coupon_code=data['coupon_code'])
            # name = Coupon.objects.get(coupon_code=data['name'])
            coupon.shared_to_student = not coupon.shared_to_student
            coupon.save()

            return Response(response, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Coupon could not be shared with student"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False, url_path='redeem-coupon')
    def redeem_coupon(self, request, **kwargs):
        response = {
            'status': 'SUCCESS',
            'error': '',
            'message': 'Coupon redeemed',
        }
        try:
            data = request.data
            coupon = Coupon.objects.get(coupon_code=data['coupon_code'])
            # name = Coupon.objects.get(coupon_code=data['name'])
            if not coupon.redeemed:
                coupon.redeemed = True
                coupon.vendor = request.user.fk_vendor
                coupon.save()
            else:
                raise ValidationError(ValidationError(_(f'Coupon Already redeemed'), ))

            return Response(response, status=status.HTTP_200_OK)
        except Exception as e:
            response['error'] = str(e)
            response['status'] = "FAIL"
            response['message'] = "Coupon could not be redeemed"
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

