// import 'dart:ffi';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  SummaryWidget(this.data, this.retirementPaymentMoney, this.end, {Key? key})
      : super(key: key);
  final Map data;
  final retirementPaymentMoney;
  final end;
  String getDuration() {
    return ((data['retirementAge']) - (data['currentAge'])).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data['currentAge'].toString()),
                      Text(data['retirementAge'].toString())
                    ]),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEDEDED),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 310,
                  height: 4,
                  child: Center(
                    child: Container(
                      width: 189,
                      height: 4,
                      color: Color(0xff12B281),
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('Current Age'), Text('Retire Age')]),
                Text(getDuration() + ' Years until retirement')
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2,
                child: Text("Your's last year income is " +
                    double.parse(data['lastYearIncome'].toString())
                        .toStringAsFixed(2) +
                    " Mil VND"),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2,
                child: Text("Estimated annual retirement expenditures is " +
                    double.parse(retirementPaymentMoney.toString())
                        .toStringAsFixed(2) +
                    " Mil VND"),
              )
            ],
          ),
          Container(
            child: Column(
              children: [
                Text('Retirement savings runs out at the age of ' +
                    end.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
