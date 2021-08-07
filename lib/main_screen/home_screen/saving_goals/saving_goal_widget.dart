import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'edit_goal_screen.dart';
import 'goal_detail_screen.dart';

class SavingGoalWidget extends StatefulWidget {
  SavingGoalWidget(this.savingGoal, this.editSavingGoal, {Key? key})
      : super(key: key);
  final Map<String, dynamic> savingGoal;
  final Function editSavingGoal;

  @override
  _SavingGoalWidgetState createState() => _SavingGoalWidgetState(savingGoal);
}

class _SavingGoalWidgetState extends State<SavingGoalWidget> {
  _SavingGoalWidgetState(this.savingGoal);
  Map<String, dynamic> savingGoal;
  getDuration() {
    // DateTime start = savingGoal['startTime'].toDate();
    DateTime start = DateTime.now();
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(start);
    int months = (duration.inDays / 30).floor();
    int weeks = ((duration.inDays % 30) / 7).floor();
    int days = (duration.inDays % 30) % 7;
    String title = 'Còn lại ';
    if (months > 0) title += months.toString() + ' tháng ';
    if (weeks > 0) title += weeks.toString() + ' tuần ';
    if (days > 0) title += days.toString() + ' ngày ';
    return title;
  }

  updateSavingGoal(Map<String, dynamic> newSavingGoal) {
    widget.editSavingGoal(savingGoal, newSavingGoal);
    setState(() {
      savingGoal = newSavingGoal;
    });
  }

  final NumberFormat formatter = NumberFormat('##,###,###,##0.#');

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    String timeDisplay =
        DateFormat('yMd').format(savingGoal['startTime'].toDate()) +
            " - " +
            DateFormat('yMd').format(savingGoal['endTime'].toDate());
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GoalDetailScreen(savingGoal, updateSavingGoal)));
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            height: MediaQuery.of(context).size.height / 333.5 * 90,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timeDisplay),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 30.5,
                        height: MediaQuery.of(context).size.height / 333.5 * 12,
                        child: OutlinedButton(
                            onPressed: () async {
                              Map newData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditGoalScreen(savingGoal)));
                              if (newData != null && newData != savingGoal) {
                                widget.editSavingGoal(savingGoal, newData);
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xffededed),
                              primary: Colors.white,
                              side: BorderSide(
                                  width: 1.0, color: Color(0xffededed)),
                            ),
                            child: Text('Sửa',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff4d4d4d),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ))),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                  child: Text(savingGoal['name'],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff1a1a1a),
                        fontSize: 16 * curScaleFactor,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Text(savingGoal['type'])),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          formatter.format(savingGoal['savedMoney']) +
                              " (" +
                              formatter.format(savingGoal['savedMoney'] /
                                  savingGoal['goal'] *
                                  100) +
                              "%)",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff12b281),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                      Text(formatter.format(savingGoal['goal']),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 2,
                ),
                Stack(
                  children: [
                    Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 155.5,
                        height: MediaQuery.of(context).size.height / 333.5 * 2,
                        decoration: BoxDecoration(
                            color: Color(0xffdedede),
                            borderRadius: BorderRadius.circular(12))),
                    Container(
                        width: MediaQuery.of(context).size.width /
                            187.5 *
                            (savingGoal['savedMoney'] / savingGoal['goal']) *
                            155.5,
                        height: MediaQuery.of(context).size.height / 333.5 * 2,
                        decoration: BoxDecoration(
                            color: Color(0xff12b281),
                            borderRadius: BorderRadius.circular(12))),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Text(getDuration(),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff999999),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 89,
            height: MediaQuery.of(context).size.height / 333.5 * 8,
          ),
        ],
      ),
    );
  }
}
