import uuid
import os
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, \
    PermissionsMixin
from django.conf import settings
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _
from django.core.validators import RegexValidator
import datetime


# Create your models here.

class UserManager(BaseUserManager):

    def create_user(self, name, password=None, **extra_fields):
        """Creates and saves a new user"""
        if not name:
            raise ValueError('Users must have a Phone number')
        user = self.model(name=name, **extra_fields)
        data = extra_fields.copy()
        user_type = data.get('user_type', None)
        if user_type is None:
            user.user_type = 3
        user.set_password(password)
        user.fk_committee = None
        user.fk_vendor = None
        user.save(using=self._db)

        return user

    def create_superuser(self, name, password):
        """Creates and saves a new super user"""
        user = self.create_user(name, password, )
        user.is_superuser = True
        user.is_staff = True
        user.user_type = 1

        user.save(using=self._db)

        return user

    def create_cg_user(self, name, password,  **extra_fields):
        """Creates and saves a new restaurant user"""
        user = self.create_user(name, password, **extra_fields)
        user.is_staff = True
        user.user_type = 2
        user.fk_committee = None
        user.save(using=self._db)

        return user

    def create_admin_user(self, name, password, **extra_fields):
        """Creates and saves a new admin_user user"""
        user = self.create_user(name, password, **extra_fields)
        user.user_type = 1
        user.save(using=self._db)

        return user

    def create_coordinator(self, name, password, **extra_fields):
        """Creates and saves a new admin_user user"""
        user = self.create_user(name, password, **extra_fields)
        user.user_type = 3
        user.save(using=self._db)

        return user

    def create_organizer(self, name, password, **extra_fields):
        """Creates and saves a new Delivery Agent User"""
        user = self.create_user(name, password, **extra_fields)
        user.user_type = 4
        user.name = name
        user.save(using=self._db)

        return user

    def create_vendor(self, phone, password, name, **extra_fields):
        """Creates and saves a new Delivery Agent User"""
        user = self.create_user(phone, password, **extra_fields)
        user.user_type = 5
        user.name = name
        user.save(using=self._db)

        return user


class User(AbstractBaseUser, PermissionsMixin):
    """Custom user model that supports using phone instead of username"""

    USER_TYPE_CHOICES = (
        (1, 'admin'),
        (2, 'core_group'),
        (3, 'coordinator'),
        (4, 'organizer'),
        (5, 'vendor'),
    )
    name = models.CharField(max_length=255, unique=True)
    full_name = models.CharField(max_length=255)
    phone = models.CharField(max_length=55, unique=True, null=True, blank=True)
    user_type = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES)  # Refer USER_TYPE_CHOICES
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    fk_committee = models.ForeignKey('Committee', null=True, blank=True, on_delete=models.PROTECT)
    fk_vendor = models.ForeignKey('Vendor', null=True, blank=True, on_delete=models.PROTECT)
    # device_fcm_token = models.CharField(max_length=255, null=True, blank=True)
    # fk_cart = models.OneToOneField('Cart', null=True, blank=True, on_delete=models.PROTECT)
    created_on = models.DateTimeField(auto_now_add=True)
    objects = UserManager()

    USERNAME_FIELD = 'name'

    class Meta:
        managed = True
        db_table = 'User'


class Committee(models.Model):
    pk_committee_id = models.BigAutoField(primary_key=True)
    committee_code = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    committee_name = models.CharField(max_length=150)
    fk_created_by = models.ForeignKey('User', on_delete=models.PROTECT)
    created_on = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.committee_name

    class Meta:
        managed = True
        db_table = 'Committee'


class Vendor(models.Model):
    pk_vendor_id = models.BigAutoField(primary_key=True)
    vendor_code = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    vendor_name = models.CharField(max_length=150)
    fk_created_by = models.ForeignKey('User', on_delete=models.PROTECT)
    created_on = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.vendor_name

    class Meta:
        managed = True
        db_table = 'Vendor'


class Item(models.Model):
    pk_item_id = models.BigAutoField(primary_key=True)
    vendors = models.ManyToManyField(Vendor, related_name='items')
    item_code = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    item_name = models.CharField(max_length=100)
    description = models.CharField(max_length=255)
    is_deleted = models.BooleanField(default=False)
    fk_created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    created_on = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.item_name

    class Meta:
        managed = True
        db_table = 'Item'


class Coupon(models.Model):
    pk_coupon_id = models.BigAutoField(primary_key=True)
    coupon_code = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    fk_created_by = models.ForeignKey('User', on_delete=models.PROTECT)
    fk_assigned_to = models.ForeignKey('User', on_delete=models.PROTECT,
                                       related_name='assigned_to', null=True)
    fk_cg_user = models.ForeignKey('User', on_delete=models.PROTECT,
                                   related_name='cg_user', null=True, blank=True)
    fk_coordinator = models.ForeignKey('User', on_delete=models.PROTECT,
                                       related_name='coordinator', null=True, blank=True)
    fk_organizer = models.ForeignKey('User', on_delete=models.PROTECT,
                                     related_name='organizer', null=True, blank=True)
    fk_item = models.ForeignKey('Item', on_delete=models.CASCADE)
    shared_to_student = models.BooleanField(default=False)
    redeemed = models.BooleanField(default=False)
    created_on = models.DateTimeField(auto_now_add=True)
    redeemed_on = models.DateTimeField(null=True, blank=True)
    fk_vendor = models.ForeignKey('Vendor', on_delete=models.CASCADE, null=True, blank=True)



    class Meta:
        managed = True
        db_table = 'Coupon'
