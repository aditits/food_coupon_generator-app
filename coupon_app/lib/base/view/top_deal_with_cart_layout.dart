
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/utilities/view_utilities.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import 'base_layout.dart';

class TopDealWithCartLayout extends StatefulWidget {
  final TopDeal item;
  final double width;
  final double height;

  TopDealWithCartLayout(this.item, this.width, this.height);

  @override
  State<StatefulWidget> createState() {
    return TopDealWithCartLayoutState();
  }
}

class TopDealWithCartLayoutState extends State<TopDealWithCartLayout>
    with BaseLayout {

  Widget topDealItem(TopDeal item, double width, double height){
    return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(8),
        child: topDealColumn(item, width, height));
  }
  Widget topDealColumn(TopDeal item, double width, double height) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(children: <Widget>[
          Image.asset(
            item.photo,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  color: item.colorOfBoxCard,
                  borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: item.colorOfCart,
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Text(
            item.title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          sprintf(getStringValue(LanguageKey.usDollar, context),
              [item.discountedPrice]),
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            ViewUtilities.getRating(item.rating, ColorKey.cartColor),
            Expanded(
              child: Container(),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 24,
                color: ColorKey.textSecondary,
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return topDealItem(widget.item, widget.width, widget.height);
  }
}
