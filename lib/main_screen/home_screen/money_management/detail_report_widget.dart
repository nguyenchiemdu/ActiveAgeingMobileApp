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
  }

  List<Data> chartData = [];
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    calculateChartData();
    // double heightChart = 280;
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
                  Text(method == '+' ? 'Khoản thu' : 'Khoản chi',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12 * curScaleFactor,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff666666),
                      fontStyle: FontStyle.normal,
                    ),),
                  Text(formater.format(sumValue),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20 * curScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: method == '+'
                            ? Color(0xff18CE8C)
                            : Color(0xffFF2D2D),                        fontStyle: FontStyle.normal,
                      ),),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 14,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  ListView.builder(
                      // scrollDirection: ,
                      shrinkWrap: true,
                      itemCount: listPercentage.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                              color: Color(0xffededed),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 333.5 * 16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 187.5 * 63.75,
                                    child: Text(listPercentage[index]['nameCategory'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12 * curScaleFactor,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff666666),
                                        fontStyle: FontStyle.normal,
                                      ),),
                                  ),
                                  Text(formater.format(listvalue[index]['money']),
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12 * curScaleFactor,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff666666),
                                      fontStyle: FontStyle.normal,
                                    ),),
                                  Text(formater.format(
                                          listPercentage[index]['percentage']) +
                                      '%',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12 * curScaleFactor,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff666666),
                                      fontStyle: FontStyle.normal,
                                    ),)
                                ],
                              ),
                            ),
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
