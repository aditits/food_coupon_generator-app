import 'package:flutter/material.dart';
import 'package:coupon_app/base/color/color_key.dart';
import 'base_layout.dart';

class ListTileLayout extends StatefulWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget icon;
  final Color colorSubtitle;
  final bool isWrapWithCard;
  final bool isWrapBorder;
  final Color borderColor;
  final Function onTap;

  ListTileLayout(this.leading, this.title, this.subtitle, this.icon,
      {this.colorSubtitle,
      this.isWrapWithCard = false,
      this.onTap,
      this.isWrapBorder = false,
      this.borderColor});

  @override
  _ListTileLayoutState createState() => _ListTileLayoutState();
}

class _ListTileLayoutState extends State<ListTileLayout> with BaseLayout {
//  border: Border.all(color: widget.borderColor)

  bool isSwitch() {
    return widget.icon is Switch;
  }

  Widget getTile() {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: 8.0,
            right: 8,
            top: isSwitch() ? 1 : 6,
            bottom: isSwitch() ? 1 : 6),
        child: Row(children: <Widget>[
          widget.leading == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: widget.leading,
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                widget.subtitle == null
                    ? Container()
                    : Text(
                        widget.subtitle,
                        style: TextStyle(
                            fontSize: 12,
                            color: widget.colorSubtitle == null
                                ? ColorKey.textSecondary
                                : widget.colorSubtitle),
                      ),
              ],
            ),
          ),
          widget.icon == null ? Container() : widget.icon,
        ]),
      ),
    );
  }

  Widget getListTile() {
    return Container(
      margin: EdgeInsets.only(
          top: isSwitch() ? 1 : 6,
          bottom: isSwitch() ? 1 : 6,
          left: 8,
          right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: widget.isWrapBorder
                  ? widget.borderColor == null
                      ? Colors.transparent
                      : widget.borderColor
                  : Colors.transparent)),
      child: widget.isWrapWithCard
          ? Material(
              type: MaterialType.card,
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8),
                child: getTile(),
              ),
            )
          : widget.isWrapBorder
              ? Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8),
                  child: getTile())
              : getTile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getListTile();
  }
}
