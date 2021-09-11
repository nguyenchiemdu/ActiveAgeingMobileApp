import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/list_loans_by_date.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/list_transactions_by_date.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanDetailTab extends StatelessWidget {
  LoanDetailTab(this.listLoan, this.title, {Key? key}) : super(key: key);
  final List listLoan;
  final String title;
  final NumberFormat formatter = NumberFormat('###,###,###,##0.##');
  List<int> listDate = [];
  Map<int, List> mapGroup = {};
  calculateGroup(List list) {
    DateFormat datetonum = DateFormat('yyyyMMdd');
    Set<int> setDate = list.map((transaction) {
      return int.parse(datetonum.format(transaction['time'].toDate()));
    }).toSet();
    listDate = setDate.toList();
    listDate.sort();
    listDate.forEach((numday) {
      mapGroup[numday] = [];
    });
    list.forEach((transaction) {
      int nd = int.parse(datetonum.format(transaction['time'].toDate()));
      mapGroup[nd]!.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    listLoan.forEach((element) {
      sum += element['money'];
    });
    calculateGroup(listLoan);
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Container(
            child: Column(children: [Text(title), Text(formatter.format(sum))]),
          ),
          Container(
            color: Colors.blue,
            child: Column(
              children: listLoansByDate(listDate, mapGroup),
            ),
          )
        ],
      ),
    );
  }
}
