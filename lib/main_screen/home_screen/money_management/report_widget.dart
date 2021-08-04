import 'package:flutter/material.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  String selectedCurrency = 'VND';
  List<String> listCurrency = ['VND', 'USD', 'RUB'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                      value: selectedCurrency,
                      items: listCurrency
                          .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedCurrency = value.toString();
                        });
                      },
                      hint: Text("Select item")),
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    // width: 100,
                    // height: 100,
                    // color: Colors.blue,
                    child: Container(
                      child: Column(
                        children: [
                          Text('Tháng này'),
                          Text('01/07/2021 - 31/07/2021')
                        ],
                      ),
                    ),
                  ),
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
                        children: [Text('Số dư đầu'), Text('0.00 đ')],
                      ),
                      Column(
                        children: [Text('Số dư cuối'), Text('1,123,332.00 đ')],
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
