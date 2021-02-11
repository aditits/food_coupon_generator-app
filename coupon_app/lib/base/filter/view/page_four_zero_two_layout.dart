
import 'package:flutter/material.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/app_localization.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/list_tile_layout.dart';
import 'package:sprintf/sprintf.dart';

import 'menu_filter_layout.dart';

class PageFourZeroTwoLayout extends StatefulWidget {
  final MenuFilterLayoutState state;
  final bool isFromDrawer;

  PageFourZeroTwoLayout(this.state, {this.isFromDrawer = true});

  @override
  PageFourZeroTwoLayoutState createState() => PageFourZeroTwoLayoutState();
}

class PageFourZeroTwoLayoutState extends State<PageFourZeroTwoLayout>
    with BaseLayout, TickerProviderStateMixin {
  bool displayResultSwitch = true;
  bool showDiscountSwitch = false;
  bool yourOptionSwitch = false;

  List<Widget> getList() {
    List<Widget> list = new List();
    list.add(SizedBox(height: 8));
    list.add(
      ListTileLayout(
          null,
          getStringValue(LanguageKey.category, context),
          getStringValue(LanguageKey.narrow, context),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorKey.iconColor,
            size: 16,
          )),
    );
    widget.isFromDrawer
        ? Container()
        : list.add(
            ListTileLayout(
              null,
              getStringValue(LanguageKey.itemConditions, context),
              getStringValue(LanguageKey.usedVintage, context),
              Icon(
                Icons.cancel,
                size: 20,
                color: Colors.black,
              ),
              colorSubtitle: ColorKey.registerBox,
              isWrapBorder: true,
              borderColor: ColorKey.textSecondary,
            ),
          );
    !widget.isFromDrawer
        ? Container()
        : list.add(
            ListTileLayout(
              null,
              getStringValue(LanguageKey.rating, context),
              sprintf(getStringValue(LanguageKey.andAbove, context), ['3.5']),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorKey.iconColor,
                size: 16,
              ),
              onTap: () {
                widget.state.onBackPressed(LanguageKey.rating);
              },
            ),
          );
    list.add(
      ListTileLayout(
        null,
        getStringValue(LanguageKey.colors, context),
        getStringValue(LanguageKey.anyColor, context),
        Icon(
          Icons.arrow_forward_ios,
          color: ColorKey.iconColor,
          size: 16,
        ),
        onTap: () {
          widget.state.onBackPressed(LanguageKey.colors);
        },
      ),
    );
    list.add(
      ListTileLayout(
          null,
          getStringValue(LanguageKey.shipping, context),
          getStringValue(LanguageKey.allDelivery, context),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorKey.iconColor,
            size: 16,
          )),
    );
    list.add(
      ListTileLayout(
        null,
        getStringValue(LanguageKey.priceRange, context),
        !widget.isFromDrawer
            ? getStringValue(LanguageKey.anyPrice, context)
            : sprintf(getStringValue(LanguageKey.fromTo, context),
                ['\$200', '\$54,985']),
        Icon(
          !widget.isFromDrawer ? Icons.arrow_forward_ios : Icons.cancel,
          size: widget.isFromDrawer ? 22 : 16,
          color: widget.isFromDrawer ? Colors.black : ColorKey.iconColor,
        ),
        colorSubtitle: !widget.isFromDrawer
            ? ColorKey.textSecondary
            : ColorKey.registerBox,
        isWrapWithCard: widget.isFromDrawer,
        onTap: () {
          widget.state.onBackPressed(LanguageKey.priceRange);
        },
      ),
    );
    list.add(
      ListTileLayout(
        null,
        getStringValue(LanguageKey.displayOnlyResults, context),
        null,
        Switch(
          value: displayResultSwitch,
          activeColor: ColorKey.registerBox,
          activeTrackColor: ColorKey.switchInactiveColor,
          onChanged: (value) {
            setState(() {
              displayResultSwitch = value;
            });
          },
        ),
      ),
    );
    list.add(
      ListTileLayout(
        null,
        getStringValue(LanguageKey.showDiscounts, context),
        null,
        Switch(
          value: showDiscountSwitch,
          activeColor: ColorKey.registerBox,
          activeTrackColor: ColorKey.switchInactiveColor,
          onChanged: (value) {
            setState(() {
              showDiscountSwitch = value;
            });
          },
        ),
      ),
    );
    list.add(
      ListTileLayout(
        null,
        getStringValue(LanguageKey.yourOption, context),
        null,
        Switch(
          value: yourOptionSwitch,
          activeColor: ColorKey.registerBox,
          activeTrackColor: ColorKey.switchInactiveColor,
          onChanged: (value) {
            setState(() {
              yourOptionSwitch = value;
            });
          },
        ),
      ),
    );
    list.add(
      SizedBox(
        height: 16,
      ),
    );
    return list;
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
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: ColorKey.switchInactiveColor)),
              onPressed: () {},
              child: Text(
                AppLocalization.getStringsValue(context, LanguageKey.reset),
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
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: ColorKey.registerBox,
                onPressed: () {},
                child: Text(
                  AppLocalization.getStringsValue(context, LanguageKey.save),
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
      child: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: ListView(
          children: getList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBuildBody();
  }
}
