import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordDayWidget extends StatelessWidget {
  RecordDayWidget(this.record, {Key? key}) : super(key: key);
  final Map record;
  final NumberFormat formatter = NumberFormat('###,###,###,##0.##');
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(DateFormat.yMMMMEEEEd().format(record['time'].toDate())),
          Text(formatter.format(record['money']),
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xff1a1a1a),
                fontSize: 18 * curScaleFactor,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          Text(record['note'],
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xff999999),
                fontSize: 14 * curScaleFactor,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ],
      ),
    );
  }
}
