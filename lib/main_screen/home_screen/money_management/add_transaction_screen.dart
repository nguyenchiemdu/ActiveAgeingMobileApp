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
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  Container(

                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 187.5 * 8),
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 46,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                          height: MediaQuery.of(context).size.height / 333.5 * 8,
                        ),
                        Text('Số tiền',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 12 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),),
                        TextFormField(
                          controller: money,
                          style: TextStyle(
                          fontFamily: 'Inter',
                            color: Color(0xff00865D),
                            fontSize: 32 * curScaleFactor,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                        ),
                          textAlign: TextAlign.right,
                          validator: (value) {
                            if (double.tryParse(value.toString()) == null)
                              return 'Input không hợp lệ';
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 4,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                      height: MediaQuery.of(context).size.height / 333.5 * 40,

                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
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
                                height: MediaQuery.of(context).size.height / 333.5 * 24,
                                child: category == null
                                  ? Padding(
                                    padding: const EdgeInsets.only(right:8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width / 187.5 * 8,
                                                height: MediaQuery.of(context).size.height / 333.5 * 1,
                                              ),
                                              Icon(Icons.account_balance_wallet, color: Color(0xff12B281),),
                                              Container(
                                                width: MediaQuery.of(context).size.width / 187.5 * 8,
                                                height: MediaQuery.of(context).size.height / 333.5 * 1,
                                              ),
                                              Text('Chọn hạng mục',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xff999999),
                                                  fontSize: 18 * curScaleFactor,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                ),),
                                            ],
                                          ),
                                          Icon(Icons.more_horiz_rounded, color: Color(0xff999999),)
                                        ],
                                      ),
                                  )
                                  : Padding(
                                padding: const EdgeInsets.only(right:8),
                                    child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                                          height: MediaQuery.of(context).size.height / 333.5 * 1,
                                        ),
                                        Icon(Icons.account_balance_wallet, color: Color(0xff12B281),),
                                        Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                                          height: MediaQuery.of(context).size.height / 333.5 * 1,
                                        ),
                                        Text(name,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff1a1a1a),
                                            fontSize: 18 * curScaleFactor,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                          ),),
                                      ],
                                    ),
                                    Icon(Icons.more_horiz_rounded, color: Color(0xff999999),)
                                ],
                              ),
                                  )
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 187.5 * 160,
                            height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                            color:Color(0xffededed)
                          ),
                          // Container(
                          //   child: Text(
                          //     categoryNof,
                          //     style: TextStyle(color: Colors.red),
                          //   ),
                          // ),
                          category == 'Đi vay và thu nợ (Tiền vào)' ||
                                  category == 'Cho vay và trả nợ (Tiền ra)'
                              ? Container(
                                    child: Column(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 333.5 * 24,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 187.5 * 8,
                                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                            ),
                                            Icon(Icons.person_outline_rounded, color: Color(0xff999999)),
                                            Container(
                                                width: MediaQuery.of(context).size.width / 187.5 * 8,
                                                height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                            ),
                                            Flexible(
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null || value.length == 0)
                                                    return 'Mục này không được để trống!';
                                                  return null;
                                                },
                                                controller: person,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xff999999),
                                                  fontSize: 14 * curScaleFactor,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                decoration: InputDecoration(
                                                    hintText: 'Người cho vay',
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Color(0xff999999),
                                                      fontSize: 14 * curScaleFactor,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,),

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 160,
                                          height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                          color:Color(0xffededed)
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 333.5 * 24,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 187.5 * 8,
                                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                            ),
                                            Icon(Icons.star, color: Color(0xff999999)),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 187.5 * 8,
                                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                            ),
                                            Flexible(
                                              child: TextFormField(
                                                controller: interest,
                                                validator: (value) {
                                                  if (double.tryParse(value.toString()) ==
                                                      null) return 'Mục này không được để trống!';
                                                  return null;
                                                },
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xff999999),
                                                  fontSize: 14 * curScaleFactor,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                decoration:
                                                    InputDecoration(
                                                      hintText: 'Lãi suất',
                                                      hintStyle: TextStyle(
                                                        fontFamily: 'Inter',
                                                        color: Color(0xff999999),
                                                        fontSize: 14 * curScaleFactor,
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                      focusedBorder: InputBorder.none,
                                                      enabledBorder: InputBorder.none,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 160,
                                          height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                          color:Color(0xffededed)
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height / 333.5 * 34,
                                        child: GestureDetector(
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
                                          child: Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width / 187.5 * 8,
                                                height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                              ),
                                              Icon(Icons.calendar_today_outlined,
                                                  color: Color(0xff999999)),
                                              Container(
                                                  width: MediaQuery.of(context).size.width / 187.5 * 8,
                                                  height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('Ngày trả nợ',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xff999999),
                                                    fontSize: 14 * curScaleFactor,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  ),),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width / 187.5 * 8,
                                                    height: MediaQuery.of(context).size.height / 333.5 * 2,
                                                  ),
                                                  Text(
                                                    DateFormat.yMMMMEEEEd()
                                                        .format(remindTime),
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

                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 160,
                                          height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                          color:Color(0xffededed)
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                              Container(
                                height: MediaQuery.of(context).size.height / 333.5 * 24,
                                child: Row(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width / 187.5 * 8,
                                        height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                    ),
                                    Icon(Icons.notes_rounded, color: Color(0xff999999)),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                                      height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Ghi chú',
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            isDense: true,
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff999999),
                                          fontSize: 14 * curScaleFactor,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        controller: note,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                          // Row(
                          //   children: [
                          //     Icon(Icons.notes_rounded,
                          //         color: Color(0xff999999)
                          //     ),
                          //     TextFormField(
                          //       decoration: InputDecoration(hintText: 'Ghi chú'),
                          //       style: TextStyle(
                          //         fontFamily: 'Inter',
                          //         color: Color(0xff1a1a1a),
                          //         fontSize: 14 * curScaleFactor,
                          //         fontWeight: FontWeight.w500,
                          //         fontStyle: FontStyle.normal,
                          //       ),
                          //       controller: note,
                          //     ),
                          //   ],
                          // ),
                          Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 160,
                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                              color:Color(0xffededed)
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 333.5 * 24,
                            child: GestureDetector(
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
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        height: MediaQuery.of(context).size.height / 333.5 * 24,
                                        child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                                          height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            color: Color(0xff999999),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                                          height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                        ),
                                        Text(
                                          DateFormat.yMMMMEEEEd().format(time),
                                          style: TextStyle(
                                                  color: Color(0xff1a1a1a),
                                                  fontFamily: 'Inter',
                                                  fontSize: 14 * curScaleFactor,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                              ),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 160,
                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                              color:Color(0xffededed)
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 333.5 * 26,
                            padding: EdgeInsets.only(right: 8),
                            child: Row(

                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width / 187.5 * 8,
                                        height: MediaQuery.of(context).size.height / 333.5 * 1,
                                      ),
                                      Icon(Icons.account_balance_wallet_rounded, color: Color(0xff12B281)),
                                      Container(
                                        width: MediaQuery.of(context).size.width / 187.5 * 8,
                                        height: MediaQuery.of(context).size.height / 333.5 * 1,
                                      ),
                                      Flexible(
                                        child: DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              hintText: 'Ghi chú',
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                            icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
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
                                ),
                                Icon(Icons.arrow_forward_ios_rounded, color:Color(0xff999999))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 160,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 24,
                    child: ElevatedButton(
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
                        child: Text('LƯU'.toUpperCase())),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 160,
                      height: MediaQuery.of(context).size.height / 333.5 * 10,
                  ),
                ],
              ),
            ),
          ),
        ),

);
  }
}
