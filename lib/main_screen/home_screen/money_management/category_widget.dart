import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, this.selectedCategory, this.selectedTitle,
      this.selectTitle, this.method,
      {Key? key})
      : super(key: key);
  final Map category;
  final String selectedCategory;
  final String selectedTitle;
  final Function selectTitle;
  final String method;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // color: Colors.red,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (category['listTitle'].length == 0) {
                selectTitle('', category['groupName'], method);
              }
            },
            child: Row(
              children: [
                category['icon'],
                Text(
                  category['groupName'],
                ),
                category['listTitle'].length == 0 &&
                        selectedCategory == category['groupName']
                    ? Icon(
                        Icons.done,
                        color: Color(0xff12B281),
                      )
                    : Container()
              ],
            ),
          ),
          ...category['listTitle']
              .map<Widget>((title) => InkWell(
                  onTap: () {
                    selectTitle(title, category['groupName'], method);
                  },
                  child: Ink(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(title),
                              selectedTitle == title &&
                                      category['groupName'] == selectedCategory
                                  ? Icon(
                                      Icons.done,
                                      color: Color(0xff12B281),
                                    )
                                  : Container(),
                            ],
                          )))))
              .toList()
        ],
      ),
    );
  }
}
