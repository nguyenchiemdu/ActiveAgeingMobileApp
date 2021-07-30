import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRecordScreen extends StatelessWidget {
  AddRecordScreen(this.savingGoal, {Key? key}) : super(key: key);
  final Map savingGoal;
  getDuration() {
    DateTime start = savingGoal['startTime'].toDate();
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(start);
    int months = (duration.inDays / 30).floor();
    int weeks = ((duration.inDays % 30) / 7).floor();
    int days = (duration.inDays % 30) % 7;
    return 'Còn lại ${months} months ${weeks} weeks ${days} days';
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

  // bool isOnSchedule() {
  //   DateTime start = savingGoal['startTime'].toDate();
  //   DateTime end = savingGoal['endTime'].toDate();
  //   Duration  = DateTime.now().difference(start);

  // }

  @override
  Widget build(BuildContext context) {
    String timeDisplay = DateFormat('EEE, dd MMM yyyy')
            .format(savingGoal['startTime'].toDate()) +
        " - " +
        DateFormat('EEE, dd MMM yyyy').format(savingGoal['endTime'].toDate());
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text(savingGoal['name']),
            Text(timeDisplay),
            Text('Còn lại: ' + remainSaving().toStringAsFixed(2)),
            // Text(savingGoal['type']),
            Container(
              child: Column(
                children: [
                  Text('Đã tích luỹ : ' + savingGoal['savedMoney'].toString()),
                  Text('Mục tiêu : ' + savingGoal['goal'].toString()),
                  Text(remainTime()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
