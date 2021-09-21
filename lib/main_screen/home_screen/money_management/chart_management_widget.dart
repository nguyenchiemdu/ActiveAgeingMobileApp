import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bar_chart_page.dart';

class ChartManagementWidget extends StatefulWidget {
  ChartManagementWidget(this.listTransaction, this.timePicker, {Key? key})
      : super(key: key);
  final List listTransaction;
  final timePicker;

  @override
  _ChartManagementWidgetState createState() => _ChartManagementWidgetState();
}

class _ChartManagementWidgetState extends State<ChartManagementWidget> {
  String selectedChartType = 'Thu nhập ròng';
  final List<String> listChartType = ['Tương quan thu và chi', 'Thu nhập ròng'];

  List listDay = [];

  List<SummaryData> chartDataByDay = [];

  int maxYbyDay = 1;

  int minYbyDay = 0;
  int factor = 0;
  calculateChartDataByDate() {
    listDay = [];
    chartDataByDay = [];
    maxYbyDay = 0;
    minYbyDay = 0;
    // dayFactor = 67;
    DateTime startTime = widget.timePicker['startTime'];
    DateTime endTime = widget.timePicker['endTime'];
    if (widget.listTransaction.length == 0) {
      fillEmptyDay(startTime, endTime);
      int id = -1;
      chartDataByDay = listDay.map((date) {
        maxYbyDay = max(
            maxYbyDay,
            max(date['listMoney'][0]['value'].round(),
                date['listMoney'][1]['value'].round()));
        id++;
        List logaritedMoney = date['listMoney'];
        logaritedMoney[0]['value'] = logaritedMoney[0]['value'] >= 1
            ? log(logaritedMoney[0]['value']) / ln10
            : 0;
        logaritedMoney[1]['value'] = logaritedMoney[1]['value'] >= 1
            ? log(logaritedMoney[1]['value']) / ln10
            : 0;
        return SummaryData(id, date['time'].day.toString(), logaritedMoney);
      }).toList();
      maxYbyDay = 1;
    } else {
      List sortedTransaction = widget.listTransaction;
      sortedTransaction
          .sort((a, b) => a['time'].toDate().compareTo(b['time'].toDate()));

      fillEmptyDay(startTime, sortedTransaction[0]['time'].toDate());
      for (int i = 0; i < sortedTransaction.length; i++) {
        DateTime time = sortedTransaction[i]['time'].toDate();
        time = DateTime(time.year, time.month, time.day);
        // transaction dau tien
        if (i == 0) {
          List listMoney = [
            {'value': 0, 'color': Color(0xff12B281)},
            {'value': 0, 'color': Color(0xffF89595)}
          ];
          if (sortedTransaction[i]['method'] == '+')
            listMoney[0]['value'] += sortedTransaction[i]['money'];
          else
            listMoney[1]['value'] += sortedTransaction[i]['money'];
          listDay
              .add({'time': time, 'title': time.day, 'listMoney': listMoney});
        }
        //transaction thu i
        else {
          DateTime before = sortedTransaction[i - 1]['time'].toDate();
          DateTime current = sortedTransaction[i]['time'].toDate();

          // 2 transaction cung ngay thi cong vao truoc do
          if (IsEqual(before, current).inDay()) {
            if (sortedTransaction[i]['method'] == '+')
              listDay[listDay.length - 1]['listMoney'][0]['value'] +=
                  sortedTransaction[i]['money'];
            else
              listDay[listDay.length - 1]['listMoney'][1]['value'] +=
                  sortedTransaction[i]['money'];
          }
          //neu k thi tao moi
          else {
            DateTime newDate = before.add(Duration(days: 1));
            fillEmptyDay(newDate, current);
            List listMoney = [
              {'value': 0, 'color': Color(0xff12B281)},
              {'value': 0, 'color': Color(0xffF89595)}
            ];
            if (sortedTransaction[i]['method'] == '+')
              listMoney[0]['value'] += sortedTransaction[i]['money'];
            else
              listMoney[1]['value'] += sortedTransaction[i]['money'];
            listDay
                .add({'time': time, 'title': time.day, 'listMoney': listMoney});
          }
        }
      }
      DateTime newDate =
          sortedTransaction[sortedTransaction.length - 1]['time'].toDate();
      fillEmptyDay(newDate, endTime);
      int id = -1;
      chartDataByDay = listDay.map((date) {
        maxYbyDay = max(
            maxYbyDay,
            max(date['listMoney'][0]['value'].round(),
                date['listMoney'][1]['value'].round()));
        id++;
        List logaritedMoney = [
          {'value': 0, 'color': Color(0xff12B281)},
          {'value': 0, 'color': Color(0xffF89595)}
        ];
        logaritedMoney[0]['value'] = date['listMoney'][0]['value'] >= 1
            ? log(date['listMoney'][0]['value']) / ln10
            : 0;
        logaritedMoney[1]['value'] = date['listMoney'][1]['value'] >= 1
            ? log(date['listMoney'][1]['value']) / ln10
            : 0;
        return SummaryData(id, date['time'].day.toString(), logaritedMoney);
      }).toList();
      maxYbyDay = maxYbyDay == 0 ? 0 : (log(maxYbyDay) / ln10).round();
    }
  }

