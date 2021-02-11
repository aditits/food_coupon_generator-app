import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/models/constant.dart';

import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:coupon_app/screens/scran_qr_screen.dart';
import 'package:coupon_app/screens/vendor_item_list.dart';
import 'package:flutter/material.dart';

class VendorTabAboveLayout extends StatefulWidget {


  @override
  _VendorTabAboveLayoutState createState() => _VendorTabAboveLayoutState();
}

class _VendorTabAboveLayoutState extends State<VendorTabAboveLayout>
    with BaseLayout, TickerProviderStateMixin {
  List<String> bottomNavigationItems = Constants.activityOne;
  Color titleColor=Colors.black;
  Color appBarColor=Colors.white;
  Widget leading = Container();
  List<Widget> action;
  Color labelColor = Colors.black;
  Color unselectedColor = ColorKey.tabGray;



  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
        initialIndex: 0, length: bottomNavigationItems.length, vsync: this);
  }


  dynamic getTitle() {
    return getStringValue(LanguageKey.orderHistory, context);
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Tab getTab(String title) {
    return Tab(
      text: getStringValue(title, context).toUpperCase(),
    );
  }

  List<Widget> getTabView() {
    List<Widget> widgets = new List();
    for(int i=0; i<2; i++){
      widgets.add(Container());
    }

    widgets[0] = VendorItemList();
    widgets[1] = ScanQrScreen();

    return widgets;
  }

  List<Tab> getTabList() {
    List<Tab> widgets = new List();
    List<String> _tabNames = [LanguageKey.items, LanguageKey.redeem];
    for (int i = 0; i < _tabNames.length; i++) {
      widgets.add(getTab(_tabNames[i]));
    }
    return widgets;
  }

  Widget getTabBarView() {
    return TabBarView(
      children: getTabView(),
      controller: tabController,
    );
  }

  Widget getTabBar() {
    return TabBar(
      isScrollable: bottomNavigationItems.length > 3,
      indicatorWeight: 4.0,
      tabs: getTabList(),
      labelColor: labelColor,
      labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      controller: tabController,
      unselectedLabelColor: unselectedColor,
      indicatorColor: ColorKey.cartColor,
    );
  }

  Widget getBuildBody() {
    return getTabBarView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (){
        _onBackPressed();
      },
      child: ScaffoldLayout(
        titleColor: titleColor,
        appBarBackgroundColor: appBarColor,
        appTitle: getTitle(),
        centerTitle: true,
        leading: SizedBox(),
        actions: action,
        bodyData: getBuildBody(),
        bottom: getTabBar(),
      ),
    );
  }

  void _onBackPressed() {
    Navigator.pushNamedAndRemoveUntil(context, "/main", (r) => false);
  }
}
