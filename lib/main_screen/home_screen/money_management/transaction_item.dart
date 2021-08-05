import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(this.transaction, {Key? key}) : super(key: key);
  final Map transaction;
  final NumberFormat formatter = NumberFormat('##,###,###,##0.#');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(transaction['name']),
          Text(formatter.format(transaction['money'])),
          Text(transaction['note']),
          Text(DateFormat('dd/MM/yyyy').format(transaction['time'].toDate()))
        ],
      ),
    );
  }
}
