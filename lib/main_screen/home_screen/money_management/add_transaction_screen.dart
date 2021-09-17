import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/list_categories.dart';
import 'package:active_ageing_mobile_app/main_screen/wallet_screen/wallet.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'add_person.dart';

class AddTransactionScreen extends StatefulWidget {
  AddTransactionScreen(this.listWallet, this.listHistoryWallets, this.fetchData,
      {Key? key})
      : super(key: key);
  final Function fetchData;
  final List listWallet;
  final List listHistoryWallets;
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String categoryNof = '';
  addToHistory() {
    print(widget.listHistoryWallets);
    int key = int.parse(DateFormat('yyyyMMdd').format(time));
    List listHistoryWallets = widget.listHistoryWallets;
    int index = listHistoryWallets.indexWhere(
        (historyWallet) => historyWallet['name'] == selectedNameWallet);
    if (listHistoryWallets[index]['listHistory'] == null) {
      listHistoryWallets[index]['listHistory'] = [];
    }
    List listHistory = listHistoryWallets[index]['listHistory'];
    // print(listHistory);
    if (listHistory.indexWhere((history) => history['time'] == key) < 0) {
      int index = listHistory.length - 1;
      while (index >= 0 && listHistory[index]['time'] >= key) {
        index--;
      }
      // int index = listHistory.indexWhere((history) => history['time'] > key);
      double startMoney;
      if (index < 0)
        startMoney = 0;
      else
        startMoney = listHistory[index]['money'];
      if (index == -1) {
        listHistory.add({'time': key, 'money': startMoney});
      } else {
        int date = minus1Day(listHistory[index]['time']);
        while (!containDateInList(date, listHistory) && date >= key) {
          Map newHistory = {};
          newHistory['time'] = date;
          newHistory['money'] = startMoney;
          listHistory.insert(index, newHistory);
          date = minus1Day(date);
        }
      }
    }

    listHistory = listHistory.map((history) {
      if (history['time'] >= key) {
        if (method == '-')
          history['money'] -= double.parse(money.text);
        else
          history['money'] += double.parse(money.text);
        return history;
      }
      return history;
    }).toList();
    listHistory.sort((a, b) => a['time'] - b['time']);
    print(listHistory);
    UserDatabase().updateHistoryWallets(
        selectedWallet['id'], {'listHistory': listHistory});
  }

  int minus1Day(int time) {
    int year = int.parse(time.toString().substring(0, 4));
    int month = int.parse(time.toString().substring(4, 6));
    int day = int.parse(time.toString().substring(6));
    DateTime date = DateTime(year, month, day);
    date = date.subtract(Duration(days: 1));
    return int.parse(DateFormat('yyyyMMdd').format(date));
  }

  bool containDateInList(int date, List listHistory) {
    int index = listHistory.indexWhere((history) => history['time'] == date);
    if (index >= 0) return true;
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listWallet = widget.listWallet;
    List<String> listString =
        listWallet.map<String>((wallet) => wallet['name']).toList();
    selectedNameWallet = listString[0];
    selectedWallet = listWallet[0];
  }

