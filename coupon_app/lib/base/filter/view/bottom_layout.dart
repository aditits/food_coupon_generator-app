import 'package:coupon_app/base/view/base_layout.dart';
import 'package:flutter/material.dart';
import 'menu_filter_layout.dart';

class BottomLayout extends StatefulWidget {
  @override
  BottomLayoutState createState() => BottomLayoutState();
}

class BottomLayoutState extends State<BottomLayout> with BaseLayout {
  Widget showDialog(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width),
            child: Material(
                color: Theme.of(context).dialogBackgroundColor,
                elevation: 0.0,
                child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: MenuFilterLayout(
                      isFromDrawer: false,
                    )
                )
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showDialog(context);
  }
}
