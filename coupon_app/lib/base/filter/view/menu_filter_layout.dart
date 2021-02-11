import 'package:flutter/material.dart';
import 'package:coupon_app/base/filter/view/page_four_zero_five_layout.dart';
import 'package:coupon_app/base/filter/view/page_four_zero_six_layout.dart';
import 'package:coupon_app/base/filter/view/page_four_zero_three_layout.dart';
import 'package:coupon_app/base/filter/view/page_four_zero_two_layout.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';

class MenuFilterLayout extends StatefulWidget {
  final bool isFromDrawer;

  MenuFilterLayout({this.isFromDrawer = true});

  @override
  MenuFilterLayoutState createState() => MenuFilterLayoutState();
}

class MenuFilterLayoutState extends State<MenuFilterLayout>
    with BaseLayout, TickerProviderStateMixin {
  Widget page;
  String languageKey = LanguageKey.filtering;
  String title;

  @override
  void initState() {
    super.initState();
    page = PageFourZeroTwoLayout(this, isFromDrawer: widget.isFromDrawer);
  }

  void onBackPressed(String languageKey) {
    setState(() {
      this.languageKey = languageKey;
      print(this.languageKey);
      if (languageKey == null || languageKey.isEmpty) {
        Navigator.pop(context);
        return;
      }
      if (languageKey == LanguageKey.colors) {
        page = PageFourZeroThreeLayout(isFromDrawer: widget.isFromDrawer);
      }
//      else if (languageKey == LanguageKey.filtering) {
//        page = PageFourZeroTwoLayout(this, isFromDrawer: widget.isFromDrawer);
//      }
      else if (languageKey == LanguageKey.priceRange) {
        page = PageFourZeroFiveLayout(isFromDrawer: widget.isFromDrawer);
      } else if (languageKey == LanguageKey.rating) {
        page = PageFourZeroSixLayout(isFromDrawer: widget.isFromDrawer);
      } else {
        Navigator.pop(context);
      }
    });
  }

  Widget getButton() {
    if (languageKey == LanguageKey.colors) {
      return PageFourZeroThreeLayoutState.getButton(
          context, widget.isFromDrawer);
    } else if (languageKey == LanguageKey.filtering) {
      return PageFourZeroTwoLayoutState.getButton(context);
    } else if (languageKey == LanguageKey.priceRange) {
      return PageFourZeroFiveLayoutState.getButton(context);
    } else if (languageKey == LanguageKey.rating) {
      return PageFourZeroSixLayoutState.getButton(context);
    } else {
      return Container();
    }
  }

  Widget getDrawerTitle(String title, Widget leading, BuildContext context) {
    return SafeArea(
      child: Material(
          type: MaterialType.card,
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(children: <Widget>[
              leading,
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
          )
      ),
    );
  }

  void handleBackPressed() {
    if (languageKey != LanguageKey.filtering) {
      languageKey = LanguageKey.filtering;
    } else {
      languageKey = "";
    }
    onBackPressed(languageKey);
  }

  @override
  Widget build(BuildContext context) {
    languageKey = languageKey.isEmpty ? LanguageKey.filtering : languageKey;
    title = getStringValue(languageKey, context);
    return WillPopScope(
      onWillPop: () {
        handleBackPressed();
        return Future.value(false);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            getDrawerTitle(
                title,
                IconButton(
                  onPressed: handleBackPressed,
                  icon: Icon(languageKey == LanguageKey.filtering
                      ? Icons.arrow_back
                      : Icons.clear),
                ),
                context),
            page,
            getButton(),
          ],
        ),
      ),
    );
  }
}
