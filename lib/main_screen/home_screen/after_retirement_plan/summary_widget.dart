// import 'dart:ffi';
import 'dart:math';
import 'package:active_ageing_mobile_app/bar_chart/model/data.dart';
import 'bar_chart_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryWidget extends StatelessWidget {
  SummaryWidget(this.data, this.retirementPaymentMoney,
      this.endingRetirementBalance, this.end,
      {Key? key})
      : super(key: key);
  final Map data;
  final retirementPaymentMoney;
  final List endingRetirementBalance;
  final end;
  String getDuration() {
    return ((data['retirementAge']) - (data['currentAge'])).round().toString();
  }

  List<Data> chartData = [];
  calculateDataForChart() {
    List rawData = endingRetirementBalance
        .sublist((data['retirementAge'] - data['currentAge'] - 1).round());
    int startAge = (data['retirementAge'] - 1).round();
    print(startAge);
    int count = startAge;
    chartData = rawData.map<Data>((statistic) {
      String name = count.toString();
      if (count != startAge && count != end + 1) name = ' ';
      Color color = Colors.red;
      int id = count;
      count++;
      double y = double.parse((statistic.toStringAsFixed(2)));
      return Data(name: name, id: id, y: y, color: color);
    }).toList();
  }

  findMax(List list) {
    double maxvalue = 0;
    list.forEach((element) {
      if (maxvalue < element) maxvalue = element;
    });
    firstDigit = int.parse(maxvalue.toString()[0]) + 1;
    interval = pow(10, (log(maxvalue) / ln10).floor()).toInt();
    maxY = firstDigit * pow(10, (log(maxvalue) / ln10).floor()).toInt();
  }

  int firstDigit = 0;
  int interval = 0;
  int maxY = 0;

  NumberFormat formatter = NumberFormat('###,###,###,##0.#');
  @override
  Widget build(BuildContext context) {
    calculateDataForChart();
    findMax(endingRetirementBalance);
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            height: MediaQuery.of(context).size.height / 333.5 * 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(formatter.format(data['currentAge']),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                      Text(formatter.format(data['retirementAge']),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ))
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
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 4,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Tuổi hiện tại',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff999999),
                            fontSize: 12 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      Text('Tuổi nghỉ hưu',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff999999),
                            fontSize: 12 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ]),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                RichText(
                  text: TextSpan(
                    text: getDuration(),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff12B281),
                      fontSize: 24 * curScaleFactor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: ' năm cho đến khi nghỉ hưu',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff666666),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 89,
            height: MediaQuery.of(context).size.height / 333.5 * 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 83.75,
                  height: MediaQuery.of(context).size.height / 333.5 * 105,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 12,
                      ),
                      Image.asset("assets/images/current_income.png"),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 12,
                      ),
                      Text(
                        "Thu nhập năm cuối cùng",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff666666),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 10,
                      ),
                      Text(
                        double.parse(data['lastYearIncome'].toString())
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff00865D),
                          fontSize: 24 * curScaleFactor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 83.75,
                  height: MediaQuery.of(context).size.height / 333.5 * 105,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 12,
                      ),
                      Image.asset("assets/images/spending.png"),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 10,
                      ),
                      Text(
                        "Chi tiêu hàng năm\ndự kiến khi nghỉ hưu",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff666666),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 6,
                      ),
                      Text(
                        double.parse(retirementPaymentMoney.toString())
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xffEC5B5B),
                          fontSize: 24 * curScaleFactor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Retirement savings runs out at the age of  ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff666666),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(formatter.format(end),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff12B281),
                          fontSize: 24 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        )),
                  ],
                ),
                Container(
                    // color: Colors.red,
                    child: BarChartPage(chartData, interval, maxY)),
              ],
            ),
          ),
          Container(
            height: 100,
          )
        ],
      ),
    );
  }
}
