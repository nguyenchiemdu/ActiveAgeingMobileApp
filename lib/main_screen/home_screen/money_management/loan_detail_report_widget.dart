import 'package:flutter/material.dart';

import 'loan_detail_tab.dart';

class LoanDetailReportWidget extends StatelessWidget {
  const LoanDetailReportWidget(this.listLoanIncome, this.listLoanOutcome,
      {Key? key})
      : super(key: key);
  final List listLoanIncome;
  final List listLoanOutcome;

  @override
  Widget build(BuildContext context) {
    // final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    // final appBar = AppBar(
    //     centerTitle: true,
    //     titleTextStyle: TextStyle(
    //       fontFamily: 'Inter',
    //       color: Color(0xffecf9f4),
    //       fontSize: 16 * curScaleFactor,
    //       fontWeight: FontWeight.w500,
    //       fontStyle: FontStyle.normal,
    //     ),
    //     title: Text("Báo cáo"));
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
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
                  child: Text('Nợ'),
                ),
                Tab(
                  child: Text('Cho vay'),
                ),
              ]),
          Expanded(
            // height: (MediaQuery.of(context).size.height) / 333.5 * 298,
            child: TabBarView(
              // controller: _tabController ,
              children: [
                LoanDetailTab(listLoanIncome, 'Khoản nợ (phải trả)'),
                LoanDetailTab(listLoanOutcome, 'Khoản cho vay (phải thu)'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
