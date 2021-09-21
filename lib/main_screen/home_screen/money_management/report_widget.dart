import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/bar_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_management_widget.dart';
import 'detail_report_screen.dart';
import 'growth_report_widget.dart';
import 'time_picker_screen.dart';

class ReportWidget extends StatelessWidget {
  ReportWidget(
    this.selectedName,
    this.timePicker,
    this.listWallet,
    this.selectedWallet,
    this.listHistory,
    this.listTransaction,
    this.fetchData,
    this.setState,
  ) {
    calculateIncome();
    calculateOutcome();
    calculateLoan();
    calculateGrowthReport();
    // calculateChartData();
  }
  String selectedName = 'VND';
  // List<Widget> listTransactionWidgets = [];
  Map selectedWallet = {};
  var timePicker;
  List listWallet = [];
  List listHistory;
  List listTransaction;
  final Function setState;
  final Function fetchData;
  final NumberFormat formatter = NumberFormat('###,###,##0.#');
  List listIncome = [];
  List listOutcome = [];
  List listLoanIncome = [];
  List listLoanOutcome = [];
  double incomeValue = 0;
  double outcomeValue = 0;
  List<DateTime> listMonths = [];
  List listGrowthIncome = [];
  List listGrowthOutcome = [];
  List listGrowthNet = [];
  calculateIncome() {
    listTransaction.forEach((transaction) {
      if (transaction['method'] == '+') {
        listIncome.add(transaction);
        incomeValue += transaction['money'];
      }
    });
  }

  calculateOutcome() {
    listTransaction.forEach((transaction) {
      if (transaction['method'] == '-') {
        listOutcome.add(transaction);
        outcomeValue += transaction['money'];
      }
    });
  }

  getSetCategory(List listTransaction) {
    Set categories = {};
    listTransaction.forEach((transaction) {
      categories.add(transaction['category']);
    });
    return categories.toList();
  }

  double sumIncomeLoan = 0;
  double sumOutcomeLoan = 0;
  calculateLoan() {
    listIncome.forEach((transaction) {
      if (transaction['name'] == 'Đi vay') listLoanIncome.add(transaction);
    });
    listOutcome.forEach((transaction) {
      if (transaction['name'] == 'Cho vay') listLoanOutcome.add(transaction);
    });

    sumIncomeLoan = 0;
    listLoanIncome.forEach((element) {
      sumIncomeLoan += element['money'];
    });
    sumOutcomeLoan = 0;
    listLoanOutcome.forEach((element) {
      sumOutcomeLoan += element['money'];
    });
  }

  getListPercentage(List listTransaction, double sum, String method) {
    List listCategories = getSetCategory(listTransaction);
    Map mapPercentage = {};
    listTransaction.forEach((transaction) {
      if (!mapPercentage.containsKey(transaction['category']))
        mapPercentage[transaction['category']] = 0;
      mapPercentage[transaction['category']] += transaction['money'];
    });
    List listResult = listCategories.map((category) {
      double percent = mapPercentage[category] / sum * 100;

      return {'nameCategory': category, 'percentage': percent};
    }).toList();
    print('listResult');
    print(listResult);
    List listTemp = [];
    if (method == '+') {
      listTemp.add({'nameCategory': 'Thu nợ', 'percentage': 0});
      listTemp.add({'nameCategory': 'Lương', 'percentage': 0});
      listTemp.add({'nameCategory': 'Chứng khoán ', 'percentage': 0});
      listTemp.add({'nameCategory': 'Coin', 'percentage': 0});
      listTemp.add({'nameCategory': 'Khác', 'percentage': 0});
    } else {
      listTemp.add({'nameCategory': 'Thuê nhà', 'percentage': 0});
      listTemp.add({'nameCategory': 'Ăn uống', 'percentage': 0});
      listTemp.add({'nameCategory': 'Chứng khoán ', 'percentage': 0});
      listTemp.add({'nameCategory': 'Mua sắm', 'percentage': 0});
      listTemp.add({'nameCategory': 'Khác', 'percentage': 0});
    }
    // if (listResult.length == 0) return listTemp;
    return listResult;
  }

