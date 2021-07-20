import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   UserDatabase().getUserData();
  // }

  int selectIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<Map>.value(
      value: UserDatabase().getUserData(),
      initialData: {'name': 'null'},
      child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer<Map>(
                    builder: (context, userData, child) =>
                        Text(userData['name'])),
                ElevatedButton(
                  onPressed: () {
                    //print('ok');
                    UserAuthen().signOut();
                  },
                  child: Text('log out'),
                )
              ],
            ),
          ),
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
