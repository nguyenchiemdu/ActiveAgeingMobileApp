// ignore: unused_import
import 'package:active_ageing_mobile_app/login_screen/loading_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/recreational_slider_card.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/social_activity_slider_card.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_popup.dart';
import 'after_retirement_plan/after_retirement_screen.dart';
import 'money_management/money_management.dart';
import 'saving_goals/saving_goals_screen.dart';
import 'wallets_slider_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Consumer<DocumentSnapshot?>(builder: (context, docSnap, child) {
      return docSnap == null
          ? buildLoading()
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Color(0xff12b281),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 333.5 * 10,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height /
                                333.5 *
                                15),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/top_bar.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter)),
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 333.5 * 5,
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      8,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      1,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            docSnap.data()['photoURL']),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      4,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      0,
                                ),
                                new Text("Chào " + docSnap.data()['name'],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xffffffff),
                                      fontSize: 14 * curScaleFactor,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 8,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  8,
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
                                                    AfterRetirementScreen(docSnap
                                                                    .data()[
                                                                'listRetirement'] ==
                                                            null
                                                        ? []
                                                        : docSnap.data()[
                                                            'listRetirement'])));
                                      },
                                      child: Container(
                                        //alignment: AlignmentGeometry.lerp(a, b, t),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        // color: Colors.deepOrange,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/retirement_planning_icon.png",
                                                width: 50,
                                                height: 50),
                                            new Text(
                                                "AFTER-RETIREMENT\nPLANNING",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xffffffff),
                                                  fontSize: 12 * curScaleFactor,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        var data =
                                            docSnap.data()['listSavingGoals'] ==
                                                    null
                                                ? []
                                                : docSnap
                                                    .data()['listSavingGoals'];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SavingGoalsScreen(data)));
                                      },
                                      child: Container(
                                        //alignment: AlignmentGeometry.lerp(a, b, t),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        // color: Colors.deepOrange,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/saving_icon.png",
                                                width: 50,
                                                height: 50),
                                            new Text("YOUR SAVING\nGOALS",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xffffffff),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      4,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      8,
                                ),
                                docSnap.data()['listWallet'] == null
                                    ? WalletSliderCard([])
                                    : WalletSliderCard(
                                        docSnap.data()['listWallet'])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 4,
                        height: MediaQuery.of(context).size.height / 333.5 * 8,
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Row(children: [
                          Image.asset("assets/images/fincare-icon.png",
                              width: 40, height: 40),
                          new Text("FinCare",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ))
                        ]),
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Row(children: [
                          InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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
                            child: Ink(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    54.5,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    44,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/smaller_retirement_icon.png",
                                          width: 25,
                                          height: 25),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                187.5 *
                                                4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                333.5 *
                                                4,
                                      ),
                                      new Text("After-\nRetirement Plan",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff666666),
                                            fontSize: 12 * curScaleFactor,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ))
                                    ])),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 4,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 0,
                          ),
                          InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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
                            child: Ink(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    54.5,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    44,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/smaller_saving_icon.png",
                                          width: 25,
                                          height: 25),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                187.5 *
                                                4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                333.5 *
                                                4,
                                      ),
                                      new Text("Saving\nGoals",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff666666),
                                            fontSize: 12 * curScaleFactor,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ))
                                    ])),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 4,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 0,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  54.5,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  44,
                              decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/smaller_invest_icon.png",
                                        width: 25,
                                        height: 25),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          187.5 *
                                          4,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              333.5 *
                                              4,
                                    ),
                                    new Text("Investment-\nRecommendation",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff666666),
                                          fontSize: 12 * curScaleFactor,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ))
                                  ])),
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 333.5 * 8,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                          color: Color(0xffebebeb)),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Row(children: [
                          Image.asset("assets/images/healthcare-icon.png",
                              width: 40, height: 40),
                          new Text("Sức khỏe",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ))
                        ]),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width /
                                187.5 *
                                171.5,
                            child: Row(children: [
                              Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      83.5,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      44,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/check_up_icon.png",
                                            width: 25,
                                            height: 25),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              187.5 *
                                              4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              333.5 *
                                              4,
                                        ),
                                        new Text("Health check-up\nreminder",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff666666),
                                              fontSize: 12 * curScaleFactor,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ))
                                      ])),
                              Container(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    4,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    0,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      83.5,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      44,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/community_icon.png",
                                            width: 25,
                                            height: 25),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              187.5 *
                                              4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              333.5 *
                                              4,
                                        ),
                                        new Text("Healthcare\nCommunity",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff666666),
                                              fontSize: 12 * curScaleFactor,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ))
                                      ])),
                            ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 4,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width /
                                187.5 *
                                171.5,
                            child: Row(children: [
                              Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      83.5,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      44,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/products_icon.png",
                                            width: 25,
                                            height: 25),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              187.5 *
                                              4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              333.5 *
                                              4,
                                        ),
                                        new Text("Health check-up\nproducts",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff666666),
                                              fontSize: 12 * curScaleFactor,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ))
                                      ])),
                              Container(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    4,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    0,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width /
                                      187.5 *
                                      83.5,
                                  height: MediaQuery.of(context).size.height /
                                      333.5 *
                                      44,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/workshops_icon.png",
                                            width: 25,
                                            height: 25),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              187.5 *
                                              4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              333.5 *
                                              4,
                                        ),
                                        new Text("Healthcare\nworkshops",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff666666),
                                              fontSize: 12 * curScaleFactor,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ))
                                      ])),
                            ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 8,
                          ),
                        ],
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                          color: Color(0xffebebeb)),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                  "assets/images/social-activity-icon.png",
                                  width: 40,
                                  height: 40),
                              new Text("Hoạt động xã hội",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff1a1a1a),
                                    fontSize: 14 * curScaleFactor,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    59.5,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    0,
                              ),
                              new Text("Xem toàn bộ",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff00865d),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ]),
                      ),
                      SocialActivitySliderCard(),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                          color: Color(0xffebebeb)),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Row(children: [
                          Image.asset("assets/images/social-activity-icon.png",
                              width: 40, height: 40),
                          new Text("Giải trí",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width /
                                187.5 *
                                69.5,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 0,
                          ),
                          new Text("Xem toàn bộ",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff00865d),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ))
                        ]),
                      ),
                      RecreationalActivitySliderCard(),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 8,
                          color: Color(0xffebebeb)),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => MoneyManagementScreen(
                      //                   docSnap.data()['listWallet'],
                      //                   false,
                      //                   1)));
                      //     },
                      //     child: Text('Quản lí chi tiêu')),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 50)
                    ],
                  ),
                ),
              ],
            );
    });
  }
}
