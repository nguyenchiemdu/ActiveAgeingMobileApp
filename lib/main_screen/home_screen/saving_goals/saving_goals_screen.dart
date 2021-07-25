import 'package:flutter/material.dart';
import 'add_goal_type.dart';
import 'saving_goal_widget.dart';

class SavingGoalsScreen extends StatelessWidget {
  SavingGoalsScreen(this.listSavingGoals, {Key? key}) : super(key: key);
  final List listSavingGoals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Saving goals'),
              ],
            ),
            listSavingGoals.length == 0
                ? Container(
                    padding: EdgeInsets.all(40),
                    child: Center(
                      child: Text(
                        "Bạn chưa có mục tiêu nào,Bấm “tạo mục tiêu” hoặc nút “+” để tạo mục tiêu mới.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Column(
                    children: listSavingGoals
                        .map((goal) => SavingGoalWidget(goal))
                        .toList(),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGoalType()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
