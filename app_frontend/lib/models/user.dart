import 'package:coupon_app/models/committee.dart';
import 'package:coupon_app/models/vendor.dart';
import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String username;
  String fullName;
  String phone;
  String userType;
  Committee committee;
  Vendor vendor;
  int allottedCoupons;
  DateTime createdOn;

  User({
    this.username,
    this.fullName,
    this.allottedCoupons,
    this.phone,
    this.userType,
    this.committee,
    this.createdOn,
  });
}