  calculateChartDataByNetDate() {
    listDay = [];
    chartDataByDay = [];
    maxYbyDay = 1;
    minYbyDay = -1;
    DateTime startTime = widget.timePicker['startTime'];
    DateTime endTime = widget.timePicker['endTime'];
    if (widget.listTransaction.length == 0) {
      fillEmptyDay(startTime, endTime);
      int id = -1;
      chartDataByDay = listDay.map((date) {
        id++;
        List sumMoney = [
          {'color': Color(0xff12B281), 'value': 0}
        ];
        return SummaryData(id, date['time'].day.toString(), sumMoney);
      }).toList();
      maxYbyDay = 1;
      minYbyDay = -1;
    } else {
      List sortedTransaction = widget.listTransaction;
      sortedTransaction
          .sort((a, b) => a['time'].toDate().compareTo(b['time'].toDate()));

      fillEmptyDay(startTime, sortedTransaction[0]['time'].toDate());
      for (int i = 0; i < sortedTransaction.length; i++) {
        DateTime time = sortedTransaction[i]['time'].toDate();
        time = DateTime(time.year, time.month, time.day);
        // transaction dau tien
        if (i == 0) {
          List listMoney = [
            {'value': 0, 'color': Color(0xff12B281)},
            {'value': 0, 'color': Color(0xffF89595)}
          ];
          if (sortedTransaction[i]['method'] == '+')
            listMoney[0]['value'] += sortedTransaction[i]['money'];
          else
            listMoney[1]['value'] += sortedTransaction[i]['money'];
          listDay
              .add({'time': time, 'title': time.day, 'listMoney': listMoney});
        }
        //transaction thu i
        else {
          DateTime before = sortedTransaction[i - 1]['time'].toDate();
          DateTime current = sortedTransaction[i]['time'].toDate();

          // 2 transaction cung ngay thi cong vao truoc do
          if (IsEqual(before, current).inDay()) {
            if (sortedTransaction[i]['method'] == '+')
              listDay[listDay.length - 1]['listMoney'][0]['value'] +=
                  sortedTransaction[i]['money'];
            else
              listDay[listDay.length - 1]['listMoney'][1]['value'] +=
                  sortedTransaction[i]['money'];
          }
          //neu k thi tao moi
          else {
            DateTime newDate = before.add(Duration(days: 1));
            fillEmptyDay(newDate, current);
            List listMoney = [
              {'value': 0, 'color': Color(0xff12B281)},
              {'value': 0, 'color': Color(0xffF89595)}
            ];
            if (sortedTransaction[i]['method'] == '+')
              listMoney[0]['value'] += sortedTransaction[i]['money'];
            else
              listMoney[1]['value'] += sortedTransaction[i]['money'];
            listDay
                .add({'time': time, 'title': time.day, 'listMoney': listMoney});
          }
        }
      }
      DateTime newDate =
          sortedTransaction[sortedTransaction.length - 1]['time'].toDate();
      fillEmptyDay(newDate, endTime);
      int id = -1;
      chartDataByDay = listDay.map((date) {
        id++;
        double sum =
            (date['listMoney'][0]['value'] - date['listMoney'][1]['value'])
                .toDouble();
        if (sum != 0 && sum > 0) sum = log(sum) / ln10;
        if (sum != 0 && sum < 0) sum = -log(-sum) / ln10;
        maxYbyDay = max(maxYbyDay, sum.round());
        minYbyDay = min(minYbyDay, sum.floor());
        List sumMoney = [
          {
            'value': sum,
            'color': sum >= 0 ? Color(0xff12B281) : Color(0xffF89595)
          }
        ];
        return SummaryData(id, date['time'].day.toString(), sumMoney);
      }).toList();
      // maxYbyDay = (log(maxYbyDay) / ln10).round();
    }
  }

  List listWeek = [];

