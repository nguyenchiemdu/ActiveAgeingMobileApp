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

  @override
  Widget build(BuildContext context) {
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
                color: Colors.blue,
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
