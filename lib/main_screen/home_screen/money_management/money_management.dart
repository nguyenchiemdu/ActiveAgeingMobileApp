import 'package:active_ageing_mobile_app/main_screen/home_screen/after_retirement_plan/fail_widget.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/diary_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'report_widget.dart';

class MoneyManagementScreen extends StatefulWidget {
  const MoneyManagementScreen(this.listWallets, {Key? key}) : super(key: key);
  final List listWallets;
  @override
  _MoneyManagementScreenState createState() => _MoneyManagementScreenState();
}

class _MoneyManagementScreenState extends State<MoneyManagementScreen> {
  String condition = 'Wallet';
  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
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
                  initialIndex: 1,
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
                            ReportWidget(),
                            DiaryWidget(widget.listWallets)
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
