import 'package:active_ageing_mobile_app/main_screen/home_screen/saving_goals/add_goal_infor.dart';
import 'package:flutter/material.dart';

class AddGoalName extends StatelessWidget {
  AddGoalName(this.goalData, {Key? key}) : super(key: key);
  final Map<String, dynamic> goalData;
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xffecf9f4),
              fontSize: 16 * curScaleFactor,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            title: Text("Thêm mục tiêu")),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: MediaQuery.of(context).size.height / 333.5 * 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              child: Text('Tên mục tiêu',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff4d4d4d),
                    fontSize: 16 * curScaleFactor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 24,
              child: TextFormField(
                  controller: name,

                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Color(0xff12b281),
                        width: 1.0,

                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Color(0xffededed),
                        width: 1.0,
                      ),
                    ),
                  )
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 333.5 * 16,),
                  child: ElevatedButton(
                      onPressed: () async {
                        goalData['name'] = name.text;

                        var submitData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddGoalInfor(goalData)));
                        if (submitData != null) Navigator.pop(context, submitData);
                      },
                      child: Text('TIẾP THEO'.toUpperCase())),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