  List<SummaryData> chartDataByWeek = [];

  int maxYbyWeek = 0;

  int minYbyWeek = 0;

  calculateChartDataByWeek() {
    listWeek = [];
    chartDataByWeek = [];
    maxYbyWeek = 1;
    minYbyWeek = 0;
    int i = 0;
    // Map data = {
    //   'title': listDay[i]['time'].day.toString(),
    //   'listMoney': [
    //     {
    //       'value': listDay[i]['listMoney'][0]['value'],
    //       'color': Color(0xff12B281)
    //     },
    //     {
    //       'value': listDay[i]['listMoney'][1]['value'],
    //       'color': Color(0xffF89595)
    //     }
    //   ]
    // };
    // i++;
    // DateTime now = DateTime.now();
    // while (listDay[i]['time'].weekday != 1) {
    //   data['listMoney'][0]['value'] += listDay[i]['listMoney'][0]['value'];
    //   data['listMoney'][1]['value'] += listDay[i]['listMoney'][1]['value'];
    //   i++;
    // }
    // data['title'] += '-' +
    //     listDay[i - 1]['time'].day.toString() +
    //     '/' +
    //     listDay[i - 1]['time'].month.toString();
    // listWeek.add(data);
    while (i < listDay.length) {
      Map data = {
        'title': listDay[i]['time'].day.toString(),
        'listMoney': [
          {
            'value': listDay[i]['listMoney'][0]['value'],
            'color': Color(0xff12B281)
          },
          {
            'value': listDay[i]['listMoney'][1]['value'],
            'color': Color(0xffF89595)
          }
        ]
      };
      i++;
      while (i < listDay.length && listDay[i]['time'].weekday != 1) {
        data['listMoney'][0]['value'] += listDay[i]['listMoney'][0]['value'];
        data['listMoney'][1]['value'] += listDay[i]['listMoney'][1]['value'];
        i++;
      }
      data['title'] += '-' +
          listDay[i - 1]['time'].day.toString() +
          '/' +
          listDay[i - 1]['time'].month.toString();
      listWeek.add(data);
    }

    int id = -1;
    chartDataByWeek = listWeek.map((week) {
      maxYbyWeek = max(
          maxYbyWeek,
          max(week['listMoney'][0]['value'].round(),
              week['listMoney'][1]['value'].round()));
      id++;
      List logaritedMoney = week['listMoney'];
      logaritedMoney[0]['value'] = logaritedMoney[0]['value'] >= 1
          ? log(logaritedMoney[0]['value']) / ln10
          : 0;
      logaritedMoney[1]['value'] = logaritedMoney[1]['value'] >= 1
          ? log(logaritedMoney[1]['value']) / ln10
          : 0;
      return SummaryData(id, week['title'], logaritedMoney);
    }).toList();
    maxYbyWeek = maxYbyWeek == 0 ? 1 : (log(maxYbyWeek) / ln10).round();
  }

  calculateChartDataNetWeek() {
    listWeek = [];
    chartDataByWeek = [];
    maxYbyWeek = 1;
    minYbyWeek = -1;
    int i = 0;
    while (i < listDay.length) {
      Map data = {
        'title': listDay[i]['time'].day.toString(),
        'listMoney': [
          {
            'value': listDay[i]['listMoney'][0]['value'],
            'color': Color(0xff12B281)
          },
          {
            'value': listDay[i]['listMoney'][1]['value'],
            'color': Color(0xffF89595)
          }
        ]
      };
      i++;
      while (i < listDay.length && listDay[i]['time'].weekday != 1) {
        data['listMoney'][0]['value'] += listDay[i]['listMoney'][0]['value'];
        data['listMoney'][1]['value'] += listDay[i]['listMoney'][1]['value'];
        i++;
      }
      data['title'] += '-' +
          listDay[i - 1]['time'].day.toString() +
          '/' +
          listDay[i - 1]['time'].month.toString();
      listWeek.add(data);
    }

    int id = -1;
    chartDataByWeek = listWeek.map((week) {
      id++;
      double sum =
          (week['listMoney'][0]['value'] - week['listMoney'][1]['value'])
              .toDouble();
      if (sum != 0 && sum > 0) sum = log(sum) / ln10;
      if (sum != 0 && sum < 0) sum = -log(-sum) / ln10;
      maxYbyWeek = max(maxYbyWeek, sum.round());
      minYbyWeek = min(minYbyWeek, sum.floor());
      List sumMoney = [
        {
          'value': sum,
          'color': sum >= 0 ? Color(0xff12B281) : Color(0xffF89595)
        }
      ];
      return SummaryData(id, week['title'], sumMoney);
    }).toList();
  }

