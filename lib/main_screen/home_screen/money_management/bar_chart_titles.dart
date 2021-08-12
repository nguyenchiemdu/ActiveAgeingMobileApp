import 'dart:math';

import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/bar_chart_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

NumberFormat format = NumberFormat('###,###,###,###,##0.##');

class BarChartTitles {
  static SideTitles getTopBottomTitles(List<SummaryData> chartData) =>
      SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Color(0xffC7C7C7), fontSize: 12),
        margin: 10,
        getTitles: (double id) {
          return chartData
              .firstWhere((element) => element.id == id.toInt())
              .time;
        },
      );
  static SideTitles getSideTitles(int interval) => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Color(0xff1C7C7C7), fontSize: 12),
        rotateAngle: 0,
        interval: interval.toDouble(),
        margin: 10,
        reservedSize: 50,
        // getTitles: (double value) => '',

        getTitles: (double value) {
          if (format.format(pow(10, value.round()).toInt()) == '1') return '0';
          if (value > 0) return format.format(pow(10, value.round()).toInt());
          return '-' + format.format(pow(10, -value.round()).toInt());
        },
      );
}
