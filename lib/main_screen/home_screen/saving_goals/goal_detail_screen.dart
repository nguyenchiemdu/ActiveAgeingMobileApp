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
    return 'Còn lại ${months} months ${weeks} weeks ${days} days';
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
    weeksSaving = (remainSaving() / weeksSaving).round();
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
    return 'Còn lại ${months} months ${weeks} weeks ${days} days';
  }

  updateData(Map newSavingGoal) {
    setState(() {
      savingGoal = newSavingGoal;
    });
    widget.updateSavingGoal(newSavingGoal);
  }

  @override
  Widget build(BuildContext context) {
    getSavingTactic();
    String timeDisplay = DateFormat('EEE, dd MMM yyyy')
            .format(savingGoal['startTime'].toDate()) +
        " - " +
        DateFormat('EEE, dd MMM yyyy').format(savingGoal['endTime'].toDate());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(timeDisplay),
            Text(savingGoal['name']),
            Text(savingGoal['type']),
            Container(
              child: Column(
                children: [
                  Text('Còn lại: ' + remainSaving().toStringAsFixed(2)),
                  Text('Đã tích luỹ : ' + savingGoal['savedMoney'].toString()),
                  Text('Mục tiêu : ' + savingGoal['goal'].toString()),
                  Text(remainTime()),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Bạn cần tích luỹ'),
                  Text(daysSaving.toString() + " / mỗi ngày"),
                  Text(weeksSaving.toString() + " / mỗi tuần"),
                  Text(monthsSaving.toString() + " / mỗi tháng")
                ],
              ),
            ),
            SizedBox(
                // width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecordScreen(savingGoal, updateData)));
                    },
                    child: Text('Nhật ký')))
          ],
        ),
      ),
    );
  }
}
