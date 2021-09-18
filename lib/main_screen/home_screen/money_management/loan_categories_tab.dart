import 'package:flutter/material.dart';

import 'category_widget.dart';

class LoanCategoriesTab extends StatelessWidget {
  LoanCategoriesTab(this.selectedCategory, this.selectedTitle, this.selectTitle,
      {Key? key})
      : super(key: key);
  final List<Map> _listCatetories = [
    {
      'groupName': 'Đi vay và thu nợ (Tiền vào)',
      'icon': Icon(
        Icons.local_atm,
        color: Color(0xffffffff),
      ),
      'listTitle': [
        'Đi vay',
        'Thu nợ',
      ],
    },
    {
      'groupName': 'Cho vay và trả nợ (Tiền ra)',
      'icon': Icon(
        Icons.local_atm,
        color: Color(0xffffffff),
      ),
      'listTitle': [
        'Cho vay',
        'Trả nợ',
      ],
    },
  ];
  final String selectedCategory;
  final String selectedTitle;
  final Function selectTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
              child: ListView(
            children: _listCatetories.map<Widget>((category) {
              String method = '-';
              if (category['groupName'] == 'Đi vay và thu nợ (Tiền vào)')
                method = '+';

              return CategoryItem(category, selectedCategory, selectedTitle,
                  selectTitle, method);
            }).toList(),
          )),
        ],
      ),
    );
  }
}
