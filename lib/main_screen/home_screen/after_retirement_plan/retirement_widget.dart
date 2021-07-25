import 'package:flutter/material.dart';

import 'retirement_plan_report_screen.dart';

class RetirementWIdget extends StatelessWidget {
  const RetirementWIdget(this.retirementData, {Key? key}) : super(key: key);
  final Map retirementData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RetirementReportScreen(retirementData)));
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Day'),
                OutlinedButton(onPressed: () {}, child: Text('Sửa'))
              ],
            ),
            Text(retirementData['namePlan']),
          ],
        ),
      ),
    );
  }
}
