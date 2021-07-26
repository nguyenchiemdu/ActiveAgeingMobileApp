import 'package:active_ageing_mobile_app/main_screen/home_screen/saving_goals/add_goal_infor.dart';
import 'package:flutter/material.dart';

class AddGoalName extends StatelessWidget {
  AddGoalName(this.goalData, {Key? key}) : super(key: key);
  final Map<String, dynamic> goalData;
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text('Tên mục tiêu'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: name,
            ),
            ElevatedButton(
                onPressed: () async {
                  goalData['name'] = name.text;

                  var submitData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddGoalInfor(goalData)));
                  if (submitData != null) Navigator.pop(context, submitData);
                },
                child: Text('Tiếp theo'.toUpperCase()))
          ],
        ),
      ),
    );
  }
}
