import 'package:flutter/cupertino.dart';

class Vendor with ChangeNotifier{

  String vendorCode;
  String vendorName;

  Vendor({this.vendorCode, this.vendorName});
}