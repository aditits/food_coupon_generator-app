
import 'package:flutter/material.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization//app_localization.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/custom_slider.dart';
import 'package:sprintf/sprintf.dart';

class PageFourZeroSixLayout extends StatefulWidget {
  final bool isFromDrawer;

  PageFourZeroSixLayout({this.isFromDrawer = true});

  @override
  PageFourZeroSixLayoutState createState() => PageFourZeroSixLayoutState();
}

class PageFourZeroSixLayoutState extends State<PageFourZeroSixLayout>
    with BaseLayout, TickerProviderStateMixin {
  double percent = 0.7;
  double initial = 0;
  double percentage = 0;
  double height;

  @override
  void initState() {
    super.initState();
  }

  void checkTheValue() {
    setState(() {});
  }

  Widget getCustomStar(int index) {
    double currentIndexPercent = (0.20 * index);
    return Icon(
      Icons.star,
      size: 24,
      color: percent >= currentIndexPercent
          ? ColorKey.cartColor
          : ColorKey.textSecondary,
    );
  }

  Widget customSlider() {
    return Container(
      padding: widget.isFromDrawer
          ? EdgeInsets.only(top: 60.0, bottom: 60, right: 16, left: 16)
          : null,
      child: Stack(
        children: <Widget>[
//          LinearPercentIndicator(
//            lineHeight: 50.0,
//            percent: percent,
//            padding: EdgeInsets.symmetric(horizontal: 24),
//            backgroundColor: Colors.transparent,
//            progressColor: ColorKey.registerBox,
//          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getCustomStar(1),
                getCustomStar(2),
                getCustomStar(3),
                getCustomStar(4),
                getCustomStar(5),
              ],
            ),
          ),
          CustomSlider(
            sliderHeight: 50,
            onChanged: (double value) {
              setState(() {
                percent = value;
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 24),
            progressColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget getColumn() {
    String pts = (5 * percent).toStringAsFixed(1);
    return ListView(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      children: <Widget>[
        Container(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                getStringValue(LanguageKey.from, context) + ' ',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                sprintf(getStringValue(LanguageKey.pts, context), [pts]),
                style: TextStyle(color: ColorKey.registerBox, fontSize: 20),
              ),
            ],
          ),
        ),
        widget.isFromDrawer
            ? Material(
                type: MaterialType.card,
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: customSlider(),
                ),
              )
            : customSlider(),
      ],
    );
  }

  static Widget getButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: RaisedButton(
              color: ColorKey.registerBox,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  AppLocalization.getStringsValue(context, LanguageKey.raised),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
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
      child: getColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    height = height / (widget.isFromDrawer ? 1 : 2);
    height = height / 3 * 1.2;
    return getBuildBody();
  }
}
