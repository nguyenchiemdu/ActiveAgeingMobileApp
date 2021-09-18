import 'package:flutter/material.dart';

import 'category_widget.dart';

class InComeCategoryTab extends StatelessWidget {
  InComeCategoryTab(this.selectedCategory, this.selectedTitle, this.selectTitle,
      {Key? key})
      : super(key: key);
  final List<Map> _listCatetories = [
    {
      'groupName': 'Lương, thưởng, trợ cấp',
      'icon': Icon(
        Icons.local_atm,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Quà tặng',
      'icon': Icon(
        Icons.redeem,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Trúng thưởng',
      'icon': Icon(
        Icons.confirmation_number_outlined,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Thừa kế',
      'icon': Icon(
        Icons.terrain_outlined,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Tiền lãi',
      'icon': Icon(
        Icons.tune,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Thu nhập từ đầu tư vốn',
      'icon': Icon(
        Icons.pie_chart_outline_outlined,
        color: Color(0xffffffff),
      ),
      'listTitle': [
        'Tiền gửi tiết kiệm',
        'Chứng chỉ tiền gửi',
        'Quỹ hưu trí tự nguyện',
        'Trái phiếu',
        'Chứng chỉ quỹ',
        'Đầu tư cổ phiếu',
        'Khác',
      ],
    },
    {
      'groupName': 'Thanh lý',
      'icon': Icon(
        Icons.receipt_long_outlined,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Thu nhập khác',
      'icon': Icon(
        Icons.attach_money_outlined,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
    {
      'groupName': 'Giải thưởng',
      'icon': Icon(
        Icons.emoji_events_outlined,
        color: Color(0xffffffff),
      ),
      'listTitle': [],
    },
  ];
  final String selectedCategory;
  final String selectedTitle;
  final Function selectTitle;
  final String method = '+';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
              child: ListView(
            children: _listCatetories
                .map<Widget>((category) => CategoryItem(category,
                    selectedCategory, selectedTitle, selectTitle, method))
                .toList(),
          )),
        ],
      ),
    );
  }
}
