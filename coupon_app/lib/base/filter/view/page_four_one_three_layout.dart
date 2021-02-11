import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/top_deal_with_cart_layout.dart';
import 'package:flutter/material.dart';

class PageFourOneThreeLayout extends StatefulWidget {
  @override
  _PageFourOneThreeLayoutState createState() => _PageFourOneThreeLayoutState();
}

class _PageFourOneThreeLayoutState extends State<PageFourOneThreeLayout>
    with BaseLayout, TickerProviderStateMixin {

  Widget topDealItem(
      int index, List<TopDeal> items, double width, double height) {
    TopDeal item = items[index];
    return TopDealWithCartLayout(item, width, height);
  }

  Widget getBuildBody() {
    double imageWidth = MediaQuery.of(context).size.width - 16;
    List<TopDeal> list = TopDeal.getDummyForMusic();
    return ListView(children: <Widget>[
      topDealItem(0, list, imageWidth, 328),
      SizedBox(
        height: 8,
      ),
      topDealItem(1, list, imageWidth, 328),
      SizedBox(
        height: 8,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return getBuildBody();
  }
}
