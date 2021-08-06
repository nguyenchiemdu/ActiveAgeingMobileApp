import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'time_picker_screen.dart';

class ReportWidget extends StatelessWidget {
  ReportWidget(this.selectedName, this.timePicker, this.listWallet,
      this.selectedWallet, this.listHistory, this.fetchData, this.setState,
      {Key? key})
      : super(key: key);
  String selectedName = 'VND';
  // List<Widget> listTransactionWidgets = [];
  Map selectedWallet = {};
  var timePicker;
  List listWallet = [];
  List listHistory;
  final Function setState;
  final Function fetchData;
  final NumberFormat formatter = NumberFormat('###,###,##0.#');
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(listHistory);
    double startMoney = listHistory[0]['money'];
    double endMoney = listHistory[listHistory.length - 1]['money'];
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
                    print(result);
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
                    children: [Text('Thu nhập ròng'), Text('1,123,332.00 đ')],
                  ),
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2,
                        height: 100,
                        child: Column(
                          children: [
                            Text('Khoản thu'),
                            Text('4,000,000'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 2,
                        height: 100,
                        child: Column(
                          children: [
                            Text('Khoản chi'),
                            Text('1,000,000'),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
