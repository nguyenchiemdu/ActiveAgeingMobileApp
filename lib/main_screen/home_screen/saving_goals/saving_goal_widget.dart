import 'package:flutter/material.dart';

class SavingGoalWidget extends StatelessWidget {
  const SavingGoalWidget(this.savingGoal, {Key? key}) : super(key: key);
  final Map savingGoal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('THU, 21 JUL 2021 - SUN, 24 JUL 2021'),
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
          Text('Còn lại 2 months 3 weeks 2 days')
        ],
      ),
    );
  }
}
