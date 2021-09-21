import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/pop_up.dart';

class EditRetirementPlan extends StatefulWidget {
  EditRetirementPlan(this.dataPlan, {Key? key}) : super(key: key);
  // final Function addRetirementPlan;
  final Map dataPlan;

  @override
  _EditRetirementPlanState createState() => _EditRetirementPlanState(dataPlan);
}

class _EditRetirementPlanState extends State<EditRetirementPlan> {
  final _formKey = GlobalKey<FormState>();
  _EditRetirementPlanState(Map dataPlan) {
    currentAge = TextEditingController(
        text: (dataPlan['currentAge']).round().toString());
    retirementAge = TextEditingController(
        text: dataPlan['retirementAge'].round().toString());
    income = TextEditingController(text: dataPlan['income'].toString());
    increase = TextEditingController(text: dataPlan['increase'].toString());
    saving = TextEditingController(text: dataPlan['saving'].toString());
    yearsRetirement = TextEditingController(
        text: dataPlan['yearsRetirement'].round().toString());
    //----------
    annualSaving =
        TextEditingController(text: dataPlan['annualSaving'].toString());
    retirementPay =
        TextEditingController(text: dataPlan['retirementPay'].toString());
    rateBefore = TextEditingController(text: dataPlan['rateBefore'].toString());
    rateAfter = TextEditingController(text: dataPlan['rateAfter'].toString());
    pensionController =
        TextEditingController(text: dataPlan['pension'].toString());
  }
  late TextEditingController currentAge;

  late TextEditingController retirementAge;

  late TextEditingController income;

  late TextEditingController increase;

  late TextEditingController saving;

  late TextEditingController yearsRetirement;

  late TextEditingController annualSaving;

  late TextEditingController retirementPay;

  late TextEditingController rateBefore;

  late TextEditingController rateAfter;

  late TextEditingController pensionController;

  List<String> listContent = [
    "Tổng thu nhập của bạn trong năm hiện tại. Nếu thu nhập trong năm nay của bạn là 180 triệu VND, vui lòng nhập '180'.",
    "Tỷ lệ thu nhập ước tính tăng hàng năm cho đến năm nghỉ hưu dự kiến của bạn. Nếu bạn ước tính mức lương hàng năm của bạn sẽ tăng 2%, vui lòng nhập '2'",
    "Số dư tài khoản tiết kiệm về hưu hiện tại của bạn. Giả sử bạn đã tích góp được 700 triệu VNĐ cho quỹ tiết kiệm hưu trí của mình, vui lòng nhập '700'.",
    "Tổng số năm bạn dự định sử dụng quỹ tiết kiệm hưu trí của mình để chi tiêu kể từ năm bạn nghỉ hưu. Giả sử bạn dự định về hưu ở tuổi 60 và mong muốn duy trì mức sống thoải mái trong vòng 30 năm nữa nhờ quỹ tiết kiệm hưu trí của mình, vui lòng nhập '30'. Nói cách khác, tuổi thọ dự kiến của bạn trong trường hợp này là 60 + 30 = 90 (tuổi)."
  ];

