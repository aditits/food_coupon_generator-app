import 'package:coupon_app/models/vendor.dart';
import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  List<Vendor> vendors;
  String itemCode;
  String itemName;
  String description;
  ItemSummary itemCount;
  DateTime createdOn;

  Item({
    this.vendors,
    this.description,
    this.itemCode,
    this.itemName,
    this.createdOn,
    this.itemCount,
  });
}

class ItemSummary{
  int totalCount;

  ItemSummary({this.totalCount});
}