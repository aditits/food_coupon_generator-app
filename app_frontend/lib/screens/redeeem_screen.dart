import 'package:coupon_app/models/coupon.dart';
import 'package:coupon_app/providers/coupon_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedeemScreen extends StatelessWidget {
  static const routeName = '/redeem-screen';

  @override
  Widget build(BuildContext context) {
    final Coupon coupon = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Spacer(),
            Column(
              children: <Widget>[
                Center(
                    child: Text(
                      "Coupon for 1 x ${coupon.item.itemName}",
                      style: TextStyle(fontSize: 18),
                    )),

                SizedBox(height: 10,),
                Stack(
                  children: <Widget>[

                    Column(
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Icon(Icons.restaurant,color: Colors.green, size: 120,),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                          onPressed: () async{
                            var response = await CouponProvider().redeemCoupon(coupon.couponCode);
                            if(response['status']=='SUCCESS') {
                              Navigator.of(context).pop();
                            }

                          },
                          color: Colors.yellow[700],
                          child: Text(
                            'Redeem',
                            style: TextStyle(fontSize: 18,color: Colors.black54),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
