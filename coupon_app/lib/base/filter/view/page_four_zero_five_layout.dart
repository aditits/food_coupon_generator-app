import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coupon_app/base/asset/asset_key.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization//app_localization.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';

class PageFourZeroFiveLayout extends StatefulWidget {
  final bool isFromDrawer;
  PageFourZeroFiveLayout({this.isFromDrawer = true});

  @override
  PageFourZeroFiveLayoutState createState() => PageFourZeroFiveLayoutState();
}

class PageFourZeroFiveLayoutState extends State<PageFourZeroFiveLayout>
    with BaseLayout, TickerProviderStateMixin {
  int max = 54983;
  int min = 256;
  int lowerValue;
  int upperValue;
  TextEditingController fromController;
  TextEditingController toController;
  double height;
  FocusNode fromFocusNode;
  FocusNode toFocusNode;

  @override
  void initState() {
    super.initState();
    lowerValue = min;
    upperValue = max;
    fromController = new TextEditingController(text: min.toString());
    toController = new TextEditingController(text: max.toString());
    fromFocusNode = new FocusNode();
    toFocusNode = new FocusNode();
    fromFocusNode.addListener(() {
      setState(() {});
    });
    toFocusNode.addListener(() {
      setState(() {});
    });
  }

  void checkTheValue() {
    setState(() {
      lowerValue = int.parse(fromController.text == null ? 0 : fromController.text);
      if (lowerValue < min || lowerValue > max) {
        fromController.text = min.toString();
        lowerValue = min;
      }
      upperValue = int.parse(toController.text == null ? 0 : toController.text);
      if (upperValue < min || upperValue > max) {
        toController.text = max.toString();
        upperValue = max;
      }
    });
  }

  Widget getTextField(TextEditingController controller, FocusNode focusNode) {
    return TextField(
      style: TextStyle(
          fontSize: 16,
          color: focusNode.hasFocus ? Colors.black : ColorKey.trailingColor),
      keyboardType: TextInputType.number,
      controller: controller,
      focusNode: focusNode,
      onSubmitted: (value) {
        checkTheValue();
      },
      onEditingComplete: () {
        checkTheValue();
      },
      onTap: () {
        checkTheValue();
      },
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorKey.textSecondary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorKey.cartColor),
          ),
          prefix: Text(
            '\$',
            style: TextStyle(
                fontSize: 16,
                color:
                    focusNode.hasFocus ? Colors.black : ColorKey.trailingColor),
          )
      ),
    );
  }

  Widget priceRange() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                getStringValue(LanguageKey.minPrice, context),
                style: TextStyle(fontSize: 12),
              ),
              Text(
                getStringValue(LanguageKey.maxPrice, context),
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: getTextField(fromController, fromFocusNode)),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Image.asset(
                  AssetKey.arrowRight,
                  width: 24,
                  height: 24,
                ),
              ),
              Expanded(child: getTextField(toController, toFocusNode)),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
//        SliderTheme(
//          data: SliderTheme.of(context).copyWith(
//            activeTrackColor: ColorKey.cartColor,
//            inactiveTrackColor: ColorKey.textSecondary,
//            thumbColor: ColorKey.registerBox,
//          ),
//          child: frs.RangeSlider(
//            min: min.toDouble(),
//            max: max.toDouble(),
//            lowerValue: lowerValue.toDouble(),
//            upperValue: upperValue.toDouble(),
//            showValueIndicator: true,
//            valueIndicatorMaxDecimals: 1,
//            onChanged: (low, high) {
//              setState(() {
//                lowerValue = low.toInt();
//                fromController.text = lowerValue.toString();
//                upperValue = high.toInt();
//                toController.text = upperValue.toString();
//              });
//            },
//          ),
//        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget getColumn() {
    return ListView(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      children: <Widget>[
        Container(
          height: height,
          child: widget.isFromDrawer
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '256 ',
                      style:
                          TextStyle(color: ColorKey.registerBox, fontSize: 20),
                    ),
                    Text(
                      getStringValue(LanguageKey.itemsFound, context),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )
              : Container(),
        ),
        widget.isFromDrawer ?
        Material(
          type: MaterialType.card,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: priceRange(),
          ),
        )
      : priceRange(),
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
