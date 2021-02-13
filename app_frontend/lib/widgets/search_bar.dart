import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  Function filterSearchResults;
  TextEditingController editingController;
  String hintText;
  Color fillColor;
  Color borderColor;
  Color fontColor;

  SearchBar({
    this.filterSearchResults,
    this.editingController,
    this.hintText,
    this.fillColor,
    this.borderColor,
    this.fontColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: borderColor),
              ),
//            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.search,
                    size: 15,
                    color: fontColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: fontColor,
                      style: TextStyle(color: fontColor,fontSize: 12),
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 11, color: fontColor),
                          isDense: true,
                          hintText: hintText,
                          border: InputBorder.none),
                      toolbarOptions: ToolbarOptions(
                        copy: true,
                        selectAll: true,
                        paste: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
