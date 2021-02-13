import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:coupon_app/models/coupon.dart';
import 'package:coupon_app/models/item.dart';
import 'package:coupon_app/providers/coupon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class GenerateScreen extends StatefulWidget {
  static const routeName = '/qr-screen';

  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;
  String UUID;
  bool button1;
  GlobalKey globalKey = new GlobalKey();
  Coupon coupon;
  String _dataString = 'null String';
  String name = '';
  Item item = Item(itemName: 'Null');
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    button1 = false;
    print('initi');
    this.getUUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shareScreenshot,
          )
        ],
      ),
      body: _contentWidget(),
    );
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Null> shareScreenshot() async {
    setState(() {
      button1 = true;
    });
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => shareScreenshot());
        return null;
      }
      ui.Image image = await boundary.toImage();
      final directory = (await getExternalStorageDirectory()).path;
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      final RenderBox box = context.findRenderObject();

      var res = Share.shareFiles([imgFile.path],
          subject: 'Share Coupon',
          text: 'Hi ${name}, use this coupon to redeem 1 x ${item.itemName} ',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      print(res);
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
    setState(() {
      button1 = false;
    });
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mark As Shared'),
                    Switch(
                      value: coupon.sharedToStudent,
                      onChanged: (value) async {
                        var response = await CouponProvider()
                            .markSharedWithStudent(coupon);
                        print(response);
                        if (response['status'] == 'SUCCESS') {
                          setState(() {
                            coupon.sharedToStudent = !coupon.sharedToStudent;
                          });
                        } else {
                          showToast('Could not change status');
                        }
                      },
                    ),
                  ],
                ),
                Text(
                  '*note: Coupons once marked as shared cannot be returned',
                  style: TextStyle(color: Colors.redAccent, fontSize: 9),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: _topSectionTopPadding,
              left: 20.0,
              right: 10.0,
              bottom: _topSectionBottomPadding,
            ),
            child: Container(
              height: _topSectionHeight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Enter a student name",
                        errorText: _inputErrorText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: FlatButton(
                      child: Text("SUBMIT"),
                      onPressed: () {
                        setState(() {
                          name = _textController.text;
                          _inputErrorText = null;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
//                      Center(child: Image.asset('assets/mi_logo.jpeg',colorBlendMode: BlendMode.lighten,)),
                      Center(
                        child: Column(
                          children: [
                            Text(name,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            QrImage(
                              data: _dataString,
                              size: 0.3 * bodyHeight,
                            ),
                            Text(
                              '${item.itemName}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getUUid() async {
    Coupon tempCoupon;
    try {
      item = CouponProvider.itemShared;
      tempCoupon = await CouponProvider().getCoupon();
    } catch (error) {
      showToast('No coupons for this item');
      Navigator.of(context).pop();
    }
    print(tempCoupon);
    coupon = tempCoupon;
    _dataString = coupon.couponCode;
    _inputErrorText = null;
    print(_dataString);
    setState(() {});
  }
}
