import 'package:flutter/cupertino.dart';

class Committee with ChangeNotifier{

  String committeeCode;
  String committeeName;
  DateTime createdOn;

  Committee({this.committeeCode, this.committeeName, this.createdOn});
}