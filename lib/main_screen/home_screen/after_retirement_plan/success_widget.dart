import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget(this.retireData, this.addRetirementPlan, this.isAdded,
      {Key? key})
      : super(key: key);
  final bool isAdded;
  final Map retireData;
  final Function addRetirementPlan;
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
        title: Text("HELLO"));
    return Column(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width) / 187.5 * 8,
          height: (MediaQuery.of(context).size.height) / 333.5 * 23,
        ),
        Image.asset("assets/images/success.png"),
        Container(
          width: (MediaQuery.of(context).size.width) / 187.5 * 8,
          height: (MediaQuery.of(context).size.height) / 333.5 * 18,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 171.5,
          child: Text(
            'Kế hoạch nghỉ hưu\ncủa bạn rất hợp lý'.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xff12B281),
              fontSize: 18 * curScaleFactor,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) / 187.5 * 8,
          height: (MediaQuery.of(context).size.height) / 333.5 * 4,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 171.5,
          child: Text(
            'Bạn có thể tạo kế hoạch tiết kiệm từ kế\nhoạch về hưu này.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xff999999),
              fontSize: 14 * curScaleFactor,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 24,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 333.5 * 50,
              ),
              child: !isAdded
                  ? ElevatedButton(
                      onPressed: () {
                        addRetirementPlan(retireData);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('TẠO KẾ HOẠCH TIẾT KIỆM'.toUpperCase()))
                  : null,
            ),
          ),
        )
      ],
    );
  }
}