  final _formKey = GlobalKey<FormState>();
  DateTime time = DateTime.now();
  var remindTime = DateTime.now();
  var name;
  var category;
  TextEditingController person = TextEditingController();
  TextEditingController money = TextEditingController();
  TextEditingController note = TextEditingController();
  late Map selectedWallet;
  late String selectedNameWallet;
  late List listWallet;
  String method = '-';
  TextEditingController interest = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final width = MediaQuery.of(context).size.width;
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        title: Text("Chi tiết giao dịch"));

    return Scaffold(
        appBar: appBar,
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Số tiền'),
                      TextFormField(
                        controller: money,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Input k hợp lệ';
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          Map result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListCategories()));
                          if (result != null)
                            setState(() {
                              name = result['selectedTitle'];
                              category = result['selectedCategory'];
                              method = result['method'];
                            });
                          print(name);
                          print(category);
                        },
                        child: Ink(
                          height: 50,
                          child: category == null
                              ? Row(
                                  children: [
                                    Text('Tên hạng mục'),
                                    Icon(Icons.arrow_forward)
                                  ],
                                )
                              : Text(category + ': ' + name),
                        ),
                      ),
                      Container(
                        child: Text(
                          categoryNof,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      category == 'Đi vay và thu nợ (Tiền vào)' ||
                              category == 'Cho vay và trả nợ (Tiền ra)'
                          ? Container(
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.length == 0)
                                        return 'mục này k được trống';
                                      return null;
                                    },
                                    controller: person,
                                    decoration: InputDecoration(
                                        hintText: 'Người cho vay'),
                                  ),
                                  TextFormField(
                                    controller: interest,
                                    validator: (value) {
                                      if (double.tryParse(value.toString()) ==
                                          null) return 'input k hợp lệ';
                                      return null;
                                    },
                                    decoration:
                                        InputDecoration(hintText: 'Lãi suất'),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          // minTime: ,
                                          minTime: DateTime.now(),
                                          onChanged: (date) {},
                                          onConfirm: (date) {
                                        setState(() {
                                          remindTime = date;
                                        });
                                      },
                                          currentTime: remindTime,
                                          locale: LocaleType.vi)
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today_outlined,
                                              color: Color(0xff12B281)),
                                          Column(
                                            children: [
                                              Text('Ngày trả nợ'),
                                              Text(
                                                DateFormat.yMMMMEEEEd()
                                                    .format(remindTime),
                                                style: TextStyle(
                                                    color: Color(0xff12B281)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Ghi chú'),
                        controller: note,
                      ),
                      GestureDetector(
                        onTap: () => {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              // minTime: ,
                              maxTime: DateTime.now(),
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              time = date;
                            });
                          }, currentTime: time, locale: LocaleType.vi)
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 26),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Color(0xff12B281),
                                      ),
                                    ),
                                    Text(
                                      DateFormat.yMMMMEEEEd().format(time),
                                      style:
                                          TextStyle(color: Color(0xff12B281)),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: width / 2,
                        child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            value: selectedNameWallet,
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
                              setState(() {
                                selectedWallet = newWallet;
                                selectedNameWallet = value.toString();
                              });
                            },
                            hint: Text("Select item")),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          children: [
            SizedBox(
              width: width,
              child: ElevatedButton(
                child: Text('Lưu'),
                onPressed: () async {
                  if (_formKey.currentState!.validate() && category != null) {
                    Map<String, dynamic> transaction = {
                      'method': method,
                      'money': double.parse(money.text),
                      'name': name,
                      'category': category,
                      'note': note.text,
                      'time': Timestamp.fromDate(time),
                      'typeWallet': selectedWallet,
                      'idWallet': selectedWallet['id']
                    };

                    if (category == 'Đi vay và thu nợ (Tiền vào)' ||
                        category == 'Cho vay và trả nợ (Tiền ra)') {
                      transaction['person'] = person.text;
                      transaction['interest'] = double.parse(interest.text);
                      transaction['remindTime'] =
                          Timestamp.fromDate(remindTime);
                    }
                    int index = listWallet.indexOf(selectedWallet);
                    await addToHistory();
                    if (method == '-')
                      listWallet[index]['money'] -= transaction['money'];
                    else
                      listWallet[index]['money'] += transaction['money'];

                    await UserDatabase()
                        .updateUserData({'listWallet': listWallet});

                    bool result =
                        await UserDatabase().addTransaction(transaction);
                    if (result) {
                      widget.fetchData();
                      Navigator.pop(context);
                    }
                  } else
                    print('invalidate');
                  if (category == null)
                    setState(() {
                      categoryNof = 'Trường này không được để trống';
                    });
                },
              ),
            ),
          ],
        ));
  }
}
