import 'package:flutter/material.dart';

class AddGoalName extends StatelessWidget {
  const AddGoalName(this.goalData, {Key? key}) : super(key: key);
  final Map goalData;
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
            ),
            ElevatedButton(
                onPressed: () {}, child: Text('Tiếp theo'.toUpperCase()))
          ],
        ),
      ),
    );
  }
}
