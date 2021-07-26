import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'goal_detail_screen.dart';

class SavingGoalWidget extends StatelessWidget {
  SavingGoalWidget(this.savingGoal, {Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    String timeDisplay = DateFormat('EEE, dd MMM yyyy')
            .format(savingGoal['startTime'].toDate()) +
        " - " +
        DateFormat('EEE, dd MMM yyyy').format(savingGoal['endTime'].toDate());
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GoalDetailScreen(savingGoal)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(timeDisplay),
                OutlinedButton(onPressed: () {}, child: Text('Sửa'))
              ],
            ),
            Text(savingGoal['name']),
            Text(savingGoal['type']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(savingGoal['savedMoney']),
                Text(savingGoal['goal'])
              ],
            ),
            Text(getDuration())
          ],
        ),
      ),
    );
  }
}
