import 'dart:math';

import 'package:active_ageing_mobile_app/pie_chart/data/pie_data.dart';
import 'pie_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailReportWidget extends StatelessWidget {
  DetailReportWidget(
      this.listPercentage, this.listvalue, this.sumValue, this.method,
      {Key? key})
      : super(key: key);
  final List listPercentage;
  final List listvalue;
  final double sumValue;
  final String method;
  NumberFormat formater = NumberFormat('###,###,##0.##');
  calculateChartData() {
    final _random = Random();
    Color _randomColor = Color.fromARGB(_random.nextInt(256),
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
    chartData = listPercentage.map((item) {
      _randomColor = Color.fromARGB(
          _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
      Data data = Data(
        name: item['nameCategory'],
        percent: double.parse(formater.format(item['percentage'])),
        color: _randomColor,
      );
      return data;
    }).toList();
    chartData.forEach((element) {
      print(element.name);
    });
  }

  List<Data> chartData = [];
  @override
  Widget build(BuildContext context) {
    // print(listPercentage);
    calculateChartData();
    print(listvalue);
    double heightChart = 280;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xffE5E5E5),
        child: Column(
          children: [
            PieChartPage(chartData, MediaQuery.of(context).size.width),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(method == '+' ? 'Khoản thu' : 'Khoản chi'),
                  Text(formater.format(sumValue),
                      style: TextStyle(
                          color: method == '+'
                              ? Color(0xff18CE8C)
                              : Color(0xffFF2D2D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: listPercentage.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide()),
                                  shape: BoxShape.circle,
                                  color: chartData[index].color),
                            ),
                            Text(listPercentage[index]['nameCategory']),
                            Text(formater.format(listvalue[index]['money'])),
                            Text(formater.format(
                                    listPercentage[index]['percentage']) +
                                '%')
                          ],
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
