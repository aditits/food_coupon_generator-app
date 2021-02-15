from django.contrib.auth import get_user_model, authenticate
from django.utils.translation import ugettext_lazy as _
from core import models
from rest_framework import serializers


class CommitteeSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Committee
        fields = ('committee_code', 'committee_name')


class UserOutputSerializer(serializers.ModelSerializer):
    """Serializer for the users object"""
    fk_committee = CommitteeSerializer()

    class Meta:
        model = get_user_model()
        fields = ('phone', 'password', 'name', 'fk_committee', 'user_type', 'is_active')
        extra_kwargs = {'password': {'write_only': True, 'min_length': 5}}


class UserInputSerializer(serializers.ModelSerializer):
    """Serializer for the users object"""

    class Meta:
        model = get_user_model()
        fields = ('phone', 'password', 'name', 'full_name','fk_committee', 'user_type', 'is_active')
        extra_kwargs = {'password': {'write_only': True, 'min_length': 5}}

    def create(self, validated_data):
        """Create a new user with encrypted password and return it"""
        # phone = validated_data.get('phone')
        # if not phone.isnumeric():
        #     msg = _(f'Incorrect phone number {phone}', )
        #     raise serializers.ValidationError(msg, code='Invalid')
        return get_user_model().objects.create_user(**validated_data)

    def update(self, instance, validated_data):
        """Update a user, setting the password correctly and return it"""
        password = validated_data.pop('password', None)
        user = super().update(instance, validated_data)

        if password:
            user.set_password(password)
            user.save()

        return user


class AuthTokenSerializer(serializers.Serializer):
    """Serializer for the user authentication object"""
    name = serializers.CharField()
    password = serializers.CharField(
        style={'input_type': 'password'},
        trim_whitespace=False
    )

    def validate(self, attrs):
        """Validate and authenticate the user"""
        name = attrs.get('name')
        password = attrs.get('password')
        user = authenticate(
            request=self.context.get('request'),
            username=name,
            password=password
        )
        if not user:
            msg = _('Unable to authenticate with provided credentials')
            raise serializers.ValidationError(msg, code='authentication')

        attrs['user'] = user
        return attrs

