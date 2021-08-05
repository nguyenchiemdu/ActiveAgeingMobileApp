import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/edit_retirement_plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'retirement_plan_report_screen.dart';

class RetirementWIdget extends StatelessWidget {
  RetirementWIdget(this.retirementData, this.editRetirentPlan, {Key? key})
      : super(key: key);
  final Map retirementData;
  final Function editRetirentPlan;
  final formatter = NumberFormat('###,###,##0.#');
  String retireTime() {
    DateTime start;
    start = DateTime.now();
    if (retirementData.containsKey('now')) {
      start = retirementData['now'].toDate();
    }
    int years = (retirementData['retirementAge'] - retirementData['currentAge'])
        .round();
    DateTime end = start.add(Duration(days: 365 * years));

    return DateFormat('EEE, dd MMM yyyy').format(start) +
        " - " +
        DateFormat('EEE, dd MMM yyyy').format(end);
  }

  String process() {
    int percent =
        (retirementData['savedMoney'] / retirementData['goal'] * 100).round();
    return " (${percent.toString()}%)";
  }

  getDuration() {
    DateTime start = DateTime.now();
    int years;
    DateTime end;
    years = retirementData['retirementAge'].round();
    if (retirementData.containsKey('now')) {
      end = retirementData['now'].add(Duration(days: 365 * years));
    } else {
      end = start.add(Duration(days: 365 * years));
    }

    Duration duration = end.difference(start);
    years = (duration.inDays / 365).floor();
    int remainDay = duration.inDays % 365;
    int months = (remainDay / 30).floor();
    remainDay = remainDay % 30;
    int weeks = (remainDay / 7).floor();
    remainDay %= 7;
    int days = remainDay;
    String result = 'Còn lại ${years} năm';
    if (months != 0) result += ' ${months} tháng';
    if (weeks != 0) result += ' ${weeks} tuần';
    if (days != 0) result += ' ${days} ngày';

    return result;
  }

  anynomous(Map data) {}

  @override
  Widget build(BuildContext context) {
    print(retirementData);
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        title: Text("Hello"));
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RetirementReportScreen(
                      retirementData,
                      anynomous,
                      isAdded: true,
                    )));
      },
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) /
                  333.5 *
                  8,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) /
                  333.5 *
                  94,
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width / 187.5 * 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(retireTime(),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff999999),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            )),
                        OutlinedButton(
                            onPressed: () async {
                              Map newData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditRetirementPlan(retirementData)));
                              if (newData != null && newData != retirementData)
                                editRetirentPlan(retirementData, newData);
                            },
                            child: Text('Sửa',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff4d4d4d),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Text(retirementData['namePlan'],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff1a1a1a),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 89,
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) /
                        333.5 *
                        8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            formatter.format(retirementData['savedMoney']) +
                                process(),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff12B281),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Text(formatter.format(retirementData['goal']),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff1a1a1a),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 89,
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) /
                        333.5 *
                        8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Text(getDuration(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 14 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
