import 'package:active_ageing_mobile_app/bar_chart/model/data.dart';

import '../data/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTitles {
  static SideTitles getTopBottomTitles(List<Data> chartData) => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Color(0xff12B281), fontSize: 10),
        margin: 10,
        getTitles: (double id) =>
            chartData.firstWhere((element) => element.id == id.toInt()).name,
      );

  static SideTitles getSideTitles(int interval, int MaxY) => SideTitles(
        showTitles: false,
        getTextStyles: (value) =>
            const TextStyle(color: Color(0xff12B281), fontSize: 10),
        rotateAngle: 0,
        interval: interval.toDouble(),
        // margin: 10,
        reservedSize: 30,
        // getTitles: (double value) => '',

        getTitles: (double value) => value == MaxY ? '${value.toInt()}' : '',
      );
}
