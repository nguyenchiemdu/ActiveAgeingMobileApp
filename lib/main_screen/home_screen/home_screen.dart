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
                                new Text("Ch??o " + docSnap.data()['name'],
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
                                            Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Color(0xffffffff)),
                                                child: Icon(
                                                    Icons
                                                        .wheelchair_pickup_rounded,
                                                    color: Color(0xff12B281))),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  187.5 *
                                                  8,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  333.5 *
                                                  4,
                                            ),
                                            new Text("K??? HO???CH V??? H??U",
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
                                            Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Color(0xffffffff)),
                                                child: Icon(
                                                    Icons.savings_rounded,
                                                    color: Color(0xff12B281))),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  187.5 *
                                                  8,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  333.5 *
                                                  4,
                                            ),
                                            new Text("M???C TI??U TI???T KI???M",
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
                          Icon(Icons.monetization_on_outlined,
                              color: Color(0xff999999)),
                          new Text("T??i ch??nh",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff999999),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ))
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 4,
                        height: MediaQuery.of(context).size.height / 333.5 * 4,
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Column(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 4,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  0,
                            ),
                            Row(children: [
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MoneyManagementScreen(
                                                  docSnap.data()['listWallet'],
                                                  false,
                                                  1)));
                                },
                                child: Ink(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        83.75,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        44,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.calendar_today_rounded,
                                              color: Color(0xffFF800B)),
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
                                          new Text("Nh???t k??\nchi ti??u",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xff999999),
                                                fontSize: 12 * curScaleFactor,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ))
                                        ])),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    4,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    0,
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
                                        83.75,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        44,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.savings_rounded,
                                              color: Color(0xff565cf7)),
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
                                          new Text("M???c ti??u\nti???t ki???m",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xff999999),
                                                fontSize: 12 * curScaleFactor,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ))
                                        ])),
                              ),
                            ]),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 4,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  4,
                            ),
                            Row(children: [
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
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
                                child: Ink(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        83.75,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        44,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.wheelchair_pickup_rounded,
                                              color: Color(0xff12b281)),
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
                                          new Text("K??? ho???ch\nv??? h??u",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xff999999),
                                                fontSize: 12 * curScaleFactor,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ))
                                        ])),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    4,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    0,
                              ),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onTap: () {},
                                child: Ink(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        83.75,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        44,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.compare,
                                              color: Color(0xffEC5B5B)),
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
                                          new Text("G???i ??\n?????u t??",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Color(0xff999999),
                                                fontSize: 12 * curScaleFactor,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ))
                                        ])),
                              ),
                            ]),
                          ],
                        ),
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
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 333.5 * 4,
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width / 187.5 * 171.5,
                        child: Row(children: [
                          Icon(Icons.favorite_border_rounded,
                              color: Color(0xff999999)),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 4,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          new Text("S???c kh???e",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff999999),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ))
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 333.5 * 4,
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
                                        Icon(Icons.remember_me_rounded,
                                            color: Color(0xffEC5B5B)),
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
                                        new Text("Nh???c l???ch kh??m\ns???c kh???e",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff999999),
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
                                        Icon(Icons.group_rounded,
                                            color: Color(0xff565cf7)),
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
                                        new Text("C???ng ?????ng ch??m s??c\ns???c kh???e",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff999999),
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
                                        Icon(Icons.health_and_safety_rounded,
                                            color: Color(0xff12b281)),
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
                                        new Text("S???n ph???m ch??m s??c\ns???c kh???e",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff999999),
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
                                        Icon(Icons.book_rounded,
                                            color: Color(0xffff800b)),
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
                                        new Text("H???i th???o v???\ns???c kh???e",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff999999),
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
                              new Text("Ho???t ?????ng x?? h???i",
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
                              new Text("Xem to??n b???",
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
                          new Text("Gi???i tr??",
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
                          new Text("Xem to??n b???",
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
                      //     child: Text('Qu???n l?? chi ti??u')),
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
