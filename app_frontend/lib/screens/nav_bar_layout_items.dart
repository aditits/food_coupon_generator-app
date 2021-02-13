
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/app_localization.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:flutter/material.dart';



class NavBarLayoutItems extends StatefulWidget {
  final List<List<Object>> bottomNavItems;
  final List<Widget> tabView;
  final TabController tabController;
  final bool isTabBar;
  final Color labelColor;
  final Color unselectedColor;
  final bool showWord;

  NavBarLayoutItems(this.bottomNavItems, this.tabView, this.tabController,
      this.isTabBar, this.labelColor,
      {this.unselectedColor = Colors.transparent, this.showWord = true});

  @override
  _NavBarLayoutItemsState createState() => _NavBarLayoutItemsState();
}

class _NavBarLayoutItemsState extends State<NavBarLayoutItems>
    with BaseLayout {
  Tab getTab(IconData iconData, String title, int index) {
    bool isSelected = index == widget.tabController.index;
    return Tab(
      text: widget.showWord
          ? isSelected
              ? AppLocalization.getStringsValue(context, title)
              : widget.unselectedColor == Colors.transparent
                  ? ''
                  : AppLocalization.getStringsValue(context, title)
          : null,
      icon: Icon(
        iconData,
        color: isSelected ? widget.labelColor : ColorKey.textSecondary,
      ),
    );
  }

  List<Tab> getTabList() {
    List<Tab> list = new List();

    for (int i = 0; i < widget.bottomNavItems.length; i++) {
      List<Object> item = widget.bottomNavItems[i];
      list.add(getTab(item[0], item[1], i));
    }
    return list;
  }

  Widget getTabBarView() {
    return TabBarView(
      children: widget.tabView,
      controller: widget.tabController,
    );
  }

  Widget getTabBar() {
    return TabBar(
      indicatorWeight: 1.0,
      tabs: getTabList(),
      labelColor: widget.labelColor,
      labelStyle: TextStyle(fontSize: 14.0),
      labelPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      controller: widget.tabController,
      unselectedLabelColor: widget.unselectedColor,
      indicatorColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTabBar ? getTabBar() : getTabBarView();
  }
}
