import 'package:active_ageing_mobile_app/main_screen/home_screen/saving_goals/record_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalDetailScreen extends StatefulWidget {
  GoalDetailScreen(this.savingGoal, this.updateSavingGoal, {Key? key})
      : super(key: key);
  final Map savingGoal;
  final Function updateSavingGoal;
  @override
  _GoalDetailScreenState createState() => _GoalDetailScreenState(savingGoal);
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  _GoalDetailScreenState(this.savingGoal);
  Map savingGoal;
  getDuration() {
    DateTime start = savingGoal['startTime'].toDate();
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

  late int daysSaving;

  late int weeksSaving;

  late int monthsSaving;

  getSavingTactic() {
    DateTime start = savingGoal['startTime'].toDate();
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(start);
    daysSaving = duration.inDays;
    weeksSaving = (duration.inDays / 7).round();
    monthsSaving = (duration.inDays / 30).round();

    daysSaving = (remainSaving() / daysSaving).round();
    if (weeksSaving != 0) weeksSaving = (remainSaving() / weeksSaving).round();
    if (monthsSaving != 0)
      monthsSaving = (remainSaving() / monthsSaving).round();
  }

  double remainSaving() {
    return savingGoal['goal'] - savingGoal['savedMoney'];
  }

  String remainTime() {
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(DateTime.now());
    int months = (duration.inDays / 30).floor();
    int weeks = ((duration.inDays % 30) / 7).floor();
    int days = (duration.inDays % 30) % 7;
    String title = 'Còn lại ';
    if (months > 0) title += months.toString() + ' tháng ';
    if (weeks > 0) title += weeks.toString() + ' tuần ';
    if (days > 0) title += days.toString() + ' ngày ';
    return title;
  }

  updateData(Map newSavingGoal) {
    setState(() {
      savingGoal = newSavingGoal;
    });
    widget.updateSavingGoal(newSavingGoal);
  }

  NumberFormat formatter = NumberFormat('###,###,###,##0.##');
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    double remain = remainSaving();
    getSavingTactic();
    String timeDisplay =
        DateFormat('yMd').format(savingGoal['startTime'].toDate()) +
            " - " +
            DateFormat('yMd').format(savingGoal['endTime'].toDate());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffecf9f4),
            fontSize: 16 * curScaleFactor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          title: Text("Chi tiết mục tiêu")),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171,
                child: Text(timeDisplay,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff999999),
                      fontSize: 12 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 4,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171,
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
                width: MediaQuery.of(context).size.width / 187.5 * 171,
                child: Text(savingGoal['type'],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff666666),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Còn lại: ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff999999),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Text(remain > 0 ? formatter.format(remain) : '0',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff1a1a1a),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 1,
                      height: MediaQuery.of(context).size.height / 333.5 * 2,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width /
                                187.5 *
                                155.5,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 2,
                            decoration: BoxDecoration(
                                color: Color(0xffdedede),
                                borderRadius: BorderRadius.circular(12))),
                        Container(
                            width: MediaQuery.of(context).size.width /
                                187.5 *
                                (savingGoal['savedMoney'] /
                                    savingGoal['goal']) *
                                155.5,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 2,
                            decoration: BoxDecoration(
                                color: Color(0xff12b281),
                                borderRadius: BorderRadius.circular(12))),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 1,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Đã tích luỹ : ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
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
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mục tiêu : ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                          Text(
                              formatter.format(savingGoal['goal']) +
                                  " " +
                                  savingGoal['currency'].toString(),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff12b281),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 1,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Text(
                        remain > 0
                            ? remainTime()
                            : 'Bạn đã hoàn thành mục tiêu',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 14 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 16,
              ),
              remain > 0
                  ? Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 171,
                      height: MediaQuery.of(context).size.height / 333.5 * 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 155,
                            child: Text('Bạn cần tích luỹ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 14 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 1,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 4,
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 155,
                            child: Row(
                              children: [
                                Text(
                                    "• " +
                                        formatter.format(daysSaving) +
                                        " " +
                                        savingGoal['currency'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff12b281),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                                Text(" /mỗi ngày",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff999999),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 1,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 4,
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 155,
                            child: Row(
                              children: [
                                Text(
                                    "• " +
                                        formatter.format(weeksSaving) +
                                        " " +
                                        savingGoal['currency'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff12b281),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                                Text(" /mỗi tuần",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff999999),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 1,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 4,
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 155,
                            child: Row(
                              children: [
                                Text(
                                    "• " +
                                        formatter.format(monthsSaving) +
                                        " " +
                                        savingGoal['currency'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff12b281),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                                Text(" /mỗi tháng",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff999999),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 24,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 333.5 * 16,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecordScreen(savingGoal, updateData)));
                        },
                        child: Text('Nhật ký'.toUpperCase())),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
