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
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
              color:Color(0xffededed)
          ),
          InkWell(
            onTap: () {
              if (category['listTitle'].length == 0) {
                selectTitle('', category['groupName'], method);
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 333.5 * 24,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 8,
                    height: MediaQuery.of(context).size.height / 333.5 * 1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 16,
                    height: MediaQuery.of(context).size.height / 333.5 * 16,
                    decoration: BoxDecoration(
                        color: Color(0xff12b281),
                        shape: BoxShape.circle
                    ),
                    child: category['icon'],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 6,
                    height: MediaQuery.of(context).size.height / 333.5 * 1,
                  ),
                  Text(
                    category['groupName'],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
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
          ),
          ...category['listTitle']
              .map<Widget>((title) => InkWell(
                  onTap: () {
                    selectTitle(title, category['groupName'], method);
                  },
                  child: Ink(
                      child: Container(
                          height: MediaQuery.of(context).size.height / 333.5 * 19,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                  color:Color(0xffededed)
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 187.5 * 6,
                                height: MediaQuery.of(context).size.height / 333.5 * 4,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 187.5 * 30,
                                    height: MediaQuery.of(context).size.height / 333.5 * 1,
                                  ),
                                  Text(title,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff666666),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),

                                  selectedTitle == title &&
                                          category['groupName'] == selectedCategory
                                      ? Icon(
                                          Icons.done,
                                          color: Color(0xff12B281),
                                        )
                                      : Container(),
                                ],
                              ),
                            ],
                          )))))
              .toList()
        ],
      ),
    );
  }
}
