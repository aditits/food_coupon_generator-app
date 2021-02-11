
import 'package:coupon_app/base/asset/asset_key.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/utilities/view_utilities.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:flutter/material.dart';

class PurpleToolbarLayout extends StatefulWidget {
  final Widget body;
  final Color colorSearch;
  final Color colorCart;
  final Widget bottom;
  final bool showSearchIcon;
  final bool showCartIcon;

  PurpleToolbarLayout(this.body,
      {this.colorCart = Colors.white,
      this.colorSearch = Colors.white,
      this.bottom,
      this.showSearchIcon = true,
      this.showCartIcon = true});

  @override
  _PurpleToolbarLayoutState createState() => _PurpleToolbarLayoutState();
}

class _PurpleToolbarLayoutState extends State<PurpleToolbarLayout>
    with BaseLayout, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      appBarBackgroundColor: ColorKey.registerBox,
      backGroundColor: ColorKey.bgColor,
      appTitle: Center(
        child: Image.asset(
          AssetKey.mystoreGreen,
          width: 117,
          height: 28,
        ),
      ),
      actions: ViewUtilities.getActionList(
          context, widget.colorSearch, widget.colorCart,
          showSearchIcon: widget.showSearchIcon,
          showCartIcon: widget.showCartIcon),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.white,
        ),
      ),
      bodyData: widget.body,
      bottom: widget.bottom,
    );
  }
}
