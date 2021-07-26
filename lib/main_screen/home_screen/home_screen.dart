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
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Consumer<DocumentSnapshot?>(builder: (context, docSnap, child) {
      return docSnap == null
          ? Text('loading')
          : Column(
      children: [
        Container(
          color: Color(0xff12b281),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 333.5 * 10,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 333.5 * 15) ,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 8,
                height: MediaQuery.of(context).size.height / 333.5 * 1,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(docSnap.data()['photoURL']),
                      fit: BoxFit.fitWidth,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 4,
                height: MediaQuery.of(context).size.height / 333.5 * 0,
              ),
              new Text("Chào Quang",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xffffffff),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/top_bar.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter
              )
          ),
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 333.5 * 5,
      ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 8,
                    height: MediaQuery.of(context).size.height / 333.5 * 1,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(docSnap.data()['photoURL']),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 4,
                    height: MediaQuery.of(context).size.height / 333.5 * 0,
                  ),
                  new Text("Chào Quang",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xffffffff),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      )
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 8,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Column(
                  children: [
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
                          child:
                              Container(
                                //alignment: AlignmentGeometry.lerp(a, b, t),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2,
                                // color: Colors.deepOrange,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/retirement_planning_icon.png",width:50,height:50),
                                    new Text("AFTER-RETIREMENT\nPLANNING",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xffffffff),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        )
                                    )                                  ],
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            // color: Colors.deepOrange,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/saving_icon.png",width:50,height:50),
                                new Text("YOUR\nSAVING GOALS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xffffffff),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    )
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 4,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    docSnap.data()['listWallet'] == null
                        ? WalletSliderCard([])
                        : WalletSliderCard(docSnap.data()['listWallet'])
                  ],
                )

            ],
          ),
        ),
      ],
    );
  });
  }
}
