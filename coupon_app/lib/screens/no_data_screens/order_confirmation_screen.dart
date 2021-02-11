import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_app/layouts/nav_bar_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const routeName = '/order-confirmation';

  @override
  Widget build(BuildContext context) {
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
                      'Order Placed Successfully',
                      style: TextStyle(fontSize: 18),
                    )),

                SizedBox(height: 10,),
                Stack(
                  children: <Widget>[

                    Column(
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Icon(Icons.check_circle,color: Colors.green, size: 120,),
                        SizedBox(height: 30,),
                        Center(
                            child: Text(
                          'Please wait for the restaurant to confirm the order',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                        )),
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
                          onPressed: () {

//                            Navigator.popUntil(context, ModalRoute.withName('/restaurant-list'));
                          },
                          color: Colors.yellow[700],
                          child: Text(
                            'Home',
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
