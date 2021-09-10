import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData(List<DateTime> listMonths, int interval) => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xffC7C7C7),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          getTitles: (value) {
            String title = '';
            DateTime month = listMonths[value.toInt()];
            title = title + 'T' + month.month.toString();
            return title;
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xffC7C7C7),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          getTitles: (value) {
            if (value % interval == 0) return (value).toInt().toString() + ' %';
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