  calculateGrowthReport() {
    DateTime start = timePicker['startTime'];
    DateTime end = timePicker['endTime'];
    while (start.month != end.month || start.year != end.year) {
      listMonths.add(start);
      int currenMonth = start.month;
      while (currenMonth == start.month) {
        start = start.add(Duration(days: 1));
      }
    }
    listMonths.add(end);

    for (int i = 0; i < listMonths.length; i++) {
      listGrowthIncome.add(0);
      listIncome.forEach((income) {
        if (IsEqual(listMonths[i], income['time'].toDate()).inMonth()) {
          listGrowthIncome[i] += income['money'];
        }
      });
      listGrowthOutcome.add(0);
      listOutcome.forEach((outcome) {
        if (IsEqual(listMonths[i], outcome['time'].toDate()).inMonth()) {
          listGrowthOutcome[i] += outcome['money'];
        }
      });
    }
    for (int i = 0; i < listGrowthIncome.length; i++) {
      listGrowthNet.add(listGrowthIncome[i] - listGrowthOutcome[i]);
    }
  }

  DateFormat df = DateFormat('dd/MM/yyy');

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    double width = MediaQuery.of(context).size.width;
    // double startMoney = listHistory[0]['money'];
    print(listHistory);
    double endMoney = listHistory.length == 0
        ? 0
        : listHistory[listHistory.length - 1]['money'];
    // calculateChartDataByDate();
    // calculateChartDataByWeek();
    // calculateChartDataByMonth();
    List listPercentageIncome = getListPercentage(listIncome, incomeValue, '+');
    List listPercentageOutcome =
        getListPercentage(listOutcome, outcomeValue, '-');
    double startMoney = endMoney + outcomeValue - incomeValue;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 4,
              height: MediaQuery.of(context).size.height / 333.5 * 6,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 8,
                  height: MediaQuery.of(context).size.height / 333.5 * 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 83.75,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffdedede), width: 1)),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 4,
                        height: MediaQuery.of(context).size.height / 333.5 * 2,
                      ),
                      Icon(
                        Icons.payments_rounded,
                        color: Color(0xff12b281),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 4,
                        height: MediaQuery.of(context).size.height / 333.5 * 2,
                      ),
                      Flexible(
                        child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            value: selectedName,
                            items: listWallet
                                .map((wallet) => DropdownMenuItem(
                                      child: Text(
                                        wallet['name'],
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff4d4d4d),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      value: wallet['name'].toString(),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              Map newWallet = {};
                              listWallet.forEach((wallet) {
                                if (wallet['name'] == value) newWallet = wallet;
                              });
                              setState({
                                'selectedName': value.toString(),
                                'selectedWallet': newWallet
                              });
                              fetchData();
                            },
                            hint: Text("Select item")),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 4,
                  height: MediaQuery.of(context).size.height / 333.5 * 4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 83.75,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffdedede), width: 1)),
                  child: InkWell(
                    onTap: () async {
                      Map result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimePickerScreen()));
                      if (result != null) {
                        setState({'timePicker': result});
                      }
                      fetchData();
                    },
                    child: Ink(
                        // width: 100,
                        // height: 100,
                        // color: Colors.blue,
                        child: Container(
                      child: timePicker != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  timePicker['duration'] + " gần nhất",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff1a1a1a),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Text(
                                  DateFormat('yMd')
                                          .format(timePicker['startTime']) +
                                      '-' +
                                      DateFormat('yMd')
                                          .format(timePicker['endTime']),
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff999999),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )
                              ],
                            )
                          : Text('Chọn khoảng thời gian'),
                    )),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 333.5 * 6,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 333.5 * 0.75,
                color: Color(0xffdedede)),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 333.5 * 4,
                color: Color(0xffededed)),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 333.5 * 0.75,
                color: Color(0xffdedede)),
            Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 333.5 * 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 93.75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Số dư đầu',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff999999),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                formatter.format(startMoney) +
                                    ' ' +
                                    selectedWallet['currency'],
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 93.75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Số dư cuối',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff999999),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                formatter.format(endMoney) +
                                    ' ' +
                                    selectedWallet['currency'],
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                      color: Color(0xffdedede)),
                  Container(
                    height: MediaQuery.of(context).size.height / 333.5 * 28,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu nhập ròng',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff999999),
                            fontSize: 12 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          formatter.format(endMoney - startMoney) +
                              ' ' +
                              selectedWallet['currency'],
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 16 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                      color: Color(0xffdedede)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 4,
                      color: Color(0xffededed)),
                  ChartManagementWidget(listTransaction, timePicker),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.75,
                      color: Color(0xffdedede)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 27,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 187.5 * 8,
                          top: MediaQuery.of(context).size.height / 333.5 * 12),
                      color: Color(0xffededed),
                      child: Text(
                        "Chi tiết khoản thu chi",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.75,
                      color: Color(0xffdedede)),
                  Row(
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 93.25,
                        height:
                            MediaQuery.of(context).size.height / 333.5 * 110.5,
                        // height: 500,
                        child: Column(
                          children: [
                            Text(
                              'Khoản thu',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              formatter.format(incomeValue),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff18CE8C),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Container(
                              child: Column(
                                  children: listPercentageIncome
                                      .map<Widget>((element) {
                                        return Text(element['nameCategory'] +
                                            ' ' +
                                            formatter
                                                .format(element['percentage']) +
                                            '%');
                                      })
                                      .toList()
                                      .sublist(0,
                                          min(4, listPercentageIncome.length))),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailReportScreen(
                                                listPercentageIncome,
                                                listIncome,
                                                listPercentageOutcome,
                                                listOutcome,
                                                incomeValue,
                                                outcomeValue,
                                                listLoanIncome,
                                                listLoanOutcome,
                                                0)));
                              },
                              child: Text(
                                'Xem chi tiết',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff00865D),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 0.5,
                          height: MediaQuery.of(context).size.height /
                              333.5 *
                              110.5,
                          color: Color(0xffdedede)),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 93.25,
                        height: MediaQuery.of(context).size.height /
                            333.5 *
                            110.5, // height: 500,
                        child: Column(
                          children: [
                            Text(
                              'Khoản chi',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              formatter.format(outcomeValue),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xffFF2d2d),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Container(
                              child: Column(
                                  children: listPercentageOutcome
                                      .map<Widget>((element) {
                                        return Text(element['nameCategory'] +
                                            ' ' +
                                            formatter
                                                .format(element['percentage']) +
                                            '%');
                                      })
                                      .toList()
                                      .sublist(
                                          0,
                                          min(4,
                                              listPercentageOutcome.length))),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailReportScreen(
                                                listPercentageIncome,
                                                listIncome,
                                                listPercentageOutcome,
                                                listOutcome,
                                                incomeValue,
                                                outcomeValue,
                                                listLoanIncome,
                                                listLoanOutcome,
                                                1)));
                              },
                              child: Text(
                                'Xem chi tiết',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff00865D),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                      color: Color(0xffdedede)),
                  Row(
                    children: [
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 93.25,
                        height: MediaQuery.of(context).size.height /
                            333.5 *
                            55.5, // height: 500,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  0.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                            Text(
                              'Cho vay (phải thu)',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  0.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            Text(
                              formatter.format(sumOutcomeLoan),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff18CE8C),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            // Container(
                            //   child: Text(formatter.format(sumIncomeLoan))
                            // ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  0.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailReportScreen(
                                                listPercentageIncome,
                                                listIncome,
                                                listPercentageOutcome,
                                                listOutcome,
                                                incomeValue,
                                                outcomeValue,
                                                listLoanIncome,
                                                listLoanOutcome,
                                                0)));
                              },
                              child: Text(
                                'Xem chi tiết',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff00865D),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 0.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 55.5,
                          color: Color(0xffdedede)),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 93.25,
                        height: MediaQuery.of(context).size.height /
                            333.5 *
                            55.5, // height: 500,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  0.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  0.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            Text(
                              'Nợ (phải trả)',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              formatter.format(sumIncomeLoan),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xffFF2d2d),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  0.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailReportScreen(
                                                listPercentageIncome,
                                                listIncome,
                                                listPercentageOutcome,
                                                listOutcome,
                                                incomeValue,
                                                outcomeValue,
                                                listLoanIncome,
                                                listLoanOutcome,
                                                1)));
                              },
                              child: Text(
                                'Xem chi tiết',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff00865D),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                      color: Color(0xffdedede)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 27,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 187.5 * 8,
                          top: MediaQuery.of(context).size.height / 333.5 * 12),
                      color: Color(0xffededed),
                      child: Text(
                        "Báo cáo mức tăng trưởng",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                  GrowthReportWidget(listMonths, listGrowthIncome,
                      'Tổng thu nhập', Color(0xff12B281)),
                  GrowthReportWidget(listMonths, listGrowthOutcome,
                      'Tổng chi tiêu', Color(0xffEC5B5B)),
                  GrowthReportWidget(listMonths, listGrowthNet, 'Thu nhập ròng',
                      Color(0xff1A1A1A))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IsEqual {
  DateTime a;
  DateTime b;
  bool inDay() {
    DateFormat df = DateFormat('yyyyMMdd');
    return df.format(a) == df.format(b);
  }

  bool inMonth() {
    DateFormat df = DateFormat('yyyyMM');
    return df.format(a) == df.format(b);
  }

  bool inYear() {
    DateFormat df = DateFormat('yyyy');
    return df.format(a) == df.format(b);
  }

  IsEqual(this.a, this.b);
}
