import 'dart:math';

import 'package:active_ageing_mobile_app/bar_chart/model/data.dart';
import 'package:active_ageing_mobile_app/bar_chart/widget/bar_titles.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/bar_chart_titles.dart';
import 'package:fl_chart/fl_chart.dart';

import '/../../../bar_chart/widget/bar_chart_widget.dart';
import 'package:flutter/material.dart';

class BarChartSummary extends StatelessWidget {
  BarChartSummary(this.chartData, this.maxY, this.minY) {}
  List<SummaryData> chartData;
  final double barWidth = 25;
  int interval = 1;
  int maxY;
  int minY;
  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(
                  border: Border(
                      bottom: BorderSide(color: Color(0xffDEDEDE), width: 3))),
              alignment: BarChartAlignment.center,
              maxY: maxY.toDouble(),
              minY: minY.toDouble(),
              groupsSpace: 15,
              barTouchData: BarTouchData(
                  enabled: false,
                  allowTouchBarBackDraw: true,
                  touchCallback: (barTouchResponse) {
                    // print(barTouchResponse.touchInput);
                    if (barTouchResponse.touchInput is FlPanStart &&
                        barTouchResponse.spot != null)
                      print(chartData
                          .firstWhere((element) =>
                              element.id ==
                              barTouchResponse.spot.touchedBarGroupIndex)
                          .time);

                    // print(barTouchResponse.spot!.touchedBarGroupIndex);
                  }),
              titlesData: FlTitlesData(
                // topTitles: BarTitles.getTopBottomTitles(),
                bottomTitles: BarChartTitles.getTopBottomTitles(chartData),
                // leftTitles: BarTitles.getSideTitles(),
                leftTitles: BarChartTitles.getSideTitles(interval),

                // rightTitles: BarTitles.getSideTitles(),
              ),
              gridData: FlGridData(
                checkToShowHorizontalLine: (value) {
                  return value % interval == 0;
                },
                getDrawingHorizontalLine: (value) {
                  if (value == 0) {
                    return FlLine(
                      color: const Color(0xffEDEDED),
                      strokeWidth: 3,
                    );
                  } else {
                    return FlLine(
                      color: const Color(0xffDEDEDE),
                      strokeWidth: 0.8,
                    );
                  }
                },
              ),
              barGroups: chartData
                  .map(
                    (data) => BarChartGroupData(
                        barsSpace: 2,
                        x: data.id,
                        barRods: data.listMoney
                            .map((money) => BarChartRodData(
                                  y: money['value'].toDouble(),
                                  width: barWidth,
                                  colors: [money['color']],
                                  borderRadius: money['value'] > 0
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        )
                                      : BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                ))
                            .toList()),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}

class SummaryData {
  final String time;
  final List listMoney;
  final int id;
  SummaryData(
    this.id,
    this.time,
    this.listMoney,
  );
}
