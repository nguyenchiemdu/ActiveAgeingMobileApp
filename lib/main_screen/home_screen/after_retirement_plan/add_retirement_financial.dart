import 'package:flutter/material.dart';

import 'retirement_plan_report_screen.dart';

class AddRetirementFinancial extends StatefulWidget {
  AddRetirementFinancial(this.data, this.addRetirementPlan, {Key? key})
      : super(key: key);
  final Function addRetirementPlan;
  final Map data;

  @override
  _AddRetirementFinancialState createState() => _AddRetirementFinancialState();
}

class _AddRetirementFinancialState extends State<AddRetirementFinancial> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController annualSaving = TextEditingController();

  final TextEditingController retirementPay = TextEditingController();

  final TextEditingController rateBefore = TextEditingController();

  final TextEditingController rateAfter = TextEditingController();

  final TextEditingController pension = TextEditingController();

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
          title: Text("Tạo kế hoạch về hưu")),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: Text('Về bước trước',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff999999),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 3,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: Text('Thông tin chi tiết',
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
                height: MediaQuery.of(context).size.height / 333.5 * 3,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 333.5 * 6),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                      child: Text(widget.data['namePlan'],
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 24 * curScaleFactor,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 89,
                      height: MediaQuery.of(context).size.height / 333.5 * 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                      child: Text("Thông tin tài chính",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff12b281),
                            fontSize: 18 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 89,
                      height: MediaQuery.of(context).size.height / 333.5 * 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                      child: Text(
                          'Hoàn thành biểu mẫu sau và máy sẽ tính toán giúp bạn về mục tiêu về hưu.',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff666666),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 89,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('1. Khoản tiết kiệm về hưu hàng năm (%)',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  InkWell(
                                    onTap: () {},
                                    child: Text('Hướng dẫn',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff00865d),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  24,
                              child: TextFormField(
                                  controller: annualSaving,
                                  validator: (value) {
                                    if (double.tryParse(value.toString()) ==
                                        null) return 'Hãy nhập vào 1 số thực';
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
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('2. Thu nhập yêu cầu khi về hưu (%)',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  InkWell(
                                    onTap: () {},
                                    child: Text('Hướng dẫn',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff00865d),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  24,
                              child: TextFormField(
                                  controller: retirementPay,
                                  validator: (value) {
                                    if (double.tryParse(value.toString()) ==
                                        null) return 'Hãy nhập vào 1 số thực';
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
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '3. Lợi suất ước tính trước khi về hưu (%)',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  InkWell(
                                    onTap: () {},
                                    child: Text('Hướng dẫn',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff00865d),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  24,
                              child: TextFormField(
                                  controller: rateBefore,
                                  validator: (value) {
                                    if (double.tryParse(value.toString()) ==
                                        null) return 'Hãy nhập vào 1 số thực';
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
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('4. Lợi suất ước tính khi về hưu (%)',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  InkWell(
                                    onTap: () {},
                                    child: Text('Hướng dẫn',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff00865d),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  24,
                              child: TextFormField(
                                  controller: rateAfter,
                                  validator: (value) {
                                    if (double.tryParse(value.toString()) ==
                                        null) return 'Hãy nhập vào 1 số thực';
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
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '5. Lương hưu và thu nhập sau về hưu khác',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  InkWell(
                                    onTap: () {},
                                    child: Text('Hướng dẫn',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff00865d),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  24,
                              child: TextFormField(
                                  controller: pension,
                                  validator: (value) {
                                    if (double.tryParse(value.toString()) ==
                                        null) return 'Hãy nhập vào 1 số thực';
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
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  89,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map tmp = {
                          'annualSaving': double.parse(annualSaving.text),
                          'retirementPay': double.parse(retirementPay.text),
                          'rateBefore': double.parse(rateBefore.text),
                          'rateAfter': double.parse(rateAfter.text),
                          'pension': double.parse(pension.text),
                        };
                        widget.data.addAll(tmp);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RetirementReportScreen(
                                    widget.data, widget.addRetirementPlan)));
                        // addRetirementPlan(data);
                      }
                    },
                    child: Text('XEM KẾ HOẠCH'.toUpperCase())),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
