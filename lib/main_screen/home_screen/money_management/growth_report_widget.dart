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
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 8,
                height: MediaQuery.of(context).size.height / 333.5 * 1,
              ),
              Text(title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xff666666),
                  fontSize: 18 * curScaleFactor,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 69,
                height: MediaQuery.of(context).size.height / 333.5 * 1,
              ),
              TextButton(onPressed: () {},
                child: Text('Xem cách tính',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff00865D),
                    fontSize: 12 * curScaleFactor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),),
              ),
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
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 179.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 14,
                    decoration: BoxDecoration(
                        color: Color(0xffededed),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color(0xffededed),
                            width: 0.75
                        )
                    ),
                    child: TabBar(
                        // onTap: (index) {
                        //   //your currently selected index
                        // },
                        labelColor: Color(0xff12B281),
                        unselectedLabelColor: Color(0xff999999),
                        indicator: ShapeDecoration(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Color(0xffffffff),
                        ),
                        tabs: [
                          Tab(
                            child: Text('Chỉ số tăng trưởng',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                          ),
                          Tab(
                            child: Text('% tăng trưởng',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                          ),
                        ]),
                  ),
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
                                  : Text('Dữ liệu hiện tại chưa đủ để chúng tôi thống kê báo cáo này.',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff4d4d4d),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                              )),
                        ),
                        Container(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 40),
                              child: listPercentageGrowth.length > 1
                                  ? LineChartWidget(listMonths,
                                      listPercentageGrowth, 1, color)
                                  : Text('Dữ liệu hiện tại chưa đủ để chúng tôi thống kê báo cáo này.',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff4d4d4d),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                              )),
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
