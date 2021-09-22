import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/list_loans_by_date.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/list_transactions_by_date.dart';
import 'package:flutter/cupertino.dart';
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
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    double sum = 0;
    listLoan.forEach((element) {
      sum += element['money'];
    });
    calculateGroup(listLoan);
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 8,
            height: MediaQuery.of(context).size.height / 333.5 * 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            height: MediaQuery.of(context).size.height / 333.5 * 35,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 187.5 * 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 8,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  Text(title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12 * curScaleFactor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff666666)
                    ),),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 8,
                    height: MediaQuery.of(context).size.height / 333.5 * 2,
                  ),
                  Text(formatter.format(sum),
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20 * curScaleFactor,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff12B281)
                    ),
                  )],
              ),
          ),
          Container(
            color: Color(0xffffffff),
            child: Column(
              children: listLoansByDate(listDate, mapGroup, context),
            ),
          )
        ],
      ),
    );
  }
}
