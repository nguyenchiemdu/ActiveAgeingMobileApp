import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/bar_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_management_widget.dart';
import 'detail_report_screen.dart';
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

  getListPercentage(List listTransaction, double sum) {
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
    return listResult;
  }

  DateFormat df = DateFormat('dd/MM/yyy');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double startMoney = listHistory[0]['money'];
    double endMoney = listHistory[listHistory.length - 1]['money'];
    // calculateChartDataByDate();
    // calculateChartDataByWeek();
    // calculateChartDataByMonth();
    List listPercentageIncome = getListPercentage(listIncome, incomeValue);
    List listPercentageOutcome = getListPercentage(listOutcome, outcomeValue);
    double startMoney = endMoney + outcomeValue - incomeValue;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: width / 2,
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      value: selectedName,
                      items: listWallet
                          .map((wallet) => DropdownMenuItem(
                                child: Text(wallet['name']),
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
                InkWell(
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
                            children: [
                              Text(timePicker['duration']),
                              Text(DateFormat('dd/MMM/yyy')
                                      .format(timePicker['startTime']) +
                                  '-' +
                                  DateFormat('dd/MMM/yyy')
                                      .format(timePicker['endTime']))
                            ],
                          )
                        : Text('Chọn khoảng thời gian'),
                  )),
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Số dư đầu'),
                          Text(formatter.format(startMoney) +
                              ' ' +
                              selectedWallet['currency'])
                        ],
                      ),
                      Column(
                        children: [
                          Text('Số dư cuối'),
                          Text(formatter.format(endMoney) +
                              ' ' +
                              selectedWallet['currency'])
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('Thu nhập ròng'),
                      Text(formatter.format(endMoney - startMoney) +
                          ' ' +
                          selectedWallet['currency'])
                    ],
                  ),
                  ChartManagementWidget(listTransaction, timePicker),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2,
                        // height: 500,
                        child: Column(
                          children: [
                            Text('Khoản thu'),
                            Text(formatter.format(incomeValue)),
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
                                style: TextStyle(color: Color(0xff12B281)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 2,
                        // height: 500,
                        child: Column(
                          children: [
                            Text('Khoản chi'),
                            Text(formatter.format(outcomeValue)),
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
                                style: TextStyle(color: Color(0xff12B281)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2,
                        // height: 500,
                        child: Column(
                          children: [
                            Text('Cho vay (phải thu)'),
                            Text(formatter.format(sumOutcomeLoan)),
                            // Container(
                            //   child: Text(formatter.format(sumIncomeLoan))
                            // ),
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
                                style: TextStyle(color: Color(0xff12B281)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 2,
                        // height: 500,
                        child: Column(
                          children: [
                            Text('Nợ (phải trả)'),
                            Text(formatter.format(sumIncomeLoan)),
                            // Container(
                            //   child: Column(
                            //       children: listPercentageOutcome
                            //           .map<Widget>((element) {
                            //             return Text(element['nameCategory'] +
                            //                 ' ' +
                            //                 formatter
                            //                     .format(element['percentage']) +
                            //                 '%');
                            //           })
                            //           .toList()
                            //           .sublist(
                            //               0,
                            //               min(4,
                            //                   listPercentageOutcome.length))),
                            // ),
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
                                style: TextStyle(color: Color(0xff12B281)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
