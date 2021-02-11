
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/utilities/common_utilities.dart';
import 'package:coupon_app/base/view/top_detail_layout.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:flutter/material.dart';

import 'base_layout.dart';

class GridItemLayout extends StatefulWidget {
  final List<TopDeal> items;
  final int crossAxisCount;
  final double imageHeight;
  final double sizeDiscountedPrice;
  final bool innerWhite;
  final Color colorDiscount;
  final double titleSize;
  final FontWeight titleFontWeight;
  final FontWeight isDiscountedPriceMediumBold;
  final FontWeight ratingFontWeight;

  GridItemLayout(
      this.items, this.crossAxisCount, this.imageHeight, this.innerWhite,
      {this.colorDiscount = Colors.black,
      this.sizeDiscountedPrice = 14,
      this.titleSize = 12,
      this.titleFontWeight = FontWeight.normal,
      this.isDiscountedPriceMediumBold = FontWeight.w500,
      this.ratingFontWeight = FontWeight.normal});

  @override
  _GridItemLayoutState createState() => _GridItemLayoutState(
      this.items,
      this.crossAxisCount,
      this.imageHeight,
      this.sizeDiscountedPrice,
      this.innerWhite,
      this.colorDiscount,
      this.titleSize,
      this.titleFontWeight,
      this.isDiscountedPriceMediumBold,
      this.ratingFontWeight);
}

class _GridItemLayoutState extends State<GridItemLayout> with BaseLayout {
  double imageWidth = 300;
  double boxHeight;
  GlobalKey boxKey = new GlobalKey<_GridItemLayoutState>();

  List<TopDeal> items;
  int crossAxisCount;
  double imageHeight;
  double sizeDiscountedPrice;
  bool innerWhite;
  Color colorDiscount;
  double titleSize;
  FontWeight titleFontWeight;
  FontWeight isDiscountedPriceMediumBold;
  FontWeight ratingFontWeight;

  _GridItemLayoutState(
      this.items,
      this.crossAxisCount,
      this.imageHeight,
      this.sizeDiscountedPrice,
      this.innerWhite,
      this.colorDiscount,
      this.titleSize,
      this.titleFontWeight,
      this.isDiscountedPriceMediumBold,
      this.ratingFontWeight);

  Widget getGridView() {
    int position = 0;
    return Container(
      color: innerWhite ? null : Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          key: boxKey,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((e) {
            Widget w = Padding(
              padding: EdgeInsets.only(
                  left: position == 0 ? 8.0 : 4,
                  right: position == items.length - 1 ? 8.0 : 4),
              child: TopDealLayout(
                e,
                imageWidth,
                imageHeight,
                sizeDiscountedPrice: sizeDiscountedPrice,
                boxHeight: boxHeight,
                colorDiscount: colorDiscount,
                titleSize: titleSize,
                titleFontWeight: titleFontWeight,
                isDiscountedPriceMediumBold: isDiscountedPriceMediumBold,
                ratingFontWeight: ratingFontWeight,
              ),
            );
            position++;
            return w;
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getGridView();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sizeDiscountedPrice =
        sizeDiscountedPrice == null ? 0.0 : sizeDiscountedPrice;
    imageHeight = imageHeight == null ? 0.0 : imageHeight;
    innerWhite = innerWhite == null ? false : innerWhite;
    crossAxisCount =
        crossAxisCount == null ? 2 : crossAxisCount;
    imageWidth = CommonUtilities.getImageWidth(context, crossAxisCount);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getHeight();
    });
  }

  void getHeight() {
    if (mounted)
      setState(() {
        if (boxKey.currentContext != null &&
            boxKey.currentContext.size != null &&
            boxKey.currentContext.size.height != null) {
          boxHeight = boxKey.currentContext.size.height;
          print(boxHeight.toString());
        }
      });
  }
}
