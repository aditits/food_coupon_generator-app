


import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/utilities/search_layout.dart';
import 'package:flutter/material.dart';

import 'navigation_slide_transition_utilities.dart';

class ViewUtilities {
  static Widget getDivider(BuildContext context) {
    return Container(
      color: ColorKey.textSecondary,
      height: 0.5,
      width: MediaQuery.of(context).size.width,
    );
  }

  static List<Widget> getActionList(
      BuildContext context, Color searchColor, Color cartColor,
      {bool showSearchIcon = true, bool showCartIcon = true}) {
    return [
      !showSearchIcon ? Container() : getIconSearch(context, searchColor),
      !showCartIcon ? Container() : getIconCart(context, cartColor)
    ];
  }

  static Widget getIconSearch(BuildContext context, Color searchColor,
      {bool enableClick = true}) {
    return IconButton(
      onPressed: () {
        if (enableClick)
          NavigationSlideTransitionUtilities.pushNavigation(
              context, SearchLayout());
      },
      icon: Icon(Icons.search),
      color: searchColor,
    );
  }

  static Widget getIconCart(BuildContext context, Color cartColor) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.shopping_cart),
      color: cartColor,
    );
  }

  static Widget getIconMenu(BuildContext context, Color color) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
        Navigator.pop(context);
//        Navigator.pop(context);
      },
      icon: Icon(Icons.menu),
      color: color,
    );
  }

  static Widget firstAndSecondTitle(
    Color textColor,
    String first,
    String second,
    Color secondColor, {
    double firstSize = 20,
    double secondSize = 14,
    FontWeight firstFontWeight = FontWeight.w500,
    FontWeight secondFontWeight = FontWeight.w500,
    Icon firstIcon,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                first,
                style: TextStyle(
                    color: textColor,
                    fontSize: firstSize,
                    fontWeight: firstFontWeight),
              ),
              firstIcon == null ? Container() : firstIcon,
              Expanded(
                child: Container(),
              ),
              Text(
                second,
                style: TextStyle(
                    color: secondColor,
                    fontWeight: secondFontWeight,
                    fontSize: secondSize),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget getRating(String rate, Color colorOfStar, {FontWeight ratingFontWeight = FontWeight.normal}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          size: 12,
          color: colorOfStar,
        ),
        Icon(
          Icons.star,
          size: 12,
          color: colorOfStar,
        ),
        Icon(
          Icons.star,
          size: 12,
          color: colorOfStar,
        ),
        Icon(
          Icons.star,
          size: 12,
          color: colorOfStar,
        ),
        Icon(
          Icons.star,
          size: 12,
          color: ColorKey.textSecondary,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          rate,
          style: TextStyle(fontSize: 10, color: ColorKey.textSecondary, fontWeight: ratingFontWeight),
        ),
      ],
    );
  }

  static Widget getHeart(double heightDetail) {
    return Positioned(
        bottom: heightDetail - 35,
        right: 16,
        child: InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 35,
            backgroundColor: ColorKey.registerBox,
            child: Icon(
              Icons.lightbulb_outline,
              color: Colors.white,
            ),
          ),
        ));
  }
}
