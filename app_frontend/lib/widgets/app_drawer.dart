import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:flutter/material.dart';





class AppDrawer extends StatelessWidget {
  TabController tabController;
//  TabController tabController = CartProvider().getTabController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(height: 50,),
                ListTile(
                  leading: Icon(Icons.home,color: Colors.yellow[900],),
                  title: Text('Home',),
                  onTap: () {
                    Navigator.of(context).pop();
                    tabController.animateTo(0);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.timer,color: Colors.yellow[900]),
                  title: Text('Your Orders'),
                  onTap: () {
                    Navigator.of(context).pop();
                    tabController.animateTo(1);
                  },
                ),
//            ListTile(
//              leading: Icon(Icons.chat_bubble_outline),
//              title: Text('Get help'),
//              onTap: () {
//                Navigator.of(context).pop();
//                Navigator.of(context)
//                    .pushNamed('/cart-screen');
//              },
//            ),
                ListTile(
                  leading: Icon(Icons.settings,color: Colors.yellow[900]),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.of(context).pop();
                    tabController.animateTo(3);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help,color: Colors.yellow[900]),
                  title: Text('About'),
                  onTap: () {
                    Navigator.of(context).pop();
                  }
                ),
                // Spacer(),

                // SizedBox(height: 30,)

              ],
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.yellow[900]),
              title: Text('LOGOUT',style: TextStyle(letterSpacing: 8),),
              onTap: () {
                var storageService = locator<LocalStorageService>();
                storageService.setIsLoggedIn(false);
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
