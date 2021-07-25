import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/add_retirement_basicinfor.dart';
import 'package:flutter/material.dart';

class AddRetirementName extends StatelessWidget {
  AddRetirementName(this.addRetirementPlan, {Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final Function addRetirementPlan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Text('tên mục tiêu'),
          TextField(
            controller: name,
            decoration: InputDecoration(hintText: 'Tên mục tiêu'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddRetirementBacisInfor(
                            name.text, addRetirementPlan)));
              },
              child: Text('Tiếp theo'))
        ],
      )),
    );
  }
}