  List<String> listContent1 = [
    "Phần trăm thu nhập hàng năm sẽ được đóng góp vào quỹ tiết kiệm hưu trí của bạn mỗi năm. Nếu thu nhập hàng năm của bạn là 180 triệu VNĐ và tỷ lệ đóng góp hàng năm của bạn là 8%, vui lòng nhập '8'. Như vậy, mức đóng góp hàng năm bằng 180 x 8% = 14.4 triệu VNĐ.",
    "Tỷ lệ phần trăm thu nhập hộ gia đình sau khi nghỉ hưu mà bạn nghĩ rằng bạn sẽ cần để trang trải các chi phí của mình khi nghỉ hưu. Số tiền này dựa trên thu nhập hộ gia đình trong năm làm việc cuối cùng của bạn (năm ngay trước khi bạn nghỉ hưu). Giả sử bạn dự định về hưu ở tuổi 60, thu nhập năm bạn 59 tuổi là 210 triệu VNĐ, và bạn tin rằng tỷ lệ này là 60%, vui lòng nhập '60'. Khi đó, số tiền mà bạn cần để chi tiêu vào năm 60 tuổi bằng 210 x 60% = 126 triệu VNĐ.",
    "Tỷ suất lợi nhuận kỳ vọng hàng năm trên quỹ tiết kiệm hưu trí của bạn trước khi nghỉ hưu. Lưu ý rằng tỷ lệ này có xu hướng giảm theo thời gian. Nếu bạn kỳ vọng tỷ suất trên là 7%, vui lòng nhập '7'.",
    "Tỷ suất lợi nhuận kỳ vọng hàng năm trên quỹ tiết kiệm hưu trí của bạn sau khi nghỉ hưu. Lưu ý rằng tỷ lệ này có xu hướng giảm theo thời gian. Nếu bạn kỳ vọng tỷ suất trên là 4%, vui lòng nhập '4'.",
    "Thu nhập dự kiến từ lương hưu hoặc các nguồn khác. Nếu bạn dự đoán mức lương hưu của mình là 2 triệu VNĐ mỗi tháng hay 24 triệu VNĐ mỗi năm, vui lòng nhập '24'."
  ];

  var listLabels = [];

  var beginningRetirementBalance = [];

  var investmentGrowth = [];

  var contributions = [];

  var retirementWithdrawals = [];

  var pension = [];

  var endingRetirementBalance = [];

  var start;

  var end;

  var retirementPaymentMoney;

  calculate(Map data) {
    listLabels = [];
    beginningRetirementBalance = [];
    investmentGrowth = [];
    contributions = [];
    retirementWithdrawals = [];
    pension = [];
    endingRetirementBalance = [];
    data['inflation'] = 3.5;
    print(data);
    data['year'] = data['retirementAge'] - data['currentAge'];
    data['lastYearIncome'] =
        data['income'] * pow(1 + data['increase'] / 100, data['year'] - 1);
    retirementPaymentMoney =
        data['lastYearIncome'] * data['retirementPay'] / 100;

    beginningRetirementBalance.add((data['saving']));
    investmentGrowth.add(data['saving'] * data['rateBefore'] / 100);
    contributions.add(data['income'] * data['annualSaving'] / 100); // can sua
    retirementWithdrawals.add(0);
    pension.add(0);
    var tmp = beginningRetirementBalance[0] +
        investmentGrowth[0] +
        contributions[0] -
        retirementWithdrawals[0];
    endingRetirementBalance.add(tmp);

    var i = (data['currentAge']) + 1;
    var check = beginningRetirementBalance[0];
    while ((check > 0 &&
            i < (data['retirementAge']) + (data['yearsRetirement']) + 1) ||
        i == (data['currentAge']) + 1) {
      beginningRetirementBalance.add(lastValue(endingRetirementBalance));
      var rate;
      if (i < data['retirementAge'])
        rate = data['rateBefore'];
      else
        rate = data['rateAfter'];
      investmentGrowth.add(lastValue(beginningRetirementBalance) * rate / 100);
      if (i < data['retirementAge'])
        contributions.add((data['income'] * (data['annualSaving']) / 100) *
            pow(1 + (data['increase']) / 100, i - (data['currentAge'])));
      else
        contributions.add(0);
      if (data['retirementAge'] > i)
        retirementWithdrawals.add(0);
      else
        retirementWithdrawals.add(retirementPaymentMoney *
            pow(1 + data['inflation'] / 100, i - data['retirementAge']));
      if (i < data['retirementAge'])
        pension.add(0);
      else
        pension.add((data['pension']));
      endingRetirementBalance.add(lastValue(beginningRetirementBalance) +
          lastValue(investmentGrowth) +
          lastValue(contributions) +
          (lastValue(pension)) -
          lastValue(retirementWithdrawals));
      check = lastValue(beginningRetirementBalance);
      i++;

      if (lastValue(endingRetirementBalance) < 0)
        endingRetirementBalance[endingRetirementBalance.length - 1] = 0;
      if (lastValue(beginningRetirementBalance) < 0)
        beginningRetirementBalance[beginningRetirementBalance.length - 1] = 0;
    }
    start = (data['currentAge']);
    end = (data['retirementAge']) + (data['yearsRetirement']);
    end = i - 2;
  }

