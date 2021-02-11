import 'dart:core';

import 'package:coupon_app/models/committee.dart';
import 'package:coupon_app/models/coupon.dart';
import 'package:coupon_app/models/item.dart';
import 'package:coupon_app/models/user.dart';
import 'package:coupon_app/services/http_requests/api_base_helper.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

class CouponProvider with ChangeNotifier {
  ApiBaseHelper _helper = ApiBaseHelper();
  static var storageService = locator<LocalStorageService>();
  static Item item;
  static Item itemShared;

//  GlobalKey<NavigatorState> navigatorKey;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  List<Coupon> _coupons = [];

  Future fetchAndSetCoupons() async {
    const targetUrl = '/coupon/coupons/get-coupons';
    try {
      final response = await _helper.get(url: targetUrl);
      _coupons.clear();
      for (int i = 0; i < response.length; i++) {
        Coupon tempCoupon = Coupon(
          assignedTo: response[i]['assigned_to'],
          cgUser: response[i]['cg_user'],
          coordinator: response[i]['coordinator'],
          couponCode: response[i]['coupon_code'],
          organizer: response[i]['organizer'],
          redeemed: response[i]['redeemed'],
          item: response[i]['item'],
          redeemedFrom: response[i]['redeemed_from'],
          redeemedOn: response[i]['redeemed_on'],
        );
        _coupons.add(tempCoupon);
      }
      return _coupons;

//      _restaurants.sort((a, b) {
//        if (b.isActive) {
//          return 1;
//        }
//        return -1;
//      });

    } catch (error) {
      showToast(error.toString());
    }
  }

  setItem(Item item) {
    CouponProvider.item = item;
  }

  setItemShared(Item item) {
    CouponProvider.itemShared = item;
  }

  Future assignCoupon(int count, User user) async {
    const targetUrl = '/coupon/coupons/assign-coupons/';
    Map payload = {
      'count': count,
      'name': user.username,
      'item_code': CouponProvider.item.itemCode
    };
    try {
      final response = await _helper.post(url: targetUrl, data: payload);
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future redeemCoupon(String couponCode) async {
    const targetUrl = '/coupon/coupons/redeem-coupon/';
    Map payload = {
      'coupon_code': couponCode,
    };
    try {
      final response = await _helper.post(url: targetUrl, data: payload);
      print(response);
      return response;
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future<Coupon> getCoupon() async {
    const targetUrl = '/coupon/coupons/get-coupon/';
    Map<String, String> payload = {'item_code': itemShared.itemCode};
    print(payload);
    try {
      print(payload);
      final response = await _helper.post(url: targetUrl, data: payload);
      Coupon coupon = Coupon(
          couponCode: response['coupon_code'],
          sharedToStudent: response['shared_to_student'],
          item: Item(itemName: response['item']['item_name']),
          assignedTo: User(
              username: response['fk_assigned_to']['name'],
              committee: Committee(
                  committeeName: response['fk_assigned_to']['committee']
                      ['committee_name'])));
      return coupon;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future markSharedWithStudent(Coupon coupon) async {
    const targetUrl = '/coupon/coupons/mark-as-shared/';
    Map payload = {
      'coupon_code': coupon.couponCode,
    };
    try {
      final response = await _helper.post(url: targetUrl, data: payload);
      print(response);
      return response;
    } catch (error) {
      showToast(error.toString());
    }
  }

  Future<Coupon> getCouponDetails(couponCode) async {
    const targetUrl = '/coupon/coupons/get-coupon-details/';
    Map<String, String> payload = {'coupon_code': couponCode};
    print(payload);
    try {
      print(payload);
      final response = await _helper.post(url: targetUrl, data: payload);
      print(response);
      Committee committee = Committee(committeeName: '');
      if (response['fk_assigned_to']['committee'] != null) {
        committee = Committee(
            committeeName: response['fk_assigned_to']['committee']
                ['committee_name']);
      }
      Coupon coupon = Coupon(
        couponCode: response['coupon_code'],
        sharedToStudent: response['shared_to_student'],
        item: Item(itemName: response['item']['item_name']),
        assignedTo: User(
          username: response['fk_assigned_to']['name'],
          committee: committee
        ),
      );
      return coupon;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
