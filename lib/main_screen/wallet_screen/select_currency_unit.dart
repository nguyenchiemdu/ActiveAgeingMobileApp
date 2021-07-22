import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currency_unit.dart';

class SelectCurrencyUnit extends StatefulWidget {
  SelectCurrencyUnit({Key? key}) : super(key: key);

  @override
  _SelectCurrencyUnitState createState() => _SelectCurrencyUnitState();
}

class _SelectCurrencyUnitState extends State<SelectCurrencyUnit> {
  List<String> list = ['USD', 'VND', 'RUP'];
  List<bool> listSelectStatus = [false, false, false];
  late List<Widget> listCurrency =
      list.map((value) => CurrencyUnit(value, false, updateStatus)).toList();

  void updateStatus(String currency) {
    int index = list.indexOf(currency);
    List<bool> tmp = listSelectStatus;
    tmp = tmp.map((element) {
      return false;
    }).toList();
    tmp[index] = true;
    List<Widget> tmpWidget = [];
    for (int i = 0; i < list.length; i++) {
      tmpWidget.add(CurrencyUnit(list[i], tmp[i], updateStatus));
    }
    setState(() {
      listSelectStatus = tmp;
      listCurrency = tmpWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    Function update = Provider.of<Function>(context);
    return Provider<Function>(
      create: (context) => updateStatus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back')),
                    Text('Đơn vị tiền tệ'),
                    ElevatedButton(
                        onPressed: () {
                          int index = listSelectStatus.indexOf(true);
                          update(list[index]);
                          Navigator.pop(context);
                        },
                        child: Text('Save')),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        child: TextField()),
                    ElevatedButton(onPressed: () {}, child: Text('Search'))
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: ListView(
                  children: listCurrency,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
