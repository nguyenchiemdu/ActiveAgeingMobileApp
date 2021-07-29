import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/edit_retirement_plan.dart';
import 'package:flutter/material.dart';

import 'retirement_plan_report_screen.dart';

class RetirementWIdget extends StatelessWidget {
  const RetirementWIdget(this.retirementData, this.editRetirentPlan, {Key? key})
      : super(key: key);
  final Map retirementData;
  final Function editRetirentPlan;
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
                OutlinedButton(
                    onPressed: () async {
                      Map newData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditRetirementPlan(retirementData)));
                      if (newData != null && newData != retirementData)
                        editRetirentPlan(retirementData, newData);
                    },
                    child: Text('Sửa'))
              ],
            ),
            Text(retirementData['namePlan']),
          ],
        ),
      ),
    );
  }
}