  List listMonth = [];

  List<SummaryData> chartDataByMonth = [];

  int maxYbyMonth = 1;

  int minYbyMonth = 0;

  calculateChartDataByMonth() {
    listMonth = [];
    chartDataByMonth = [];
    maxYbyMonth = 0;
    minYbyMonth = 0;
    for (int i = 0; i < listDay.length; i++) {
      if (i == 0) {
        Map data = {
          'title': 'T' + listDay[i]['time'].month.toString(),
          'listMoney': [
            {
              'value': listDay[i]['listMoney'][0]['value'],
              'color': Color(0xff12B281)
            },
            {
              'value': listDay[i]['listMoney'][1]['value'],
              'color': Color(0xffF89595)
            }
          ]
        };
        listMonth.add(data);
      }
      // day thu i
      else {
        DateTime before = listDay[i - 1]['time'];
        DateTime current = listDay[i]['time'];

        // 2 transaction cung ngay thi cong vao truoc do
        if (IsEqual(before, current).inMonth()) {
          listMonth[listMonth.length - 1]['listMoney'][0]['value'] +=
              listDay[i]['listMoney'][0]['value'];
          listMonth[listMonth.length - 1]['listMoney'][1]['value'] +=
              listDay[i]['listMoney'][1]['value'];
        }
        //neu k thi tao moi
        else {
          Map data = {
            'title': 'T' + listDay[i]['time'].month.toString(),
            'listMoney': [
              {
                'value': listDay[i]['listMoney'][0]['value'],
                'color': Color(0xff12B281)
              },
              {
                'value': listDay[i]['listMoney'][1]['value'],
                'color': Color(0xffF89595)
              }
            ]
          };
          listMonth.add(data);
        }
      }
    }
    int id = -1;
    chartDataByMonth = listMonth.map((month) {
      maxYbyMonth = max(
          maxYbyMonth,
          max(month['listMoney'][0]['value'].round(),
              month['listMoney'][1]['value'].round()));
      id++;
      List logaritedMoney = month['listMoney'];
      logaritedMoney[0]['value'] = logaritedMoney[0]['value'] >= 1
          ? log(logaritedMoney[0]['value']) / ln10
          : 0;
      logaritedMoney[1]['value'] = logaritedMoney[1]['value'] >= 1
          ? log(logaritedMoney[1]['value']) / ln10
          : 0;
      return SummaryData(id, month['title'], logaritedMoney);
    }).toList();
    maxYbyMonth = maxYbyMonth == 0 ? 1 : (log(maxYbyMonth) / ln10).round();
    // print(maxYbyMonth);
    // chartDataByMonth.forEach((element) {
    //   print(element.time);
    // });
  }

  calculateChartDataNetMonth() {
    listMonth = [];
    chartDataByMonth = [];
    maxYbyMonth = 1;
    minYbyMonth = 1;
    for (int i = 0; i < listDay.length; i++) {
      if (i == 0) {
        Map data = {
          'title': 'T' + listDay[i]['time'].month.toString(),
          'listMoney': [
            {
              'value': listDay[i]['listMoney'][0]['value'],
              'color': Color(0xff12B281)
            },
            {
              'value': listDay[i]['listMoney'][1]['value'],
              'color': Color(0xffF89595)
            }
          ]
        };
        listMonth.add(data);
      }
      // day thu i
      else {
        DateTime before = listDay[i - 1]['time'];
        DateTime current = listDay[i]['time'];

        // 2 transaction cung ngay thi cong vao truoc do
        if (IsEqual(before, current).inMonth()) {
          listMonth[listMonth.length - 1]['listMoney'][0]['value'] +=
              listDay[i]['listMoney'][0]['value'];
          listMonth[listMonth.length - 1]['listMoney'][1]['value'] +=
              listDay[i]['listMoney'][1]['value'];
        }
        //neu k thi tao moi
        else {
          Map data = {
            'title': 'T' + listDay[i]['time'].month.toString(),
            'listMoney': [
              {
                'value': listDay[i]['listMoney'][0]['value'],
                'color': Color(0xff12B281)
              },
              {
                'value': listDay[i]['listMoney'][1]['value'],
                'color': Color(0xffF89595)
              }
            ]
          };
          listMonth.add(data);
        }
      }
    }
    int id = -1;
    chartDataByMonth = listMonth.map((month) {
      id++;
      double sum =
          (month['listMoney'][0]['value'] - month['listMoney'][1]['value'])
              .toDouble();
      if (sum != 0 && sum > 0) sum = log(sum) / ln10;
      if (sum != 0 && sum < 0) sum = -log(-sum) / ln10;
      maxYbyMonth = max(maxYbyMonth, sum.round());
      minYbyMonth = min(minYbyMonth, sum.floor());
      // print(sum);
      List sumMoney = [
        {
          'value': sum,
          'color': sum >= 0 ? Color(0xff12B281) : Color(0xffF89595)
        }
      ];
      return SummaryData(id, month['title'], sumMoney);
    }).toList();
    // maxYbyMonth = maxYbyMonth == 0 ? 1 : (log(maxYbyMonth) / ln10).round();
    // print(maxYbyMonth);
    // chartDataByMonth.forEach((element) {
    //   print(element.time);
    // });
    // maxYbyMonth;
    // minYbyMonth;
  }

