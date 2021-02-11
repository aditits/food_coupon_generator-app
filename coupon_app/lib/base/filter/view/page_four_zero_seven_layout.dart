
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/grid_item_layout.dart';
import 'package:flutter/material.dart';

class PageFourZeroSevenLayout extends StatefulWidget {
  @override
  _PageFourZeroSevenLayoutState createState() =>
      _PageFourZeroSevenLayoutState();
}

class _PageFourZeroSevenLayoutState extends State<PageFourZeroSevenLayout>
    with BaseLayout, TickerProviderStateMixin {
  Widget getBuildBody() {
    return ListView(children: <Widget>[
      GridItemLayout(
        TopDeal.getDummyForClock(),
        2,
        116,
        true,
        titleSize: 16,
        colorDiscount: ColorKey.discountColor,
      ),
      GridItemLayout(
        TopDeal.getDummyForCamera(),
        2,
        196,
        true,
        colorDiscount: ColorKey.discountColor,
        sizeDiscountedPrice: 20,
        titleSize: 14,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return getBuildBody();
  }
}
