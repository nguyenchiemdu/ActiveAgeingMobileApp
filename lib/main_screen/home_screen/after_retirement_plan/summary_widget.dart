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
    return ((data['retirementAge']) - (data['currentAge'])).round().toString();
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            height: MediaQuery.of(context).size.height / 333.5 * 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data['currentAge'].toString(),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                      Text(data['retirementAge'].toString(),
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
                    children: [Text('Tuổi hiện tại',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )), Text('Tuổi nghỉ hưu',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    )]),
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
                      TextSpan(text: ' năm cho đến khi nghỉ hưu',
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
                    borderRadius: BorderRadius.circular(12)
                  ),
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
                      Text("Thu nhập năm cuối cùng",
                        style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff666666),
                        fontSize: 12 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 10,
                      ),
                      Text(double.parse(data['lastYearIncome'].toString()).toStringAsFixed(2),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff00865D),
                          fontSize: 24 * curScaleFactor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,),
                      )
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 83.75,
                  height: MediaQuery.of(context).size.height / 333.5 * 105,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
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
                      Text("Chi tiêu hàng năm\ndự kiến khi nghỉ hưu",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff666666),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 6,
                      ),
                      Text(double.parse(retirementPaymentMoney.toString())
                          .toStringAsFixed(2),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xffEC5B5B),
                          fontSize: 24 * curScaleFactor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,),
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
                  children: [
                    Text('Retirement savings runs out at the age of  ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff666666),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,),),
                    Text(end.toString(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff12B281),
                          fontSize: 24 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
