
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/utilities/view_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sprintf/sprintf.dart';

import 'base_layout.dart';

class TopDealLayout extends StatefulWidget {
  final TopDeal item;
  final double width;
  final double height;
  final double sizeDiscountedPrice;
  final FontWeight isDiscountedPriceMediumBold;
  final Color colorOriginalPrice;
  final Color colorDiscount;
  final bool isCard;
  final double boxHeight;
  final double titleSize;
  final FontWeight titleFontWeight;
  final FontWeight ratingFontWeight;

  TopDealLayout(this.item, this.width, this.height,
      {this.colorOriginalPrice,
      this.colorDiscount,
      this.sizeDiscountedPrice = 14,
      this.isDiscountedPriceMediumBold = FontWeight.w500,
      this.isCard = false,
      this.boxHeight,
      this.titleSize = 16,
      this.titleFontWeight = FontWeight.normal,
      this.ratingFontWeight = FontWeight.normal});

  @override
  State<StatefulWidget> createState() {
    return TopDealLayoutState(
        this.item,
        this.width,
        this.height,
        this.sizeDiscountedPrice,
        this.isDiscountedPriceMediumBold,
        this.colorOriginalPrice,
        this.colorDiscount,
        this.isCard,
        this.boxHeight,
        this.titleSize,
        this.titleFontWeight,
        this.ratingFontWeight);
  }
}

class TopDealLayoutState extends State<TopDealLayout> with BaseLayout {
  TopDeal item;
  double width;
  double height;
  double sizeDiscountedPrice;
  FontWeight isDiscountedPriceMediumBold;
  Color colorOriginalPrice;
  Color colorDiscount;
  bool isCard;
  double boxHeight;
  double titleSize;
  FontWeight titleFontWeight;
  FontWeight ratingFontWeight;

  TopDealLayoutState(
      this.item,
      this.width,
      this.height,
      this.sizeDiscountedPrice,
      this.isDiscountedPriceMediumBold,
      this.colorOriginalPrice,
      this.colorDiscount,
      this.isCard,
      this.boxHeight,
      this.titleSize,
      this.titleFontWeight,
      this.ratingFontWeight);

  @override
  void initState() {
    super.initState();
    if (colorOriginalPrice == null)
      colorOriginalPrice = ColorKey.textSecondary;
    if (colorDiscount == null)
      colorDiscount = ColorKey.discountColor;
  }

  Widget topDealColumn(
      TopDeal item,
      double width,
      double height,
      double sizeDiscountedPrice,
      Color colorOriginalPrice,
      Color colorDiscount) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset(
              item.photo,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
            item.icon != null
                ? Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white.withOpacity(0.6)),
                      child: Icon(
                        item.icon,
                        size: 16,
                        color: ColorKey.loveColor,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        item.caption == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                width: width,
                child: Text(
                  item.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: ColorKey.trailingColor),
                ),
              ),
        item.title == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                width: width,
                child: Text(
                  item.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: titleFontWeight,
                    fontSize: titleSize,
                  ),
                ),
              ),
        item.html == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                width: width,
                child: Html(
                  defaultTextStyle: TextStyle(fontSize: 14),
                  data: item.html,
                ),
              ),
        item.discountedPrice == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  sprintf(getStringValue(LanguageKey.usDollar, context),
                      [item.discountedPrice]),
                  style: TextStyle(
                      fontSize: sizeDiscountedPrice,
                      color: Colors.black,
                      fontWeight: isDiscountedPriceMediumBold),
                ),
              ),
        item.price == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  item.price,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorKey.threeColor,
                  ),
                ),
              ),
        item.originalPrice == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      sprintf(getStringValue(LanguageKey.usDollar, context),
                          [item.originalPrice]),
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: colorOriginalPrice),
                    ),
                    Text(
                      ' · ',
                      style: TextStyle(
                          fontSize: 12, color: ColorKey.textSecondary),
                    ),
                    item.discount == null
                        ? Container()
                        : Text(
                            item.discount +
                                getStringValue(
                                    LanguageKey.discountOff, context),
                            style:
                                TextStyle(fontSize: 12, color: colorDiscount),
                          ),
                  ],
                ),
              ),
        item.rating == null
            ? Container()
            : Container(
                padding: EdgeInsets.only(top: 8),
                child: ViewUtilities.getRating(item.rating, ColorKey.cartColor,
                    ratingFontWeight: ratingFontWeight)),
        item.otherDiscount == null
            ? Container()
            : Container(
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: ColorKey.cartColor,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                  child: Text(
                    item.otherDiscount +
                        getStringValue(LanguageKey.discountOff, context),
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                )),
        !item.todayTop
            ? Container()
            : Container(
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: ColorKey.registerBox,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                  child: Text(
                    getStringValue(LanguageKey.todayTop, context),
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                )),
      ],
    );
  }

  Widget topDealItem(
      TopDeal item,
      double width,
      double height,
      double sizeDiscountedPrice,
      Color colorOriginalPrice,
      Color colorDiscount) {
    return !isCard
        ? Container(
            height: boxHeight,
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: topDealColumn(item, width, height, sizeDiscountedPrice,
                colorOriginalPrice, colorDiscount))
        : Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: topDealColumn(item, width, height, sizeDiscountedPrice,
                    colorOriginalPrice, colorDiscount)));
  }

  @override
  Widget build(BuildContext context) {
    return topDealItem(
        item,
        width,
        height,
        sizeDiscountedPrice,
        colorOriginalPrice,
        colorDiscount);
  }
}
