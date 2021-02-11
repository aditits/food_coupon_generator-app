import 'dart:io';

import 'package:coupon_app/base/view/scaffold_layout.dart';
import 'package:coupon_app/services/size_config_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coupon_app/base/asset/asset_key.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:coupon_app/providers/authentication_provider.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:oktoast/oktoast.dart';

class LoginScreen extends StatefulWidget {
  static const routeName ='/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with BaseLayout, TickerProviderStateMixin {
  double iconSocialSize = 64;
  double usernameWidth;
  bool _isLoading = false;
  GlobalKey usernameKey = new GlobalKey<_LoginScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _userName;
  String _password;
  String _strFcmToken;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getHeight();
    });
  }


  void getHeight() {
    if (mounted)
      setState(() {
        if (usernameKey.currentContext != null &&
            usernameKey.currentContext.size != null &&
            usernameKey.currentContext.size.width != null) {
          usernameWidth = usernameKey.currentContext.size.width;
        }
      });
  }
  void _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    Map _credentials ={
      'username': _userName,
      'password': _password,
      'fcm_token': _strFcmToken
    };
    print(_credentials);
    var response;
    try {
      response = await AuthenticationProvider().authenticate(_credentials);
      print(response);
      if(response['status']=='SUCCESS'){
        var storageService = locator<LocalStorageService>();
        storageService.setRegisteredPhoneNumber(_userName);
        storageService.setIsLoggedIn(true);
        storageService.setValidationToken("Token ${response['token']}");
        storageService.setUserType(response['user_type']);
        Navigator.of(context).pushReplacementNamed('/main');
      }
    }catch(error){
      showToast(error.toString());
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget getBuildBody() {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    double screenWidth = SizeConfig.screenWidth;
    double dashEmpty = 16;
    double sizeWidth =
        (screenWidth - (usernameWidth == null ? 0 : usernameWidth) - dashEmpty * 2) /
            2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(height: SizeConfig.screenHeight,
            alignment: Alignment.center, padding: EdgeInsets.only(bottom: bottom),
            // constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage("assets/an.jpeg"),
                    image: AssetImage(AssetKey.login_screen_image),
                    fit: BoxFit.fitHeight)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            'MI Login',
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 3,//25
                                fontWeight: FontWeight.w500,color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25, //30
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: TextFormField(
                            initialValue:_userName ==null?'':_userName,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.white),
                              // hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                              // hintText: '1234567890',
                              prefixIcon:Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                                child: Icon(Icons.person),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  borderSide: BorderSide(color:Colors.white),
                                  gapPadding: 10
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color:Colors.white),
                                gapPadding: 10,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color:Colors.white),
                                gapPadding: 10,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color:Colors.white),
                                gapPadding: 10,
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid username';
                              }
                              // else if (int.tryParse(value) == null) {
                              //   return 'Please enter a valid username';
                              // }
                            },
//                          inputFormatters: <TextInputFormatter>[
//                            WhitelistingTextInputFormatter.digitsOnly,
//                            LengthLimitingTextInputFormatter(10),
//                          ],
                            onSaved: (value) {
                              _userName = value;
                            },
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              paste: true,
                            ),
//                          keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 5,   //15
                        ),
                        ListTile(
                          title: TextFormField(obscureText: true,
                            initialValue:_password ==null?'':_password,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              // hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                              // hintText: 'sd54sa@',
                              prefixIcon:Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                                child: Icon(Icons.lock_outline),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  borderSide: BorderSide(color:Colors.white),
                                  gapPadding: 10
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color:Colors.white),
                                gapPadding: 10,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color:Colors.white),
                                gapPadding: 10,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(color:Colors.white),
                                gapPadding: 10,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid password';
                              }
                            },
                            onSaved: (value) {
                              print(value);
                              _password = value;
                            },
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              paste: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,   //25
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              padding: EdgeInsets.symmetric(vertical:0,horizontal:25 ),
                              onPressed: () {
                                //forgot password screen
                              },
                              textColor: Colors.white,
                              child: Text('Forgot Password',),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                          // const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          const EdgeInsets.fromLTRB(10,0,10,0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),

                                  child: FlatButton(
                                    onPressed: () {
                                      _submit();
                                    },
                                    color: Colors.white,
                                    child: Text('LOGIN',style: TextStyle(color: Colors.black),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScaffoldLayout(
      showAppBar: false,
//      actions: ViewUtilities.getActionList(context, Colors.black, Colors.black),
//      leading: ViewUtilities.getIconMenu(context, Colors.black),
      appBarBackgroundColor: Colors.white,
//      appTitle: getStringValue(LanguageKey.myStore, context),
      bodyData: getBuildBody(),
    );
  }
}
