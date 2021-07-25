import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/add_retirement_name.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:flutter/material.dart';

import 'retirement_plan_report_screen.dart';
import 'retirement_widget.dart';

class AfterRetirementScreen extends StatefulWidget {
  const AfterRetirementScreen(this.listRetirement, {Key? key})
      : super(key: key);
  final List listRetirement;
  @override
  _AfterRetirementScreenState createState() =>
      _AfterRetirementScreenState(listRetirement);
}

class _AfterRetirementScreenState extends State<AfterRetirementScreen> {
  _AfterRetirementScreenState(this.listRetirement);
  List listRetirement;
  List<Widget> listRetirementWidget = [];
  @override
  void initState() {
    super.initState();
    listRetirementWidget = listRetirement
        .map((retirement) => RetirementWIdget(retirement))
        .toList();
  }

  void addRetirementPlan(Map data) async {
    List tmp = listRetirement;
    tmp.add(data);
    setState(() {
      listRetirement = tmp;
      listRetirementWidget =
          tmp.map((retirement) => RetirementWIdget(retirement)).toList();
    });
    UserDatabase().updateUserData({'listRetirement': tmp});
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RetirementReportScreen(data)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back')),
                Text('Retirement Plan')
              ],
            ),
            Container(
              child: Column(
                children: listRetirementWidget,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddRetirementName(addRetirementPlan)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
