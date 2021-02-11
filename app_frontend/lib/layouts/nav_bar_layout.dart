import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:coupon_app/screens/nav_bar_layout_items.dart';
import 'package:coupon_app/screens/coupon_list_screen.dart';
import 'package:coupon_app/screens/user_list_screen.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:coupon_app/services/size_config_service.dart';
import 'package:flutter/material.dart';

import 'vendor_tab_above_layout.dart';

class NavBarLayoutScreen extends StatefulWidget {
  static const routeName = '/main';
  final String pageNumber;

  NavBarLayoutScreen({this.pageNumber = 'profile 2'});

  @override
  NavBarLayoutScreenState createState() => NavBarLayoutScreenState();
}

class NavBarLayoutScreenState extends State<NavBarLayoutScreen>
    with BaseLayout, TickerProviderStateMixin {

  bool init = true;
  List<List<Object>> items = new List();
  TabController tabController;
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  bool isReorder=false;
  var storageService = locator<LocalStorageService>();
  int userType;

  @override
  initState() {
    super.initState();
    userType = storageService.userType;
    tabController = TabController(
        length: userType==5?1:2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      if (mounted) setState(() {});
    });
//    CartProvider().setTabController(this.tabController);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Widget> getTabView() {
    List<Widget> widget = new List();
    if(userType!=5) {
      widget.add(CouponListScreen(tabController: this.tabController));

      widget.add(UserListScreen());
    }
    else {
      widget.add(VendorTabAboveLayout());
    }


    return widget;
  }

  Widget getBuildBody() {
    return NavBarLayoutItems(
        items, getTabView(), tabController, false, Colors.black);
  }

  void initBottomItems() {
    items = new List();
    if(userType!=5) {
      items.add(<Object>[
        Icons.local_offer,
        LanguageKey.coupon,
      ]);
      items.add(<Object>[
        Icons.people,
        LanguageKey.user,
      ]);
    }
    else {
      items.add(<Object>[
        Icons.shopping_cart,
        LanguageKey.vendor,
      ]);
    }


  }

  Color getSelectedColor() {
    return Colors.yellow[800];
  }

  Color getUnSelectedColor() {
    return ColorKey.threeColor;
  }

  @override
  Widget build(BuildContext context) {
    if(init){
      SizeConfig().init(context);
      init = false;
    }
    initBottomItems();
    return ScaffoldLayout(
      backGroundColor: ColorKey.bgColor,
      scaffoldKey: drawerKey,
      showAppBar: false,
//      endDrawer:  Drawer(
//              child: MenuFilterLayout(
//              isFromDrawer: true,
//            ))
//          ,
      bodyData: getBuildBody(),
      bottomNavigationBar: NavBarLayoutItems(
        items,
        getTabView(),
        tabController,
        true,
        getSelectedColor(),
        unselectedColor: getUnSelectedColor(),
        showWord: true,
      ),
    );
  }

}