  dynamic lastValue(list) {
    return list[list.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    print('build lai');
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
          title: Text("Sửa thông tin")),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          // width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: Text(widget.dataPlan['namePlan'],
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
                height: MediaQuery.of(context).size.height / 333.5 * 10,
              ),
              Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: currentAge,
                              validator: (value) {
                                if (int.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số nguyên';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: retirementAge,
                              validator: (value) {
                                if (int.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số nguyên';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: income,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: increase,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: saving,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('6. Số năm dùng khoản tiết kiệm hưu trí',
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: yearsRetirement,
                              validator: (value) {
                                if (int.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số nguyên';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
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
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 10,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                onTap: () => showPopUp(
                                    context,
                                    ' Khoản tiết kiệm về hưu hàng năm (%)',
                                    listContent1[0]),
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: annualSaving,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                onTap: () => showPopUp(
                                    context,
                                    'Thu nhập yêu cầu khi về hưu (%)',
                                    listContent1[1]),
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: retirementPay,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('3. Lợi suất ước tính trước khi về hưu (%)',
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
                                    'Lợi suất ước tính trước khi về hưu (%)',
                                    listContent1[2]),
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: rateBefore,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                onTap: () => showPopUp(
                                    context,
                                    'Lợi suất ước tính khi về hưu (%)',
                                    listContent1[3]),
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: rateAfter,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('5. Lương hưu và thu nhập sau về hưu khác',
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
                                    'Lương hưu và thu nhập sau về hưu khác',
                                    listContent1[4]),
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
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 24,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: pensionController,
                              validator: (value) {
                                if (double.tryParse(value.toString()) == null)
                                  return 'Hãy nhập vào 1 số thực';
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
                      ],
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map tmp = {
                          'namePlan': widget.dataPlan['namePlan'],
                          'currentAge': double.parse(currentAge.text),
                          'retirementAge': double.parse(retirementAge.text),
                          'income': double.parse(income.text),
                          'increase': double.parse(increase.text),
                          'saving': double.parse(saving.text),
                          'yearsRetirement': double.parse(yearsRetirement.text),
                          //======
                          'annualSaving': double.parse(annualSaving.text),
                          'retirementPay': double.parse(retirementPay.text),
                          'rateBefore': double.parse(rateBefore.text),
                          'rateAfter': double.parse(rateAfter.text),
                          'pension': double.parse(pensionController.text),
                        };

                        calculate(tmp);
                        tmp['goal'] = endingRetirementBalance[
                            (tmp['retirementAge'] - tmp['currentAge']).round() -
                                1];
                        tmp['savedMoney'] = tmp['saving'];

                        if (!(tmp['yearsRetirement'] >
                            beginningRetirementBalance.length -
                                (tmp['retirementAge'] - tmp['currentAge'])))
                          Navigator.pop(context, tmp);
                        else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text(
                                        'Kế hoạch về hưu chưa hợp lí'),
                                    content: const Text(
                                        'Bạn hãy sửa lại các chỉ số để có một kế hoạch hợp lí nhé!'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                          // print('ke hoach chua hop li');
                        }
                        // print(tmp);
                        // List tmp = listRetirement;
                        // tmp.add(data);
                        // print(tmp);

                        // data.addAll(tmp);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        // addRetirementPlan(data);
                      }
                    },
                    child: Text('THAY ĐỔI THÔNG TIN'.toUpperCase())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
