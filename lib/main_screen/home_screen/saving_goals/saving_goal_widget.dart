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
    DateTime start = savingGoal['startTime'].toDate();
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(start);
    int months = (duration.inDays / 30).floor();
    int weeks = ((duration.inDays % 30) / 7).floor();
    int days = (duration.inDays % 30) % 7;
    return 'Còn lại ${months} months ${weeks} weeks ${days} days';
  }

  updateSavingGoal(Map<String, dynamic> newSavingGoal) {
    widget.editSavingGoal(savingGoal, newSavingGoal);
    setState(() {
      savingGoal = newSavingGoal;
    });
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
                builder: (context) =>
                    GoalDetailScreen(savingGoal, updateSavingGoal)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(timeDisplay),
                OutlinedButton(
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
                    child: Text('Sửa'))
              ],
            ),
            Text(savingGoal['name']),
            Text(savingGoal['type']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(savingGoal['savedMoney'].toString()),
                Text(savingGoal['goal'].toString())
              ],
            ),
            Text(getDuration())
          ],
        ),
      ),
    );
  }
}