  fillEmptyDay(DateTime newDate, DateTime current) {
    while (!IsEqual(newDate, current).inDay()) {
      listDay.add({
        'time': newDate,
        'title': newDate.day,
        'listMoney': [
          {'value': 0, 'color': Color(0xff12B281)},
          {'value': 0, 'color': Color(0xffF89595)}
        ]
      });
      newDate = newDate.add(Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (selectedChartType == 'Thu nhập ròng') {
      factor = 40;
      calculateChartDataByNetDate();
      calculateChartDataNetWeek();
      calculateChartDataNetMonth();
    } else {
      factor = 67;
      calculateChartDataByDate();
      calculateChartDataByWeek();
      calculateChartDataByMonth();
    }

    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 4,
          height: MediaQuery.of(context).size.height / 333.5 * 4,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 4,
              height: MediaQuery.of(context).size.height / 333.5 * 1,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 83.75,
              height: MediaQuery.of(context).size.height / 333.5 * 24,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 187.5 * 4,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffdedede), width: 1)),
              child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff1a1a1a),
                    fontSize: 12 * curScaleFactor,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  value: selectedChartType,
                  items: listChartType
                      .map((chartType) => DropdownMenuItem(
                            child: Text(chartType),
                            value: chartType,
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      if (value != null) selectedChartType = value;
                    });
                  },
                  hint: Text("Select item")),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 4,
          height: MediaQuery.of(context).size.height / 333.5 * 8,
        ),
        Container(
          height: 500,
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 179.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 14,
                  decoration: BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: Color(0xffededed), width: 0.75)),
                  child: TabBar(
                      onTap: (index) {
                        //your currently selected index
                      },
                      labelColor: Color(0xff12B281),
                      unselectedLabelColor: Color(0xff999999),
                      indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Color(0xffffffff),
                      ),
                      tabs: [
                        Container(
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 12,
                          child: Tab(
                            child: Text(
                              'Theo ngày',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Theo tuần',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Theo tháng',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  // height: (MediaQuery.of(context).size.height -
                  //         appBar.preferredSize.height) /
                  //     333.5 *
                  //     298,
                  child: TabBarView(
                    // controller: _tabController ,
                    children: [
                      Container(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                width:
                                    factor * chartDataByDay.length.toDouble() +
                                        100,
                                child: BarChartSummary(
                                    chartDataByDay, maxYbyDay, minYbyDay))),
                      ),
                      Container(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                width:
                                    factor * chartDataByWeek.length.toDouble() +
                                        100,
                                child: BarChartSummary(
                                    chartDataByWeek, maxYbyWeek, minYbyWeek))),
                      ),
                      Container(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                width: factor *
                                        chartDataByMonth.length.toDouble() +
                                    100,
                                child: BarChartSummary(chartDataByMonth,
                                    maxYbyMonth, minYbyMonth))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff12B281)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 4,
                  height: MediaQuery.of(context).size.height / 333.5 * 1,
                ),
                Text(
                  'Thu',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff000000),
                    fontSize: 12 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffF89595)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 4,
                  height: MediaQuery.of(context).size.height / 333.5 * 1,
                ),
                Text(
                  'Chi',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff000000),
                    fontSize: 12 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class IsEqual {
  DateTime a;
  DateTime b;
  bool inDay() {
    DateFormat df = DateFormat('yyyyMMdd');
    return df.format(a) == df.format(b);
  }

  bool inMonth() {
    DateFormat df = DateFormat('yyyyMM');
    return df.format(a) == df.format(b);
  }

  bool inYear() {
    DateFormat df = DateFormat('yyyy');
    return df.format(a) == df.format(b);
  }

  IsEqual(this.a, this.b);
}
