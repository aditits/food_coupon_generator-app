from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext as _

from core import models

class UserAdmin(BaseUserAdmin):
    ordering = ['id']
    list_display = ['phone', 'name', 'fk_committee', 'user_type',  'fk_vendor']
    fieldsets = (
        (None, {'fields': ('name', 'password')}),
        (_('Personal Info'), {'fields': ('phone', 'fk_committee', 'user_type')}),
        (
            _('Permissions'),
            {'fields': ('is_active', 'is_staff', 'is_superuser')}
        ),
        (_('Important dates'), {'fields': ('last_login',)})
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('name', 'password1', 'password2', 'user_type', 'fk_committee', 'fk_vendor')
        }),
    )
admin.site.register(models.User, UserAdmin)
admin.site.register(models.Committee)
admin.site.register(models.Vendor)
admin.site.register(models.Item)
admin.site.register(models.Coupon)
