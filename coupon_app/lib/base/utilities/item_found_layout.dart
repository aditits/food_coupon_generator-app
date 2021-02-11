
import 'package:coupon_app/base/asset/asset_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/models/top_deal.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:flutter/material.dart';

class ItemFoundLayout extends StatefulWidget {
  @override
  _ItemFoundLayoutState createState() => _ItemFoundLayoutState();
}

class _ItemFoundLayoutState extends State<ItemFoundLayout>
    with BaseLayout, TickerProviderStateMixin {
  Widget getItem(List<TopDeal> items, int index) {
    TopDeal item = items[index];
    double size = 40;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    item.title + ' ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    item.hint,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    AssetKey.arrowSearch,
                    width: size,
                    height: size,
                  )
                ],
              ),
            ],
          ),
        ),
        index == items.length - 1
            ? Container()
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Divider(
          height: 0.5,
        ),
            )
      ],
    );
  }

  List<Widget> getList() {
    List<TopDeal> items = TopDeal.getSearch();
    List<Widget> widgets = new List();
    for (int i = 0; i < items.length; i++) {
      widgets.add(getItem(items, i));
    }
    widgets.insert(
        0,
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8, left: 16, right: 16),
          child: Text(getStringValue(LanguageKey.itemFound, context)),
        ));
    return widgets;
  }

  Widget getBuildBody() {
    return ListView(
      children: getList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBuildBody();
  }
}
