import 'package:flutter/material.dart';

class FailWidget extends StatelessWidget {
  const FailWidget(this.data, {Key? key}) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 89,
          height: MediaQuery.of(context).size.height / 333.5 * 12,
        ),
        Container(
          child: Center(
            child: Text(
              'Kế hoạch nghỉ hưu của bạn\nchưa hợp lý'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xffFF2D2D),
                fontSize: 16 * curScaleFactor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 89,
          height: MediaQuery.of(context).size.height / 333.5 * 9.5,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 171.5,
          child: Text(
            "Để đạt được các mục tiêu nghỉ hưu, chúng tôi có những đề xuất dành cho bạn như sau:",
            style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xff4d4d4d),
              fontSize: 14 * curScaleFactor,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Container(
          child: Text('Hoãn tuổi nghỉ hưu của bạn đến sau khi bạn' +
              data['retirementAge'].toString() +
              ' tuổi'),
        ),
        Container(
          child: Column(
            children: [
              Text('Tăng tỉ suất lợi nhuận trước khi về hưu'),
              Text(data['rateBefore'].toString() + '% tới X%')
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text('Tăng mức đóng góp cho khoản tiết kiệm hưu trí hàng năm'),
              Text(data['annualSaving'].toString() + '% tới X%')
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                  'Giảm thu nhập yêu cầu của bạn khi nghỉ hưu xuống còn X% thu nhập của năm cuối cùng trước khi về hưu của bạn.'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text('Tăng lương hưu / thu nhập khác của bạn sau khi nghỉ hưu'),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              // changeInitialPage(0);
              // DefaultTabController.of(context)!.animateTo(0);
              Navigator.pop(context);
            },
            child: Text('Chỉnh sửa theo gọi ý này'))
      ],
    );
  }
}
