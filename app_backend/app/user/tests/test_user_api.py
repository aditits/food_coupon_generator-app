# from django.test import TestCase
# from django.contrib.auth import get_user_model
# from django.urls import reverse
#
# from rest_framework.test import APIClient
# from rest_framework import status
#
# CREATE_USER_URL = reverse('user:create-list')
# CUSTOMER_TOKEN_URL = reverse('user:token')
# RESTAURANT_TOKEN_URL = reverse('user:restaurant-token')
# ADMIN_TOKEN_URL = reverse('user:admin-token')
# ME_URL = reverse('user:me')
#
#
# def create_customer(**params):
#     """Creates a user with the given parameters"""
#     return get_user_model().objects.create_customer(**params)
#
#
# def create_admin(**params):
#     """Create admin user with given parameters"""
#     return get_user_model().objects.create_admin_user(**params)
#
#
# def create_restaurant_user(**params):
#     """Create admin user with given parameters"""
#     return get_user_model().objects.create_restaurant_user(**params)
#
#
# class PublicUserApiTests(TestCase):
#     """Test the public user API's"""
#
#     def setUp(self):
#         self.client = APIClient()
#
#     def test_create_valid_user_success(self):
#         """Test creating user with valid payload is successful"""
#         payload = {
#             'phone': '9349121212',
#             'password': 'testpass',
#             'name': 'testname',
#             'user_type': 3,
#             'fk_committee': None
#
#         }
#         res = self.client.post(CREATE_USER_URL, payload, format='json')
#
#         self.assertEqual(res.status_code, status.HTTP_201_CREATED)
#         user = get_user_model().objects.get(**res.data)
#         self.assertTrue(user.check_password(payload['password']))
#         self.assertNotIn('password', res.data)
#
#     def test_user_exists(self):
#         """Test creating an exisitng user fails"""
#
#         payload = {
#             'phone': '9349121212',
#             'password': 'testpass',
#             'name': 'testname',
#             'fk_committee': None
#         }
#
#         create_customer(**payload)
#
#         res = self.client.post(CREATE_USER_URL, payload, format='json')
#         self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
#
#     def test_password_too_short(self):
#         """Test that the password must be more than 5 characters"""
#         payload = {
#             'phone': '9349121212',
#             'password': 'pw',
#             'name': 'Test',
#             'fk_committee': None
#
#         }
#         res = self.client.post(CREATE_USER_URL, payload, format='json')
#
#         self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
#         user_exists = get_user_model().objects.filter(
#             phone=payload['phone']
#         ).exists()
#         self.assertFalse(user_exists)
#
#     # def test_create_token_for_user(self):
#     #     """Test that a token is created for the user"""
#     #     payload = {'phone': '9349121212', 'password': 'testpass'}
#     #     create_customer(**payload)
#     #     res = self.client.post(CUSTOMER_TOKEN_URL, payload)
#     #
#     #     self.assertIn('token', res.data)
#     #     self.assertEqual(res.status_code, status.HTTP_200_OK)
#
#     def test_invalid_phone_number(self):
#         """Test whether the hone number is valid or not"""
#         payload = {'phone': 'aa', 'password': 'testpass', 'name': 'testname', 'fk_committee': None
#                    }
#         create_customer(**payload)
#         res = self.client.post(CREATE_USER_URL, payload, format='json')
#
#         self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
#
#     # def test_create_token_invalid_credentials(self):
#     #     """Test that token is not created if invalid credentials are given"""
#     #     create_customer(phone='9349121212', password="testpass")
#     #     payload = {'phone': '9349121212', 'password': 'wrong'}
#     #     res = self.client.post(CUSTOMER_TOKEN_URL, payload)
#     #
#     #     self.assertNotIn('token', res.data)
#     #     self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
#
#     # def test_create_token_no_user(self):
#     #     """Test that token is not created if user doesn't exist"""
#     #     payload = {'phone': '9349121212', 'password': 'testpass'}
#     #     res = self.client.post(CUSTOMER_TOKEN_URL, payload)
#     #
#     #     self.assertNotIn('token', res.data)
#     #     self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
#
#     # def test_create_token_missing_field(self):
#     #     """Test that phone and password are required"""
#     #     res = self.client.post(CUSTOMER_TOKEN_URL, {'phone': '9020101518', 'password': ''})
#     #     self.assertNotIn('token', res.data)
#     #     self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
#
#     def test_retrieve_user_unauthorized(self):
#         """Test that authentication is required for users"""
#         res = self.client.get(ME_URL)
#
#         self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)
#
#     def test_non_admin_login_as_admin_fail(self):
#         payload = {'name': '9349121212', 'password': 'testpass',
#                    'fk_committee': None
#                    }
#         create_customer(**payload)
#         res = self.client.post(ADMIN_TOKEN_URL, payload, format='json')
#
#         self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)
#
#     def test_customer_login_as_restaurant_user_fail(self):
#         payload = {'name': '9349121212', 'password': 'testpass', 'fk_committee': None
#                    }
#         create_customer(**payload)
#         res = self.client.post(RESTAURANT_TOKEN_URL, payload, format='json')
#
#         self.assertEqual(res.status_code, status.HTTP_401_UNAUTHORIZED)
#
#     def test_admin_login_as_restaurant_user_success(self):
#         payload = {'name': '9349121212', 'password': 'testpass', 'fk_committee': None
#                    }
#         create_admin(**payload)
#         res = self.client.post(RESTAURANT_TOKEN_URL, payload, format='json')
#
#         self.assertIn('token', res.data)
#         self.assertEqual(res.status_code, status.HTTP_200_OK)
#
#
# class PrivateUserApiTests(TestCase):
#     """Test API requests that require authentication"""
#
#     def setUp(self):
#         self.user = create_customer(
#             phone='9349121212',
#             password='testpass',
#             name='name'
#         )
#         self.client = APIClient()
#         self.client.force_authenticate(user=self.user)
#
#     def test_retrieve_profile_success(self):
#         """Test retrieving profile for logged in used"""
#         res = self.client.get(ME_URL)
#
#         self.assertEqual(res.status_code, status.HTTP_200_OK)
#         self.assertEqual(res.data, {
#             'name': self.user.name,
#             'phone': self.user.phone,
#             'fk_committee': None,
#             'user_type': 3,
#             'is_active': True
#         })
#
#     def test_post_me_not_allowed(self):
#         """Test that POST is not allowed on the me url"""
#         res = self.client.post(ME_URL, {})
#
#         self.assertEqual(res.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)
#
#     # def test_update_user_profile(self):
#     #     """Test updating the user profile for authenticated user"""
#     #     payload = {'name': 'new name', 'password': 'newpassword123'}
#     #
#     #     res = self.client.patch(ME_URL, payload, format='json')
#     #
#     #     self.user.refresh_from_db()
#     #     self.assertEqual(self.user.name, payload['name'])
#     #     self.assertTrue(self.user.check_password(payload['password']))
#     #     self.assertEqual(res.status_code, status.HTTP_200_OK)
#
#     def test_list_users(self):
#         """Test listing all the users"""
#         res = self.client.get(CREATE_USER_URL)
