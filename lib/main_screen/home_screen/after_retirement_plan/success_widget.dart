import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      child: Center(
        child: Text('Kế hoạch nghỉ hưu\ncủa bạn rất hợp lý'.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xff666666),
            fontSize: 16 * curScaleFactor,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,),),
      ),
    );
  }
}
