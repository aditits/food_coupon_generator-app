
import 'package:coupon_app/base/color/color_key.dart';
import 'package:coupon_app/base/localization/language_key.dart';
import 'package:coupon_app/base/utilities/purple_toolbar_layout.dart';
import 'package:coupon_app/base/view/base_layout.dart';
import 'package:flutter/material.dart';

import 'item_found_layout.dart';
import 'no_item_layout.dart';

class SearchLayout extends StatefulWidget {
  @override
  _SearchLayoutState createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout>
    with BaseLayout, TickerProviderStateMixin {
  TextEditingController searchQueryController = new TextEditingController();

  void onChanged(String value) {
    setState(() {});
  }

  Widget getSearchField() {
    String text = getStringValue(LanguageKey.whatAreYou, context);
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorKey.registerBox, width: 10)),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: new TextField(
            onChanged: onChanged,
            cursorColor: Colors.black,
            controller: searchQueryController,
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              hintStyle: TextStyle(color: ColorKey.textSecondary),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          actions: <Widget>[
            searchQueryController.text == null ||
                    searchQueryController.text.isEmpty
                ? Container()
                : IconButton(
                    onPressed: () {
                      setState(() {
                        searchQueryController.text = '';
                      });
                    },
                    icon: Icon(
                      Icons.clear,
                      color: ColorKey.darkGrey,
                    ),
                  ),
            searchQueryController.text == null ||
                    searchQueryController.text.isEmpty
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: ColorKey.cartColor,
                    ),
                  )
                : Container(),
            searchQueryController.text == null ||
                    searchQueryController.text.isEmpty
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: ColorKey.cartColor,
                    ),
                  )
                : Container(),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: ColorKey.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget getText() {
    return Text(
      getStringValue(LanguageKey.yourRecent, context),
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }

  Widget getBuildBody() {
    if (searchQueryController.text == null ||
        searchQueryController.text.isEmpty) {
      return NoItemLayout();
    } else {
      return ItemFoundLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PurpleToolbarLayout(
      getBuildBody(),
      bottom: getSearchField(),
      showSearchIcon: false,
    );
  }
}
