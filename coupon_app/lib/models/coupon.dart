import 'package:coupon_app/models/user.dart';
import 'package:coupon_app/models/vendor.dart';
import 'package:flutter/cupertino.dart';

import 'item.dart';

class Coupon with ChangeNotifier {
  String couponCode;
  int count;
  User assignedTo;
  User cgUser;
  User coordinator;
  User organizer;
  Item item;
  bool redeemed;
  bool sharedToStudent;
  DateTime redeemedOn;
  Vendor redeemedFrom;

  Coupon({
    this.count,
    this.item,
    this.sharedToStudent,
    this.couponCode,
    this.assignedTo,
    this.cgUser,
    this.coordinator,
    this.organizer,
    this.redeemed,
    this.redeemedOn,
    this.redeemedFrom,
  });
}
