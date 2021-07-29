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
        .map((retirement) => RetirementWIdget(retirement, editRetirentPlan))
        .toList();
  }

  void editRetirentPlan(Map oldPlan, Map newPlan) {
    // print('da toi day');
    List tmp = listRetirement.map((item) {
      if (item == oldPlan) return newPlan;
      return item;
    }).toList();

    updateData(tmp);
  }

  void updateData(List newRetirementPlan) {
    setState(() {
      listRetirement = newRetirementPlan;
      listRetirementWidget = newRetirementPlan
          .map((retirement) => RetirementWIdget(retirement, editRetirentPlan))
          .toList();
    });
    UserDatabase().updateUserData({'listRetirement': newRetirementPlan});
  }

  void addRetirementPlan(Map data) async {
    List tmp = listRetirement;
    tmp.add(data);
    updateData(tmp);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RetirementReportScreen(data)));
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle:TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffecf9f4),
            fontSize: 16 * curScaleFactor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ) ,
          title: Text("Kế hoạch về hưu")
      ),
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
        backgroundColor: Color(0xffffffff),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddRetirementName(addRetirementPlan)));
        },
        child: Icon(Icons.add, color: Color(0xff000000),),
      ),
    );
  }
}
