import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalDetailScreen extends StatelessWidget {
  const GoalDetailScreen(this.savingGoal, {Key? key}) : super(key: key);
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(timeDisplay),
            Text(savingGoal['name']),
            Text(savingGoal['type']),
          ],
        ),
      ),
    );
  }
}
