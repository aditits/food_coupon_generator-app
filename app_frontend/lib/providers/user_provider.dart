import 'dart:core';

import 'package:coupon_app/models/committee.dart';
import 'package:coupon_app/models/item.dart';
import 'package:coupon_app/models/user.dart';
import 'package:coupon_app/services/http_requests/api_base_helper.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

class UserProvider with ChangeNotifier {
  ApiBaseHelper _helper = ApiBaseHelper();
  static var storageService = locator<LocalStorageService>();

//  GlobalKey<NavigatorState> navigatorKey;
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  List<User> _users = [];

  static Map<int,String> userTypes = {
    1:'Admin',
    2:'Core Group',
    3: "Coordinator",
    4: "Organizer",
    5: "Vendor",
  };

  Future fetchAndSetUsers() async {
    const targetUrl = '/coupon/coupons/get-users/';
//    const targetUrl = '/admin-user/restaurant/';
    try {
      final response = await _helper.get(url: targetUrl);
      print(response);
      _users.clear();
      for (int i = 0; i < response.length; i++) {
        print(response[i]);
        Map committee = response[i]['committee'];
        Committee committee_obj;
        print(response[i]['name']);

        if(committee!=null) {
          committee_obj = Committee(
            committeeCode: committee['committee_code'],
            committeeName: committee['committee_name'],
          );
        }
        else{
          committee_obj= null;
        }
        User tempItem = User(
        phone: response[i]['phone'],
        committee: committee_obj,
        userType: userTypes[response[i]['user_type']],
        username: response[i]['name'],
          allottedCoupons: 0
        );
        _users.add(tempItem);
      }
      return _users;

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
  Future fetchAndSetAllUsers() async {
    const targetUrl = '/coupon/coupons/get-all-users/';
    try {
      final response = await _helper.get(url: targetUrl);
      _users.clear();
      for (int i = 0; i < response.length; i++) {
        Map committee;
        if(response[i]['committee']!=null){
          committee = response[i]['committee'];
        }
        else{
          committee = {'committee_name':''};
        }
        Committee committee_obj;

        if(committee!=null) {
          committee_obj = Committee(
            committeeCode: committee['committee_code'],
            committeeName: committee['committee_name'],
          );
        }
        else{
          committee_obj= null;
        }
        User tempItem = User(
            phone: response[i]['phone'],
            fullName: response[i]['full_name'],
            committee: committee_obj,
            userType: userTypes[response[i]['user_type']],
            username: response[i]['name'],
            allottedCoupons: 0
        );
        _users.add(tempItem);
      }
      return _users;


    } catch (error) {
      showToast(error.toString());
    }
  }




}
