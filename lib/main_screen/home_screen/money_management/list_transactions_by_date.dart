import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

listTransactionsByDate(List<int> listDate, Map<int, List> mapGroup) {
  final NumberFormat formatter = NumberFormat('###,###,###,##0.##');

  return listDate.map<Widget>((day) {
    DateTime time = mapGroup[day]![0]['time'].toDate();

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(time.day.toString()),
              Column(
                children: [
                  Text(DateFormat('EEEE').format(time)),
                  Text(DateFormat('MM/yyyy').format(time)),
                ],
              )
            ],
          ),
          Column(
            children: mapGroup[day]!.map<Widget>((transaction) {
              // print(transaction);
              return Column(
                children: [
                  Text(transaction['category'].toString() +
                      ":" +
                      transaction['name'].toString()),
                  Text(formatter.format(transaction['money']))
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }).toList();
}
