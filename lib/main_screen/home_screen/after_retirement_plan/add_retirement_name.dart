import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/add_retirement_basicinfor.dart';
import 'package:flutter/material.dart';

class AddRetirementName extends StatelessWidget {
  AddRetirementName(this.addRetirementPlan, {Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final Function addRetirementPlan;
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
          title: Text("Tạo kế hoạch về hưu")
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                validator: (money) {
                  if (double.tryParse(money.toString()) == null) {
                    return 'Số tiền không hợp lệ!';
                  }
                  return null;
                },
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddRetirementBacisInfor(
                                  name.text, addRetirementPlan)));
                    },
                    child: Text('TIẾP THEO'.toUpperCase())),
              ),
            ),
          )

        ],
      )),
    );
  }
}
