import 'package:coupon_app/base/asset/asset_key.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/utilities/view_utilities.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:flutter/material.dart';


class EmptyCartScreen extends StatefulWidget {
  @override
  _EmptyCartScreenState createState() => _EmptyCartScreenState();
}

class _EmptyCartScreenState extends State<EmptyCartScreen> with BaseLayout {
  TabController tabController;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _onBackPressed();
      },
      child: ScaffoldLayout(
        backGroundColor: ColorKey.bgColor,
        titleColor: Colors.black,
        appBarBackgroundColor: Colors.white,
        leading: SizedBox(),
        centerTitle: true,
        appTitle: getStringValue(LanguageKey.cart, context),
        showAppBar: true,
        bodyData: CartEmptyLayout(AssetKey.f92, tabController),
      ),
    );
  }

  void _onBackPressed() {
    Navigator.pushNamedAndRemoveUntil(context, "/main", (r) => false);
  }
}
class CartEmptyLayout extends StatefulWidget {
  final String image;
  TabController tabController;
  CartEmptyLayout(this.image, this.tabController);

  @override
  _CartEmptyLayoutState createState() => _CartEmptyLayoutState();
}

class _CartEmptyLayoutState extends State<CartEmptyLayout> with BaseLayout {
  Widget getItem(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(widget.image,width: 128, height: 128,),
        SizedBox(height: 32,),
        Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left:16.0, right:16),
                child: new RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                       TextSpan(
                          text: getStringValue(LanguageKey.yourDontHave, context),
                          style: new TextStyle(
                            color: Colors.black,
                          )),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: FlatButton(
                onPressed: (){
                  widget.tabController.animateTo(0);
                },
                child: Text('Start Ordering', style: TextStyle(color: Colors.blueAccent),),
              ),
            ),
          ],
        ),
      ],);
  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      backGroundColor: Colors.transparent,
      showAppBar: false,
      bodyData: getItem(),
    );
  }
}

