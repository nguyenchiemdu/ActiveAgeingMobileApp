import 'dart:convert';

import 'package:active_ageing_mobile_app/main_screen/home_screen/home_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/wallet_screen/wallet_screen.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          body: listScreen[selectIndex],
          bottomNavigationBar: Container(
            child: BottomNavigationBar(
              onTap: _selectPage,
              currentIndex: selectIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    color: Colors.red,
                  ),
                  label: "HomePage",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.money,
                      color: Colors.red,
                    ),
                    label: "FinCare"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bento_sharp,
                      color: Colors.red,
                    ),
                    label: "Health Care"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.wallet_giftcard,
                      color: Colors.red,
                    ),
                    label: "Wallet"),
              ],
            ),
          )),
    );
  }
}
