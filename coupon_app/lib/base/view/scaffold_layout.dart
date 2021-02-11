import 'package:coupon_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coupon_app/base/color/color_key.dart';


class ScaffoldLayout extends StatelessWidget {
  final showAppBar;
  final appTitle;
  final Widget bodyData;
  final backGroundColor;
  final appBarBackgroundColor;
  final leading;
  final List<Widget> actions;
  final automaticallyImplyLeading;
  final bottomNavigationBar;
  final bottom;
  final centerTitle;
  final floatingActionButton;
  final titleColor;
  final endDrawer;
  final scaffoldKey;
  final elevation;

  ScaffoldLayout(
      {this.appTitle,
      this.scaffoldKey,
      this.titleColor = Colors.black,
      this.floatingActionButton,
      this.bodyData,
      this.leading,
      this.bottom,
      this.centerTitle = false,
      this.backGroundColor = Colors.white,
      this.appBarBackgroundColor,
      this.actions,
      this.endDrawer,
      this.bottomNavigationBar,
      this.showAppBar = true,
      this.automaticallyImplyLeading = true,
      this.elevation = 4.0});

  Widget getAndroidAppBar(context, actions, automaticallyImplyLeading, leading,
      appBarBackgroundColor, appTitle, centetTitle,
      {elevation, titleColor =  Colors.black, bottom}) {
    return AppBar(
      actions: actions,
      bottom: bottom,
      centerTitle: centetTitle,
      elevation: elevation,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading
          ? leading == null ? iconBackButton(context) : leading
          : null,
      backgroundColor: appBarBackgroundColor,
      title: appTitle is String
          ? Text(
              appTitle == null ? "" : appTitle,
              style: TextStyle(fontWeight: FontWeight.bold, color: titleColor),
            )
          : appTitle,
    );
  }

  static Widget iconBackButton(BuildContext context, {Color buttonColor}) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: buttonColor == null ? ColorKey.iconBlue : buttonColor,
        ),
        onPressed: () {
          Navigator.maybePop(context);
        },
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: endDrawer,
      backgroundColor: backGroundColor != null ? backGroundColor : null,
      floatingActionButton: floatingActionButton,
      appBar: !showAppBar
          ? null
          : getAndroidAppBar(
              context,
              this.actions,
              this.automaticallyImplyLeading,
              this.leading,
              appBarBackgroundColor,
              appTitle,
              centerTitle,
              elevation: this.elevation, bottom: this.bottom, titleColor: titleColor),
      drawer: AppDrawer(),

      body: bodyData,
      bottomNavigationBar: this.bottomNavigationBar,
    );
  }
}
