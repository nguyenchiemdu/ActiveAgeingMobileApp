import 'package:flutter/material.dart';

import 'add_goal_name.dart';

class AddGoalType extends StatefulWidget {
  const AddGoalType({Key? key}) : super(key: key);

  @override
  _AddGoalTypeState createState() => _AddGoalTypeState();
}

class _AddGoalTypeState extends State<AddGoalType> {
  var _goalType = 'Learn';
  final List<String> _listType = [
    'Learn',
    'Car',
    'device',
    'investment',
    'retirement',
    'house',
    'gift',
    'travel',
    'entertainment'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('Thêm mục tiêu'),
          Text('Bạn tiết kiệm cho mục tiêu gì?'),
          DropdownButton<String>(
            value: _goalType,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _goalType = newValue!;
              });
            },
            items: _listType.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddGoalName({'type': _goalType})));
              },
              child: Text('Tiếp theo'))
        ]),
      ),
    );
  }
}
