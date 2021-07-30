import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordDayWidget extends StatelessWidget {
  const RecordDayWidget(this.record, {Key? key}) : super(key: key);
  final Map record;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(DateFormat.yMMMMEEEEd().format(record['time'].toDate())),
          Text(record['money'].toString()),
          Text(record['note']),
        ],
      ),
    );
  }
}
