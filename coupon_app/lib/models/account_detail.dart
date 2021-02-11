import 'package:flutter/cupertino.dart';

class AccountDetail with ChangeNotifier {
  String strUsername;
  String strEmail;

  AccountDetail({
    this.strUsername,
    this.strEmail,
    this.strPhone,
    this.arrAddress,
  });

  String strPhone;
  List<Address> arrAddress;
}

class Address with ChangeNotifier {
  String title;
  String strAddressCode;
  double latitude;
  double longitude;
  String strLocality;
  String strFullAddress;
  String contactNumber;
  String contactName;
  String zipcode;
  String city;
  String state;
  bool isTemporary;

  Address({
    this.strAddressCode,
    this.isTemporary,
      this.title,
      this.latitude,
      this.longitude,
      this.strLocality,
      this.strFullAddress,
      this.contactNumber,
      this.contactName,
      this.zipcode,
      this.city,
      this.state});
}
