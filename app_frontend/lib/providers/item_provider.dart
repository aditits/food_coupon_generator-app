import 'dart:core';

import 'package:coupon_app/models/item.dart';
import 'package:coupon_app/models/user.dart';
import 'package:coupon_app/services/http_requests/api_base_helper.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

class ItemProvider with ChangeNotifier {
  ApiBaseHelper _helper = ApiBaseHelper();
  static var storageService = locator<LocalStorageService>();


  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  List<Item> _items = [];
  List<User> _users = [];

  Future fetchAndSetItems() async {
    const targetUrl = '/coupon/coupons/get-items/';
    try {
      final response = await _helper.get(url: targetUrl);
      print(response);
      _items.clear();
      for (int i = 0; i < response.length; i++) {
        Item tempItem = Item(
            itemCode: response[i]['item_code'],
            description: response[i]['description']!=null?response[i]['description']:'no description',
            itemName: response[i]['item_name'],
            itemCount: ItemSummary(totalCount: response[i]['item_count']['total_count']));
        _items.add(tempItem);
      }
      return _items;

    } catch (error) {
      showToast(error.toString());
    }
  }

  Future createCoupons(int count, String itemCode)async{
    const targetUrl = '/coupon/coupons/add-coupons/';
    Map<String, dynamic> payload = {
      'count': count,
      'item_code': itemCode
    };
    try{
      final response = await _helper.post(url: targetUrl, data: payload);
      print(response);
    }
    catch(error){
      showToast(error.toString());
    }
  }

  Future getUSers(int count, String itemCode)async{
    const targetUrl = '/coupon/coupons/get-users/';

    try{
      final response = await _helper.get(url: targetUrl);
      print(response);
    }
    catch(error){
      showToast(error.toString());
    }
  }

}
