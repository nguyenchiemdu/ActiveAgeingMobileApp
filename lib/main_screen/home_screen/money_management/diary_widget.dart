import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/time_picker_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/transaction_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_transaction_screen.dart';
import 'list_transaction_item.dart';

class DiaryWidget extends StatelessWidget {
  DiaryWidget(
      this.listWallets,
      this.setState,
      this.fetchData,
      this.listTransactionWidgets,
      this.selectedName,
      this.selectedWallet,
      this.listWallet,
      this.timePicker,
      {Key? key})
      : super(key: key);
  final List listWallets;
  String selectedName = 'VND';
  List<String> listCurrency = ['VND', 'USD', 'RUB'];
  List<Widget> listTransactionWidgets = [];
  Map selectedWallet = {};
  var timePicker;
  List listWallet = [];
  final Function setState;
  final Function fetchData;
  late BuildContext buildContext;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   listWallet = widget.listWallets;
  //   List<String> listString =
  //       listWallet.map<String>((wallet) => wallet['name']).toList();
  //   selectedName = listString[0];
  //   selectedWallet = listWallet[0];
  //   fetchData();
  // }

  // fetchData() async {
  //   String uid = FirebaseAuth.instance.currentUser.uid;
  //   String path = 'users/' + uid + '/listTransactions';
  //   var query = FirebaseFirestore.instance
  //       .collection(path)
  //       .where('idWallet', isEqualTo: selectedWallet['id']);
  //   if (timePicker != null) {
  //     query = query
  //         .where('time',
  //             isGreaterThanOrEqualTo:
  //                 Timestamp.fromDate(timePicker['startTime']))
  //         .where('time',
  //             isLessThanOrEqualTo: Timestamp.fromDate(timePicker['endTime']));
  //   }
  //   List<Widget> listNews = await query.get().then((querySnapshot) {
  //     List<Widget> respond = [];
  //     querySnapshot.docs.forEach((snap) {
  //       respond.add(TransactionItem(snap.data()));
  //     });
  //     return respond;
  //   });
  //   setState(() {
  //     listTransactionWidgets = listNews;
  //   });
  // }

  List<Map> listHistoryWallets = [];
  addTransactionScreen() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    List<Map> listHistoryWalletsTmp = await FirebaseFirestore.instance
        .collection('users/' + uid + '/historyWallets')
        .get()
        .then((querySnapshot) {
      List<Map> result = [];
      querySnapshot.docs.forEach((doc) {
        result.add(doc.data());
      });
      return result;
    });
    Navigator.push(
        buildContext,
        MaterialPageRoute(
            builder: (context) => AddTransactionScreen(
                listWallet, listHistoryWalletsTmp, fetchData)));
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    buildContext = context;
    double width = MediaQuery.of(context).size.width;
    // var querySnapshot = Provider.of<QuerySnapshot?>(context);
    // if (querySnapshot != null) {
    //   listTransactionWidgets = [];
    //   querySnapshot.docs.forEach((element) {
    //     Map transaction = element.data();
    //     listTransactionWidgets.add(TransactionItem(transaction));
    //   });
    // }
    QuerySnapshot? querySnapshot = Provider.of<QuerySnapshot?>(context);
    if (querySnapshot != null) {
      listHistoryWallets = [];
      querySnapshot.docs.forEach((historyWallets) {
        listHistoryWallets.add(historyWallets.data());
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
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
                        border: Border.all(
                            color: Color(0xffdedede),
                            width: 1
                        )
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 4,
                          height: MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        Icon(Icons.payments_rounded, color:  Color(0xff12b281),),
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
                                child: Text(wallet['name'],
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff4d4d4d),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),),
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
                        border: Border.all(
                            color: Color(0xffdedede),
                            width: 1
                        )
                    ),
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
                                Text(timePicker['duration'] +" gần nhất",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff1a1a1a),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Text(DateFormat('yMd')
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
                                  ),)
                              ],
                            )
                                : Text('Chọn khoảng thời gian'),
                          )),
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 4,
                height: MediaQuery.of(context).size.height / 333.5 * 6,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 333.5 * 0.75,
                  color: Color(0xffdedede)
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                  color: Color(0xffededed)
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 333.5 * 0.75,
                  color: Color(0xffdedede)
              ),
              Container(
                color: Color(0xffFFFFFF),
                child: Column(
                  children: listTransactionWidgets,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTransactionScreen(
                      listWallet, listHistoryWallets, fetchData)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
