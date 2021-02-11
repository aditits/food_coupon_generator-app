from django.contrib.auth import get_user_model
from core import models
from user import services
from django.core.exceptions import ValidationError



def get_user_using_phone(phone):
    queryset = get_user_model().objects.all()
    user = queryset.filter(phone=phone)
    return user

def get_zipcode_obj(zipcode):
    queryset = models.Zipcode.objects.all()

    zipcode_queryset = queryset.filter(zipcode=zipcode)

    if len(zipcode_queryset) !=0:
        return zipcode_queryset[0]
    else:
        return None

def get_address(address_code, user):
    queryset = models.Address.objects.all()
    address_queryset = queryset.filter(fk_created_by=user, address_code=address_code)
    if len(address_queryset) != 0:
        return address_queryset[0]
    else:
        return None

def get_restaurant(restaurant_code):
    queryset = models.Restaurant.objects.all()
    restaurant_queryset = queryset.filter(restaurant_code=restaurant_code)
    if len(restaurant_queryset) != 0:
        return restaurant_queryset[0]
    else:
        return None
