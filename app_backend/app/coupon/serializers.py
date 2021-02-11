from core.models import Vendor, Coupon, Item, User, Committee
from rest_framework import serializers


class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model=Item
        fields = ('item_code', 'item_name', 'description')

class VendorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vendor
        fields = ('vendor_code', 'vendor_name')

class CommitteeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Committee
        fields = ('committee_code', 'committee_name')

class UserSerializer(serializers.ModelSerializer):
    committee = CommitteeSerializer(source='fk_committee')
    class Meta:
        model=User
        fields = ('name', 'user_type', 'phone', 'committee')

class CouponListSerializer(serializers.ModelSerializer):
    vendor = VendorSerializer(source='fk_vendor')
    item = ItemSerializer(source='fk_item')
    fk_assigned_to = UserSerializer()
    fk_cg_user = UserSerializer()
    fk_coordinator = UserSerializer()
    fk_organizer = UserSerializer()

    class Meta:
        model = Coupon
        fields = ('coupon_code', 'vendor', 'item', 'fk_assigned_to', 'shared_to_student',
                  'fk_cg_user', 'fk_coordinator', 'fk_organizer')

