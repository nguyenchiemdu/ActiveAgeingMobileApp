import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/pop_up.dart';
import 'package:flutter/material.dart';

import 'add_retirement_financial.dart';

class AddRetirementBacisInfor extends StatelessWidget {
  AddRetirementBacisInfor(this.name, this.addRetirementPlan, {Key? key})
      : super(key: key);
  final Function addRetirementPlan;
  final String name;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController currentAge = TextEditingController();
  final TextEditingController retirementAge = TextEditingController();
  final TextEditingController income = TextEditingController();
  final TextEditingController increase = TextEditingController();
  final TextEditingController saving = TextEditingController();
  final TextEditingController yearsRetirement = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    List<String> listContent = [
      "Tổng thu nhập của bạn trong năm hiện tại. Nếu thu nhập trong năm nay của bạn là 180 triệu VND, vui lòng nhập '180'.",
      "Tỷ lệ thu nhập ước tính tăng hàng năm cho đến năm nghỉ hưu dự kiến của bạn. Nếu bạn ước tính mức lương hàng năm của bạn sẽ tăng 2%, vui lòng nhập '2'",
      "Số dư tài khoản tiết kiệm về hưu hiện tại của bạn. Giả sử bạn đã tích góp được 700 triệu VNĐ cho quỹ tiết kiệm hưu trí của mình, vui lòng nhập '700'.",
      "Tổng số năm bạn dự định sử dụng quỹ tiết kiệm hưu trí của mình để chi tiêu kể từ năm bạn nghỉ hưu. Giả sử bạn dự định về hưu ở tuổi 60 và mong muốn duy trì mức sống thoải mái trong vòng 30 năm nữa nhờ quỹ tiết kiệm hưu trí của mình, vui lòng nhập '30'. Nói cách khác, tuổi thọ dự kiến của bạn trong trường hợp này là 60 + 30 = 90 (tuổi)."
    ];
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Text(name,
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
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Text("Thông tin cơ bản",
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
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
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
                                child: Text('1. Tuổi hiện tại',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff1a1a1a),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
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
                                    keyboardType: TextInputType.number,
                                    controller: currentAge,
                                    validator: (value) {
                                      if (int.tryParse(value.toString()) ==
                                          null)
                                        return 'Hãy nhập vào 1 số nguyên';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                child: Text('2. Tuổi về hưu dự kiến',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xff1a1a1a),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
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
                                    keyboardType: TextInputType.number,
                                    controller: retirementAge,
                                    validator: (value) {
                                      if (int.tryParse(value.toString()) ==
                                          null)
                                        return 'Hãy nhập vào 1 số nguyên';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                    Text('3. Thu nhập hàng năm',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff1a1a1a),
                                          fontSize: 14 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                    InkWell(
                                      onTap: () => showPopUp(context,
                                          'Thu nhập hàng năm', listContent[0]),
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
                                    keyboardType: TextInputType.number,
                                    controller: income,
                                    validator: (value) {
                                      if (double.tryParse(value.toString()) ==
                                          null) return 'Hãy nhập vào 1 số thực';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                    Text('4. Tăng trưởng thu nhập hàng năm (%)',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff1a1a1a),
                                          fontSize: 14 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                    InkWell(
                                      onTap: () => showPopUp(
                                          context,
                                          'Tăng trưởng thu nhập hàng năm (%)',
                                          listContent[1]),
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
                                    keyboardType: TextInputType.number,
                                    controller: increase,
                                    validator: (value) {
                                      if (double.tryParse(value.toString()) ==
                                          null) return 'Hãy nhập vào 1 số thực';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                    Text('5.Số dư quỹ tiết kiệm hiện tại',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff1a1a1a),
                                          fontSize: 14 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                    InkWell(
                                      onTap: () => showPopUp(
                                          context,
                                          'Số dư quỹ tiết kiệm hiện tại',
                                          listContent[2]),
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
                                    keyboardType: TextInputType.number,
                                    controller: saving,
                                    validator: (value) {
                                      if (double.tryParse(value.toString()) ==
                                          null) return 'Hãy nhập vào 1 số thực';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                        '6. Số năm dùng khoản tiết kiệm hưu trí',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff1a1a1a),
                                          fontSize: 14 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                    InkWell(
                                      onTap: () => showPopUp(
                                          context,
                                          'Số năm dùng khoản tiết kiệm hưu trí',
                                          listContent[3]),
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
                                    keyboardType: TextInputType.number,
                                    controller: yearsRetirement,
                                    validator: (value) {
                                      if (int.tryParse(value.toString()) ==
                                          null)
                                        return 'Hãy nhập vào 1 số nguyên';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                          Map data = {
                            'namePlan': name,
                            'currentAge': double.parse(currentAge.text),
                            'retirementAge': double.parse(retirementAge.text),
                            'income': double.parse(income.text),
                            'increase': double.parse(increase.text),
                            'saving': double.parse(saving.text),
                            'yearsRetirement':
                                double.parse(yearsRetirement.text),
                          };
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddRetirementFinancial(
                                      data, addRetirementPlan)));
                        } else {}
                      },
                      child: Text('TIẾP THEO'.toUpperCase())),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
