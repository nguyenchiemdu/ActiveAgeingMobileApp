import 'package:fl_chart/fl_chart.dart';
import '../data/pie_data.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> getSections(
        int? touchedIndex, double heightChart, List<Data> chartData) =>
    chartData
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          final isTouched = index == touchedIndex;
          final double fontSize = isTouched ? 25 : 16;
          final double radius =
              isTouched ? 5 / 14 * heightChart : 4 / 14 * heightChart;

          final value = PieChartSectionData(
            color: data.color,
            value: data.percent,
            title: '${data.percent}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );

          return MapEntry(index, value);
        })
        .values
        .toList();
