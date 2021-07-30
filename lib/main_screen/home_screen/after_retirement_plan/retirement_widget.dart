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
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle:TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ) ,
        title: Text("Hello")

    );
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RetirementReportScreen(retirementData)));
      },
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height)/ 333.5 * 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height)/333.5 * 94,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 187.5 * 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Day',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        )),
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
                            child: Text('Sửa',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff4d4d4d),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Text(retirementData['namePlan'],
                        style: TextStyle(
                        fontFamily: 'Inter',
                          color: Color(0xff1a1a1a),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 89,
                    height: (MediaQuery.of(context).size.height - appBar.preferredSize.height)/ 333.5 * 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('560.000 (1,3%)',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff12B281),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Text('120.000.000',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff1a1a1a),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 89,
                    height: (MediaQuery.of(context).size.height - appBar.preferredSize.height)/ 333.5 * 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Text('Còn lại 22 năm 2 tháng 3 tuần 2 ngày',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 14 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
