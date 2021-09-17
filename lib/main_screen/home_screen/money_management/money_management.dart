import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/fail_widget.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/add_transaction_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/diary_widget.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/list_transactions_by_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'report_widget.dart';
import 'transaction_item.dart';

class MoneyManagementScreen extends StatefulWidget {
  MoneyManagementScreen(this.listWallets, this.isShortcut, this.initIndex,
      {Key? key})
      : super(key: key);
  final List listWallets;
  final bool isShortcut;
  final int initIndex;
  final state = _MoneyManagementScreenState();
  @override
  _MoneyManagementScreenState createState() => state;
}

class _MoneyManagementScreenState extends State<MoneyManagementScreen> {
  List listWallets = [];
  String selectedName = 'VND';
  List<String> listCurrency = ['VND', 'USD', 'RUB'];
  List<Widget> listTransactionWidgets = [];
  List<Map> listTransaction = [];
  Map selectedWallet = {};
  Map timePicker = {
    'startTime': new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day),
    'endTime': new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59),
    'duration': 'Hôm nay'
  };
  List listWallet = [];
  List listHistory = [];
  bool hadWallet = false;
  @override
  void initState() {
    // TODO: implement initState

    listWallet = widget.listWallets;
    if (listWallet != null && listWallet.length != 0) {
      hadWallet = true;
      List<String> listString =
          listWallet.map<String>((wallet) => wallet['name']).toList();
      selectedName = listString[0];
      selectedWallet = listWallet[0];
      fetchData();
      fetchDataHistory();
    }
    super.initState();
  }

  Map<int, List> mapGroup = {};
  List<int> listDate = [];
  calculateGroup(List list) {
    DateFormat datetonum = DateFormat('yyyyMMdd');
    Set<int> setDate = list.map((transaction) {
      return int.parse(datetonum.format(transaction['time'].toDate()));
    }).toSet();
    listDate = setDate.toList();
    listDate.sort();
    listDate.forEach((numday) {
      mapGroup[numday] = [];
    });
    list.forEach((transaction) {
      int nd = int.parse(datetonum.format(transaction['time'].toDate()));
      mapGroup[nd]!.add(transaction);
    });
  }

  fetchData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/listTransactions';
    var query = FirebaseFirestore.instance
        .collection(path)
        .where('idWallet', isEqualTo: selectedWallet['id']);
    if (timePicker != null) {
      query = query
          .where('time',
              isGreaterThanOrEqualTo:
                  Timestamp.fromDate(timePicker['startTime']))
          .where('time',
              isLessThanOrEqualTo: Timestamp.fromDate(timePicker['endTime']));
    }
    List<Map> newTransactions = [];
    List<Widget> listNews = await query.get().then((querySnapshot) {
      List<Widget> respond = [];
      querySnapshot.docs.forEach((snap) {
        newTransactions.add(snap.data());
        respond.add(TransactionItem(snap.data()));
      });
      calculateGroup(newTransactions);
      respond = listTransactionsByDate(listDate, mapGroup);
      return respond;
    });
    setState(() {
      listTransaction = newTransactions;
      listTransactionWidgets = listNews;
    });
  }

  fetchDataHistory() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/historyWallets';
    List listHistoryTmp = await FirebaseFirestore.instance
        .collection(path)
        .doc(selectedWallet['id'])
        .get()
        .then((doc) => doc['listHistory']);
    setState(() {
      listHistory = listHistoryTmp;
    });
  }

  fetchAllData() {
    fetchData();
    fetchDataHistory();
  }

  updateState(Map data) {
    setState(() {
      if (data.containsKey('selectedName')) selectedName = data['selectedName'];
      if (data.containsKey('selectedWallet'))
        selectedWallet = data['selectedWallet'];
      if (data.containsKey('timePicker')) timePicker = data['timePicker'];
    });
  }

  late DiaryWidget diaryWidget;
  bool openedAddWidget = false;
  String condition = 'Wallet';
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      if (widget.isShortcut && !openedAddWidget) {
        diaryWidget.addTransactionScreen();
        setState(() {
          openedAddWidget = true;
        });
      }
    });
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    diaryWidget = DiaryWidget(
        widget.listWallets,
        updateState,
        fetchAllData,
        listTransactionWidgets,
        selectedName,
        selectedWallet,
        listWallet,
        timePicker);
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        title: Text("Báo cáo"));
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamProvider<QuerySnapshot?>(
      create: (context) => FirebaseFirestore.instance
          .collection('users/' + uid + '/historyWallets')
          .snapshots(),
      initialData: null,
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DefaultTabController(
                  length: 2,
                  initialIndex: widget.initIndex,
                  child: Column(
                    children: [
                      TabBar(
                          onTap: (index) {
                            //your currently selected index
                          },
                          labelColor: Color(0xff12B281),
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text('Báo cáo'.toUpperCase()),
                            ),
                            Tab(
                              child: Text('Nhật ký'.toUpperCase()),
                            ),
                          ]),
                      Container(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height) /
                            333.5 *
                            298,
                        child: TabBarView(
                          // controller: _tabController ,
                          children: [
                            hadWallet
                                ? ReportWidget(
                                    selectedName,
                                    timePicker,
                                    listWallet,
                                    selectedWallet,
                                    listHistory,
                                    listTransaction,
                                    fetchAllData,
                                    updateState)
                                : Text('Bạn chưa có ví nào'),
                            hadWallet ? diaryWidget : Text('Bạn chưa có ví nào')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
