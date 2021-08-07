import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordDayWidget extends StatelessWidget {
  RecordDayWidget(this.record, {Key? key}) : super(key: key);
  final Map record;
  final NumberFormat formatter = NumberFormat('###,###,###,##0.##');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(DateFormat.yMMMMEEEEd().format(record['time'].toDate())),
          Text(formatter.format(record['money'])),
          Text(record['note']),
        ],
      ),
    );
  }
}
