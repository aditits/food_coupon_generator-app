# Generated by Django 2.2.16 on 2021-02-04 03:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20210204_0351'),
    ]

    operations = [
        migrations.RenameField(
            model_name='coupon',
            old_name='fk_vendor_redeemed',
            new_name='fk_vendor',
        ),
    ]