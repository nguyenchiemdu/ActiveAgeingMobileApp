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
    "T???ng thu nh???p c???a b???n trong n??m hi???n t???i. N???u thu nh???p trong n??m nay c???a b???n l?? 180 tri???u VND, vui l??ng nh???p '180'.",
    "T??? l??? thu nh???p ?????c t??nh t??ng h??ng n??m cho ?????n n??m ngh??? h??u d??? ki???n c???a b???n. N???u b???n ?????c t??nh m???c l????ng h??ng n??m c???a b???n s??? t??ng 2%, vui l??ng nh???p '2'",
    "S??? d?? t??i kho???n ti???t ki???m v??? h??u hi???n t???i c???a b???n. Gi??? s??? b???n ???? t??ch g??p ???????c 700 tri???u VN?? cho qu??? ti???t ki???m h??u tr?? c???a m??nh, vui l??ng nh???p '700'.",
    "T???ng s??? n??m b???n d??? ?????nh s??? d???ng qu??? ti???t ki???m h??u tr?? c???a m??nh ????? chi ti??u k??? t??? n??m b???n ngh??? h??u. Gi??? s??? b???n d??? ?????nh v??? h??u ??? tu???i 60 v?? mong mu???n duy tr?? m???c s???ng tho???i m??i trong v??ng 30 n??m n???a nh??? qu??? ti???t ki???m h??u tr?? c???a m??nh, vui l??ng nh???p '30'. N??i c??ch kh??c, tu???i th??? d??? ki???n c???a b???n trong tr?????ng h???p n??y l?? 60 + 30 = 90 (tu???i)."
  ];

  List<String> listContent1 = [
    "Ph???n tr??m thu nh???p h??ng n??m s??? ???????c ????ng g??p v??o qu??? ti???t ki???m h??u tr?? c???a b???n m???i n??m. N???u thu nh???p h??ng n??m c???a b???n l?? 180 tri???u VN?? v?? t??? l??? ????ng g??p h??ng n??m c???a b???n l?? 8%, vui l??ng nh???p '8'. Nh?? v???y, m???c ????ng g??p h??ng n??m b???ng 180 x 8% = 14.4 tri???u VN??.",
    "T??? l??? ph???n tr??m thu nh???p h??? gia ????nh sau khi ngh??? h??u m?? b???n ngh?? r???ng b???n s??? c???n ????? trang tr???i c??c chi ph?? c???a m??nh khi ngh??? h??u. S??? ti???n n??y d???a tr??n thu nh???p h??? gia ????nh trong n??m l??m vi???c cu???i c??ng c???a b???n (n??m ngay tr?????c khi b???n ngh??? h??u). Gi??? s??? b???n d??? ?????nh v??? h??u ??? tu???i 60, thu nh???p n??m b???n 59 tu???i l?? 210 tri???u VN??, v?? b???n tin r???ng t??? l??? n??y l?? 60%, vui l??ng nh???p '60'. Khi ????, s??? ti???n m?? b???n c???n ????? chi ti??u v??o n??m 60 tu???i b???ng 210 x 60% = 126 tri???u VN??.",
    "T??? su???t l???i nhu???n k??? v???ng h??ng n??m tr??n qu??? ti???t ki???m h??u tr?? c???a b???n tr?????c khi ngh??? h??u. L??u ?? r???ng t??? l??? n??y c?? xu h?????ng gi???m theo th???i gian. N???u b???n k??? v???ng t??? su???t tr??n l?? 7%, vui l??ng nh???p '7'.",
    "T??? su???t l???i nhu???n k??? v???ng h??ng n??m tr??n qu??? ti???t ki???m h??u tr?? c???a b???n sau khi ngh??? h??u. L??u ?? r???ng t??? l??? n??y c?? xu h?????ng gi???m theo th???i gian. N???u b???n k??? v???ng t??? su???t tr??n l?? 4%, vui l??ng nh???p '4'.",
    "Thu nh???p d??? ki???n t??? l????ng h??u ho???c c??c ngu???n kh??c. N???u b???n d??? ??o??n m???c l????ng h??u c???a m??nh l?? 2 tri???u VN?? m???i th??ng hay 24 tri???u VN?? m???i n??m, vui l??ng nh???p '24'."
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
          title: Text("S???a th??ng tin")),
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
                child: Text("Th??ng tin c?? b???n",
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
                          child: Text('1. Tu???i hi???n t???i',
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
                                  return 'H??y nh???p v??o 1 s??? nguy??n';
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
                          child: Text('2. Tu???i v??? h??u d??? ki???n',
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
                                  return 'H??y nh???p v??o 1 s??? nguy??n';
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
                              Text('3. Thu nh???p h??ng n??m',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff1a1a1a),
                                    fontSize: 14 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                              InkWell(
                                onTap: () => showPopUp(context,
                                    'Thu nh???p h??ng n??m', listContent[0]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('4. T??ng tr?????ng thu nh???p h??ng n??m (%)',
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
                                    'T??ng tr?????ng thu nh???p h??ng n??m (%)',
                                    listContent[1]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('5.S??? d?? qu??? ti???t ki???m hi???n t???i',
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
                                    'S??? d?? qu??? ti???t ki???m hi???n t???i',
                                    listContent[2]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('6. S??? n??m d??ng kho???n ti???t ki???m h??u tr??',
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
                                    'S??? n??m d??ng kho???n ti???t ki???m h??u tr??',
                                    listContent[3]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? nguy??n';
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
                          child: Text("Th??ng tin t??i ch??nh",
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
                              Text('1. Kho???n ti???t ki???m v??? h??u h??ng n??m (%)',
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
                                    ' Kho???n ti???t ki???m v??? h??u h??ng n??m (%)',
                                    listContent1[0]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('2. Thu nh???p y??u c???u khi v??? h??u (%)',
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
                                    'Thu nh???p y??u c???u khi v??? h??u (%)',
                                    listContent1[1]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('3. L???i su???t ?????c t??nh tr?????c khi v??? h??u (%)',
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
                                    'L???i su???t ?????c t??nh tr?????c khi v??? h??u (%)',
                                    listContent1[2]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('4. L???i su???t ?????c t??nh khi v??? h??u (%)',
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
                                    'L???i su???t ?????c t??nh khi v??? h??u (%)',
                                    listContent1[3]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                              Text('5. L????ng h??u v?? thu nh???p sau v??? h??u kh??c',
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
                                    'L????ng h??u v?? thu nh???p sau v??? h??u kh??c',
                                    listContent1[4]),
                                child: Text('H?????ng d???n',
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
                                  return 'H??y nh???p v??o 1 s??? th???c';
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
                                        'K??? ho???ch v??? h??u ch??a h???p l??'),
                                    content: const Text(
                                        'B???n h??y s???a l???i c??c ch??? s??? ????? c?? m???t k??? ho???ch h???p l?? nh??!'),
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
                    child: Text('THAY ?????I TH??NG TIN'.toUpperCase())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
