import 'package:flutter/material.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';

import 'base_layout.dart';


class BottomButtonLayout extends StatefulWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final Color icon;
  final Widget iconWidget;

  BottomButtonLayout(
      {this.bgColor, this.textColor, this.text, this.icon, this.iconWidget});

  @override
  _BottomButtonLayoutState createState() =>
      _BottomButtonLayoutState(
          this.bgColor, this.textColor, this.text, this.icon, this.iconWidget);
}

class _BottomButtonLayoutState extends State<BottomButtonLayout>
    with BaseLayout {
  Color bgColor;
  Color textColor;
  String text;
  Color icon;
  Widget iconWidget;

  _BottomButtonLayoutState(
      this.bgColor, this.textColor, this.text, this.icon, this.iconWidget);

  Widget getItem() {
    return Container(
      color: bgColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, top: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
            ),
            Expanded(
              child: iconWidget == null
                  ? Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: icon,
                    )
                  : iconWidget,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    init();
    return getItem();
  }

  void init() {
    if (bgColor == null) {
      bgColor = ColorKey.cartColor;
    }
    if (textColor == null) {
      textColor = Colors.black;
    }
    if (text == null || text.isEmpty) {
      text = getStringValue(LanguageKey.proceedCheckout, context);
    }
    if (icon == null) {
      icon = ColorKey.darkGrey;
    }
  }
}
