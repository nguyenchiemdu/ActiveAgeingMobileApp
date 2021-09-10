import 'package:active_ageing_mobile_app/line_chart/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';

class GrowthReportWidget extends StatelessWidget {
  GrowthReportWidget(this.listMonths, this.listGrowth, this.title, this.color,
      {Key? key}) {
    baseValue = listGrowth[0].toDouble();
    listIndexGrowth = [];
    isAvailable = false;
    if (baseValue != 0) {
      listIndexGrowth.add(100);
      listPercentageGrowth.add(false);
      isAvailable = true;
      for (int i = 1; i < listGrowth.length; i++) {
        bool isOk = listGrowth[i - 1] != 0;
        int value = ((listGrowth[i] / baseValue) * 100).round();
        listIndexGrowth.add(value);
        if (isOk && isAvailable) {
          listPercentageGrowth
              .add(((listGrowth[i] / listGrowth[i - 1] - 1) * 100).round());
        } else
          isAvailable = false;
      }
    }
    print(listPercentageGrowth);
  }
  Color color;
  late bool isAvailable;
  late double baseValue;
  List<DateTime> listMonths;
  List listGrowth;
  late List listIndexGrowth;
  List listPercentageGrowth = [];
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(title),
              TextButton(onPressed: () {}, child: Text('Xem cách tính')),
            ],
          ),
          Container(
            height:
                listIndexGrowth.length > 1 && listPercentageGrowth.length > 1
                    ? 500
                    : 200,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                      // onTap: (index) {
                      //   //your currently selected index
                      // },
                      labelColor: Color(0xff12B281),
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text('Chỉ số tăng trưởng'),
                        ),
                        Tab(
                          child: Text('% tăng trưởng'),
                        ),
                      ]),
                  Expanded(
                    child: TabBarView(
                      // controller: _tabController ,
                      children: [
                        Container(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 40),
                              child: listIndexGrowth.length > 1
                                  ? LineChartWidget(
                                      listMonths, listIndexGrowth, 25, color)
                                  : Text('Dữ liệu k hợp lệ')),
                        ),
                        Container(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 40),
                              child: listPercentageGrowth.length > 1
                                  ? LineChartWidget(listMonths,
                                      listPercentageGrowth, 1, color)
                                  : Text('Dữ liệu k hợp lệ')),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
