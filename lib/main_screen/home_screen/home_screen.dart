// ignore: unused_import
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'after_retirement_plan/after_retirement_screen.dart';
import 'saving_goals/saving_goals_screen.dart';
import 'wallets_slider_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<DocumentSnapshot?>(builder: (context, docSnap, child) {
            return docSnap == null
                ? Text('loading')
                : Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            docSnap.data()['photoURL'],
                            width: 50,
                            height: 50,
                          ),
                          Text('Hello, ' + docSnap.data()['name'])
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AfterRetirementScreen(docSnap.data()[
                                                      'listRetirement'] ==
                                                  null
                                              ? []
                                              : docSnap
                                                  .data()['listRetirement'])));
                            },
                            child: Container(
                              //alignment: AlignmentGeometry.lerp(a, b, t),
                              width: MediaQuery.of(context).size.width / 2,
                              // color: Colors.deepOrange,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Color(0xff12B281),
                                  ),
                                  Text('AFTER-RETIREMENT PLANNING')
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              var data =
                                  docSnap.data()['listSavingGoals'] == null
                                      ? []
                                      : docSnap.data()['listSavingGoals'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SavingGoalsScreen(data)));
                            },
                            child: Container(
                              //alignment: AlignmentGeometry.lerp(a, b, t),
                              width: MediaQuery.of(context).size.width / 2,
                              // color: Colors.deepOrange,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.multiline_chart,
                                    color: Color(0xff12B281),
                                  ),
                                  Text('YOUR SAVING GOALS')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      docSnap.data()['listWallet'] == null
                          ? WalletSliderCard([])
                          : WalletSliderCard(docSnap.data()['listWallet'])
                    ],
                  );
          }),
        ],
      ),
    );
  }
}
