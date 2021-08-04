import 'dart:math';

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
    calculate(data);
    data['goal'] = endingRetirementBalance[
        (data['retirementAge'] - data['currentAge']).round() - 1];
    data['savedMoney'] = data['saving'];
    print(data);
    List tmp = listRetirement;
    tmp.add(data);
    updateData(tmp);
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => RetirementReportScreen(data)));
  }

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
          title: Text("Kế hoạch về hưu")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listRetirementWidget,
                ),
              )
            ],
          ),
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
        child: Icon(
          Icons.add,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
