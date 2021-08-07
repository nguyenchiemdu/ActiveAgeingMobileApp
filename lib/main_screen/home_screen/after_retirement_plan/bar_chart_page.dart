import 'package:active_ageing_mobile_app/bar_chart/model/data.dart';

import '/../../../bar_chart/widget/bar_chart_widget.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatelessWidget {
  BarChartPage(this.chartData, this.interval, this.maxY);
  List<Data> chartData;
  int interval;
  int maxY;
  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BarChartWidget(chartData, interval, maxY),
        ),
      );
}
