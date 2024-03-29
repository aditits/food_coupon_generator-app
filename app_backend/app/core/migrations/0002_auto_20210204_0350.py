# Generated by Django 2.2.16 on 2021-02-04 03:50

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coupon',
            name='fk_cg_user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='cg_user', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='coupon',
            name='fk_coordinator',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='coordinator', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='coupon',
            name='fk_organizer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='organizer', to=settings.AUTH_USER_MODEL),
        ),
    ]
