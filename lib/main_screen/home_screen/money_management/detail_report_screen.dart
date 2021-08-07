import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/detail_report_widget.dart';
import 'package:flutter/material.dart';

import 'loan_detail_report_widget.dart';

class DetailReportScreen extends StatelessWidget {
  DetailReportScreen(
      this.listPercentageIncome,
      this.listIncome,
      this.listPercentageOutcome,
      this.listOutcome,
      this.incomeValue,
      this.outcomeValue,
      this.listLoanIncome,
      this.listLoanOutcome,
      this.initialIndex,
      {Key? key})
      : super(key: key);
  final List listPercentageIncome;
  final List listIncome;
  final List listPercentageOutcome;
  final List listOutcome;
  final double incomeValue;
  final double outcomeValue;
  final List listLoanIncome;
  final List listLoanOutcome;
  final int initialIndex;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        title: Text("Báo cáo"));
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: DefaultTabController(
          length: 3,
          initialIndex: initialIndex,
          child: Column(
            children: [
              TabBar(
                  onTap: (index) {
                    //your currently selected index
                  },
                  labelColor: Color(0xff12B281),
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text('Thu'.toUpperCase()),
                    ),
                    Tab(
                      child: Text('Chi'.toUpperCase()),
                    ),
                    Tab(
                      child: Text('Vay nợ'.toUpperCase()),
                    ),
                  ]),
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height) /
                    333.5 *
                    298,
                child: TabBarView(
                  // controller: _tabController ,
                  children: [
                    DetailReportWidget(
                        listPercentageIncome, listIncome, incomeValue, '+'),
                    DetailReportWidget(
                        listPercentageOutcome, listOutcome, outcomeValue, '-'),
                    LoanDetailReportWidget(listLoanIncome, listLoanOutcome),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
