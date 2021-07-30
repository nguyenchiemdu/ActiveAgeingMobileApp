import 'dart:math';

import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/fail_widget.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/success_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'summary_widget.dart';

class RetirementReportScreen extends StatelessWidget {
  RetirementReportScreen(this.data, {Key? key}) : super(key: key);
  final Map data;
  final listLabels = [];
  final beginningRetirementBalance = [];
  final investmentGrowth = [];
  final contributions = [];
  final retirementWithdrawals = [];
  final pension = [];
  final endingRetirementBalance = [];
  var start;
  var end;
  var retirementPaymentMoney;
  calculate() {
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
    calculate();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: Text(data['namePlan'],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: (24),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 4,
              ),
              DefaultTabController(
                length: 2,
                initialIndex: 1,
                child: Column(
                  children: [
                    TabBar(
                        labelColor: Color(0xff12B281),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text('TỔNG QUAN'.toUpperCase()),
                          ),
                          Tab(
                            child: Text('GỢI Ý TIẾT KIỆM'.toUpperCase()),
                          ),
                        ]),
                    Container(
                      height: MediaQuery.of(context).size.height / 333.5 * 298,
                      
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(child: SummaryWidget(data, retirementPaymentMoney, end)),
                          data['yearsRetirement'] >
                                  beginningRetirementBalance.length -
                                      (data['retirementAge'] - data['currentAge'])
                              ? FailWidget()
                              : SuccessWidget()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
