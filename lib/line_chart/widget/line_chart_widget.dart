import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import '../widget/line_titles.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget(
      this.listMonths, this.listGrowth, this.interval, Color color) {
    gradientColors.add(color);
    linedata = [];
    for (int i = 0; i < listGrowth.length; i++) {
      if (i == 0 && listGrowth[i] == false) {
      } else {
        // print(i);
        // print(listGrowth[i]);
        linedata.add(FlSpot(i.toDouble(), listGrowth[i].toDouble()));
      }
    }
  }
  late List<FlSpot?> linedata;
  List<DateTime> listMonths;
  List listGrowth;
  int interval;
  List<Color> gradientColors = [];
  getMax(List ls) {
    double max = ls[ls.length - 1].toDouble();
    ls.forEach((value) {
      if (value != false && max <= value.toDouble()) max = value.toDouble();
    });
    // double maxRouned = pow(10, (log(max) / ln10).round()).toDouble();
    return max;
  }

  getMin(List ls) {
    double min = ls[ls.length - 1].toDouble();
    ls.forEach((value) {
      if (value != false && min >= value.toDouble()) min = value.toDouble();
    });
    if (min > 0) min = 0;
    return min;
  }

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: listMonths.length.toDouble() - 1,
          minY: getMin(listGrowth),
          maxY: getMax(listGrowth),
          titlesData: LineTitles.getTitleData(listMonths, interval),
          gridData: FlGridData(
            horizontalInterval: interval.toDouble(),
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xffEDEDED),
                strokeWidth: 2,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: linedata,

              // [
              //   FlSpot(0, 3),
              //   FlSpot(1, 2),
              //   FlSpot(4.9, 5),
              //   FlSpot(6.8, 2.5),
              //   FlSpot(8, 4),
              //   FlSpot(9.5, 3),
              //   FlSpot(11, 4),
              // ],
              // isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.2))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
