import 'package:flutter/material.dart';

import 'category_widget.dart';

class OutComeCategoriesTab extends StatelessWidget {
  OutComeCategoriesTab(
      this.selectedCategory, this.selectedTitle, this.selectTitle,
      {Key? key})
      : super(key: key);
  final List<Map> _listCatetories = [
    {
      'groupName': 'Ăn uống',
      'icon': Icon(
        Icons.restaurant,
        color:Color(0xffffffff)),
      'listTitle': ['Ăn tại nhà', 'Quán ăn, Cà phê']
    },
    {
      'groupName': 'Hoá đơn thanh toán',
      'icon': Icon(Icons.receipt, color: Color(0xffffffff)),
      'listTitle': [
        'Điện',
        'Nước',
        'Internet',
        'Truyền hình',
        'Chung cư',
        'Điện thoại',
        'Học phí',
        'Dịch vụ công',
        'Dịch vụ vệ sinh',
        'Khác'
      ]
    },
    {
      'groupName': 'Đi lại',
      'icon': Icon(Icons.commute, color:Color(0xffffffff)),
      'listTitle': [
        'Đặt xe',
        'Phương tiện công cộng',
        'Xăng',
        'Bảo trì và sửa chữa',
        'Phí đỗ xe',
        'Phí cầu đường',
      ]
    },
    {
      'groupName': 'Giải trí',
      'icon': Icon(Icons.movie, color:Color(0xffffffff)),
      'listTitle': [
        'Sách truyện',
        'Phim ảnh',
        'Trò chơi',
        'Khác',
      ]
    },
    {
      'groupName': 'Quà tặng, từ thiện',
      'icon': Icon(Icons.card_giftcard, color:Color(0xffffffff)),
      'listTitle': [
        'Quà tặng',
        'Đám cưới và tiệc khác',
        'Đám tang',
        'Từ thiện',
      ]
    },
    {
      'groupName': 'Chăm sóc sức khỏe',
      'icon': Icon(Icons.favorite, color:Color(0xffffffff)),
      'listTitle': [
        'Khám bệnh',
        'Hoạt động thể thao',
      ]
    },
    {
      'groupName': 'Giáo dục',
      'icon': Icon(Icons.school, color:Color(0xffffffff)),
      'listTitle': [
        'Các khóa học thêm',
        'Sách vở và dụng cụ học tập',
        'Quỹ lớp',
        'Khác',
      ]
    },
    {
      'groupName': 'Mua sắm',
      'icon': Icon(Icons.shopping_bag, color:Color(0xffffffff)),
      'listTitle': [
        'Quần áo & giày dép',
        'Mỹ phẩm và chăm sóc sắc đẹp',
        'Đồ điện tử',
        'Phụ kiện',
        'Đồ dùng gia đình',
        'Mẹ & bé',
        'Chăm sóc thú cưng',
        'Khác',
      ]
    },
    {
      'groupName': 'Du lịch',
      'icon': Icon(Icons.flight, color:Color(0xffffffff)),
      'listTitle': [
        'Khách sạn, nhà nghỉ, homestay',
        'Đi lại',
        'Ăn uống',
        'Phí tham quan',
        'Khác',
      ]
    },
    {
      'groupName': 'Đầu tư',
      'icon': Icon(Icons.pie_chart, color:Color(0xffffffff)),
      'listTitle': [
        'Tiền gửi tiết kiệm',
        'Chứng chỉ tiền gửi',
        'Quỹ hưu trí tự nguyện',
        'Trái phiếu',
        'Chứng chỉ quỹ',
        'Đầu tư cổ phiếu',
        'Khác',
      ]
    },
    {
      'groupName': 'Bảo hiểm',
      'icon': Icon(Icons.pie_chart, color:Color(0xffffffff)),
      'listTitle': [
        'Bảo hiểm xã hội',
        'Bảo hiễm nhân thọ',
        'Bảo hiểm tai nạn',
        'Khác',
      ]
    },
    {
      'groupName': 'Chi phí khác',
      'icon': Icon(Icons.list, color:Color(0xffffffff)),
      'listTitle': []
    },
  ];
  final String selectedCategory;
  final String selectedTitle;
  final Function selectTitle;
  final String method = '-';
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
