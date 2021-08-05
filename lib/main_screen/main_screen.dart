import 'dart:convert';

import 'package:active_ageing_mobile_app/main_screen/home_screen/home_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/wallet_screen/wallet_screen.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  List<Widget> listScreen = [
    HomeScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.green,
    ),
    WalletScreen(),
  ];
  void _selectPage(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // FutureProvider(
        //     create: (context) => UserDatabase().getUserData(),
        //     initialData: {'name': 'null'}),
        StreamProvider<DocumentSnapshot?>(
            create: (context) => FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .snapshots(),
            initialData: null)
      ],
      child: Scaffold(
          extendBody: true,
          body: listScreen[selectIndex],
          floatingActionButton:
              FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.white.withAlpha(255),
            elevation: 0,
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white.withAlpha(0),
              type: BottomNavigationBarType.fixed,
              onTap: _selectPage,
              currentIndex: selectIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.pie_chart_outline,
                    ),
                    label: "Tài chính"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add,
                      color: Colors.transparent,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.health_and_safety_outlined,
                    ),
                    label: "Sức khỏe"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_balance_wallet_outlined,
                    ),
                    label: "Ví của bạn"),
              ],
              selectedLabelStyle: TextStyle(color: Color(0xff12b281)),
              selectedItemColor: Color(0xff12b281),
              unselectedItemColor: Color(0xff999999),
            ),
          )),
    );
  }
}
