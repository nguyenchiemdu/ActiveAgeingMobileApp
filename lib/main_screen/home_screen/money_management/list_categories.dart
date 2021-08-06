import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/in_come_category_tab.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'category_widget.dart';
import 'loan_categories_tab.dart';
import 'out_come_categories_tab.dart';

class ListCategories extends StatefulWidget {
  ListCategories({Key? key}) : super(key: key);

  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  String selectedTitle = '';
  String selectedCategory = '';
  String method = '';
  selectTitle(String title, String category, String newMethod) {
    setState(() {
      selectedTitle = title;
      selectedCategory = category;
      method = newMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        title: Text("Báo cáo"));
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                        onTap: (index) {
                          //your currently selected index
                        },
                        labelColor: Color(0xff12B281),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text('Chi tiêu'.toUpperCase()),
                          ),
                          Tab(
                            child: Text('Thu nhập'.toUpperCase()),
                          ),
                          Tab(
                            child: Text('Vay nợ'.toUpperCase()),
                          ),
                        ]),
                    Flexible(
                      // height: (MediaQuery.of(context).size.height -
                      //             appBar.preferredSize.height) /
                      //         333.5 *
                      //         298 -
                      //     0,
                      child: TabBarView(
                        children: [
                          OutComeCategoriesTab(
                              selectedCategory, selectedTitle, selectTitle),
                          InComeCategoryTab(
                              selectedCategory, selectedTitle, selectTitle),
                          LoanCategoriesTab(
                              selectedCategory, selectedTitle, selectTitle)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (selectedCategory != '') {
                      Map result = {
                        'selectedCategory': selectedCategory,
                        'selectedTitle': selectedTitle,
                        'method': method,
                      };
                      print(result);
                      Navigator.pop(context, result);
                    }
                  },
                  child: Text('Lưu')),
            ),
          ],
        ),
      ),
    );
  }
}
