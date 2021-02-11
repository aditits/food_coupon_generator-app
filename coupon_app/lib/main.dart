import 'package:coupon_app/providers/authentication_provider.dart';
import 'package:coupon_app/providers/coupon_provider.dart';
import 'package:coupon_app/screens/login_screen.dart';
import 'package:coupon_app/screens/no_data_screens/order_confirmation_screen.dart';
import 'package:coupon_app/screens/qr_screen.dart';
import 'package:coupon_app/screens/redeeem_screen.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:time_machine/time_machine.dart';

import 'base/color/color_key.dart';
import 'base/localization/app_localization_delegate.dart';
import 'base/models/constant.dart';
import 'layouts/nav_bar_layout.dart';
import 'screens/coupon_share_screen.dart';

//import 'templates/base/app_lib.dart';

void main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // runApp(MyApp());
    await setupLocator();
    runApp(StoreApp());
  } catch (error) {
    print('Error: Locator setup has Failed');
  }
  await TimeMachine.initialize({'rootBundle': rootBundle});
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  static var storageService = locator<LocalStorageService>();
  static bool _isLoggedIn = storageService.isLoggedIn;
  final GlobalKey<NavigatorState> navigatorKey = AuthenticationProvider.navigatorKey;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CouponProvider(),
        ),
      ],
      child: OKToast(
        child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizationDelegate(Constants.english),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Constants.english, // English
            ],
            title: Constants.appName,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: ColorKey.iconBlue)),
                primaryColor: ColorKey.primaryColor,
                canvasColor: Colors.transparent),
            home: _isLoggedIn ? NavBarLayoutScreen() : LoginScreen(),
            routes: {
              LoginScreen.routeName: (ctx) => LoginScreen(),
              // '/login'
              NavBarLayoutScreen.routeName: (ctx) => NavBarLayoutScreen(),
              // '/main'
              CouponShareScreen.routeName: (ctx) => CouponShareScreen(),
//              '/add-address'
              OrderConfirmationScreen.routeName: (ctx) => OrderConfirmationScreen(),
              //'/order-confirmation'
              GenerateScreen.routeName: (ctx) => GenerateScreen(),
              RedeemScreen.routeName: (ctx) => RedeemScreen(),
              //'/order-confirmation'
            }),
      ),
    );
  }
}
