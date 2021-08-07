import 'package:active_ageing_mobile_app/bar_chart/model/data.dart';

import '../data/bar_data.dart';
import '../widget/bar_titles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget(this.chartData, this.interval, this.maxY);
  List<Data> chartData;
  final double barWidth = 4;
  int interval;
  int maxY;
  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          borderData: FlBorderData(
              border: Border(
                  bottom: BorderSide(color: Color(0xffDEDEDE), width: 3))),
          alignment: BarChartAlignment.center,
          maxY: maxY.toDouble(),
          minY: 0,
          groupsSpace: 6.6,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            // topTitles: BarTitles.getTopBottomTitles(),
            bottomTitles: BarTitles.getTopBottomTitles(chartData),
            // leftTitles: BarTitles.getSideTitles(),
            leftTitles: BarTitles.getSideTitles(interval, maxY),

            // rightTitles: BarTitles.getSideTitles(),
          ),
          gridData: FlGridData(
            checkToShowHorizontalLine: (value) => value % interval == 0,
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
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      y: data.y,
                      width: barWidth,
                      colors: [Color(0xff12B281)],
                      borderRadius: data.y > 0
                          ? BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            )
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
}
