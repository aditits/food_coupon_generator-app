from django.contrib.auth import get_user_model
from user import selectors
from django.core.exceptions import ValidationError
from core import models


def create_new_customer(phone):
    user = get_user_model().objects.create_user(phone, 'dummypass')
    return user


def create_address(address_data):
    address = models.Address.objects.create(
        fk_created_by=address_data['fk_created_by'],
        fk_zipcode=address_data['fk_zipcode'],
        address_title=address_data['address_title'],
        contact_number=address_data['contact_number'],
        contact_name=address_data['contact_name'],
        full_address=address_data['full_address'],
        locality=address_data['locality'],
        latitude=address_data['latitude'],
        longitude=address_data['longitude'],
    )
    return address.address_code


def delete_address(address):
    address.delete()

def delete_otp_records(phone):
    errors = []
    queryset  = models.PhoneOTP.objects.all()
    otp_records = queryset.filter(phone=phone)
    try:
        for otp_record in otp_records:
            otp_record.delete()
    except Exception as e:
        errors.append(e)
