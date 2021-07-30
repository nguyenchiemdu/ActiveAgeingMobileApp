import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'add_goal_type.dart';
import 'saving_goal_widget.dart';

class SavingGoalsScreen extends StatefulWidget {
  SavingGoalsScreen(this.listSavingGoals, {Key? key}) : super(key: key);
  final List listSavingGoals;

  @override
  _SavingGoalsScreenState createState() =>
      _SavingGoalsScreenState(listSavingGoals);
}

class _SavingGoalsScreenState extends State<SavingGoalsScreen> {
  _SavingGoalsScreenState(this.listSavingGoals);
  List listSavingGoals;
  addSavingGoal(Map<String, dynamic> newData) {
    List tmp = listSavingGoals;
    tmp.add(newData);
    updateData(tmp);
  }

  editSavingGoal(Map oldData, Map newData) {
    List tmp;
    if (newData.length == 0) {
      listSavingGoals.remove(oldData);
      tmp = listSavingGoals;
    } else {
      tmp = listSavingGoals.map((goal) {
        if (goal == oldData) return newData;
        return goal;
      }).toList();
    }
    updateData(tmp);
  }

  updateData(List newData) {
    UserDatabase().updateUserData({'listSavingGoals': newData});
    setState(() {
      listSavingGoals = newData;
    });
  }

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
                        .map((goal) => SavingGoalWidget(goal, editSavingGoal))
                        .toList(),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var submitData = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGoalType()));
          if (submitData != null) addSavingGoal(submitData);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
