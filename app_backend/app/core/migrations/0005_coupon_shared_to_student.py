# Generated by Django 2.2.16 on 2021-02-08 05:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20210204_0352'),
    ]

    operations = [
        migrations.AddField(
            model_name='coupon',
            name='shared_to_student',
            field=models.BooleanField(default=False),
        ),
    ]