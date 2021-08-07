import 'package:active_ageing_mobile_app/pie_chart/data/pie_data.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../pie_chart/widget/indicators_widget.dart';
import '../../../pie_chart/widget/pie_chart_sections.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  PieChartPage(this.chartData, this.heightChart);
  final List<Data> chartData;
  final double heightChart;
  @override
  State<StatefulWidget> createState() =>
      PieChartPageState(heightChart, chartData);
}

class PieChartPageState extends State {
  PieChartPageState(this.heightChart, this.chartData);
  List<Data> chartData;
  double heightChart;
  int? touchedIndex;
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            height: heightChart,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: heightChart / 7,
                  sections: getSections(touchedIndex, heightChart, chartData),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: IndicatorsWidget(chartData),
              ),
            ],
          ),
        ],
      );
}
