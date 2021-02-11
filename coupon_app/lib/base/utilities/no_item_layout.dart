
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/utilities/view_utilities.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:flutter/material.dart';

class NoItemLayout extends StatefulWidget {
  @override
  _NoItemLayoutState createState() => _NoItemLayoutState();
}

class _NoItemLayoutState extends State<NoItemLayout>
    with BaseLayout, TickerProviderStateMixin {
  double heightDetail = 154;

  Widget searchIcon() {
    return Container(
      width: 140,
      height: 140,
      decoration: new BoxDecoration(shape: BoxShape.circle, boxShadow: [
        new BoxShadow(
          color: Theme.of(context).dividerColor,
          blurRadius: 20.0,
          spreadRadius: 2.0,
          offset: Offset(
            5.0,
            10.0,
          ),
        )
      ]),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Stack(children: <Widget>[
          Center(
            child: Icon(
              Icons.shopping_basket,
              color: Colors.grey[300],
              size: 70,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Icon(
              Icons.search,
              color: ColorKey.darkGrey,
              size: 60,
            ),
          )
        ]),
      ),
    );
  }

  Widget getHorizontalItem() {
    return Container(
      color: Colors.white,
      height: heightDetail,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: TopDeal.getMostSearched().length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 8,
                    right:
                    index == TopDeal.getMostSearched().length - 1 ? 16 : 8),
                child: getItem(index));
          }),
    );
  }

  Widget getItem(int index) {
    TopDeal item = TopDeal.getMostSearched()[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            item.photo,
            fit: BoxFit.cover,
            width: 96,
            height: 100,
          ),
          Container(
              width: 96,
              color: item.colorOfBoxCard,
              padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              child: Center(
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: item.textColor),
                ),
              ))
        ],
      ),
    );
  }

  Widget getText() {
    return Text(
      getStringValue(LanguageKey.yourRecent, context),
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }

  Widget getBuildBody() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            searchIcon(),
            SizedBox(
              height: 16,
            ),
            getText(),
            SizedBox(
              height: 32,
            ),
            ViewUtilities.firstAndSecondTitle(
                Colors.black,
                getStringValue(LanguageKey.mostSearched, context),
                getStringValue(LanguageKey.clear, context),
                ColorKey.registerBox),
            SizedBox(
              height: 16,
            ),
            getHorizontalItem(),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  getBuildBody();
  }
}
