import 'dart:math';

import 'package:flutter/material.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization//app_localization.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/list_tile_layout.dart';

class PageFourZeroThreeLayout extends StatefulWidget {
  final bool isFromDrawer;

  PageFourZeroThreeLayout({this.isFromDrawer = false});

  @override
  PageFourZeroThreeLayoutState createState() => PageFourZeroThreeLayoutState();
}

class PageFourZeroThreeLayoutState extends State<PageFourZeroThreeLayout>
    with BaseLayout, TickerProviderStateMixin {
  List<TopDeal> items = new List();

  Widget getColorIcon(Color color) {
    double size = 24;
    return Transform.rotate(
      angle: -pi / 4,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
          border:
              color == null ? Border.all(color: Colors.black, width: 2) : null,
        ),
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> list = new List();
    list.add(SizedBox(height: 8));
    for (int i = 0; i < items.length; i++) {
      TopDeal item = items[i];
      list.add(ListTileLayout(
        getColorIcon(item.colorOfBoxCard),
        item.title,
        null,
        !item.isMoveTo
            ? Text(
                item.hint,
                style: TextStyle(fontSize: 16, color: ColorKey.trailingColor),
              )
            : Icon(
                Icons.check,
                size: 16,
                color: widget.isFromDrawer
                    ? ColorKey.cartColor
                    : ColorKey.registerBox,
              ),
        isWrapWithCard: widget.isFromDrawer ? item.isMoveTo : false,
        isWrapBorder: widget.isFromDrawer ? false : item.isMoveTo,
        borderColor: widget.isFromDrawer ? null : ColorKey.registerBox,
        onTap: () {
          setState(() {
            item.isMoveTo = !item.isMoveTo;
          });
        },
      ));
    }
    list.add(SizedBox(
      height: 16,
    ));
    return list;
  }

  static Widget getButton(BuildContext context, bool isFromDrawer) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: isFromDrawer
                ? RaisedButton(
                    color: ColorKey.registerBox,
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        AppLocalization.getStringsValue(
                            context, LanguageKey.apply),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  )
                : FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: ColorKey.switchInactiveColor)),
                    onPressed: () {},
                    child: Text(
                      AppLocalization.getStringsValue(
                          context, LanguageKey.hide),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget getBuildBody() {
    return Expanded(
        child: MediaQuery.removePadding(
          removeTop: true,
          removeBottom: true,
          context: context,
          child: ListView(
            children: getList(),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBuildBody();
  }

  @override
  void initState() {
    super.initState();
    items = TopDeal.getColor();
  }
}
