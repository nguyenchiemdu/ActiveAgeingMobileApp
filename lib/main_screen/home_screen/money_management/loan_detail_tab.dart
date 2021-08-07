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
                children: listDate.map((day) {
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
                        return Column(
                          children: [
                            Text(transaction['category'] +
                                ":" +
                                transaction['name']),
                            Text(transaction['person'] +
                                "  " +
                                formatter.format(transaction['money']))
                          ],
                        );
                      }).toList(),
                    )
                  ],
                ),
              );
            }).toList()),
          )
        ],
      ),
    );
  }
}
