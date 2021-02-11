from django.contrib import auth
from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse

from rest_framework.test import APIClient
from rest_framework import status

class AuthTestCase(TestCase):
    def setUp(self):
        self.u = get_user_model().objects.create_superuser('test@dom.com',  'pass')
        self.u.save()

    def testLogin(self):
        res = self.client.login(username='test@dom.com', password='pass')
        print(res)