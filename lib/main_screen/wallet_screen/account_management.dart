import 'package:active_ageing_mobile_app/login_screen/loading_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/wallet_screen/user_profile.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_password.dart';
import 'select_currency_unit.dart';

class AccountManagement extends StatefulWidget {
  AccountManagement(this.userAuthen, {Key? key}) : super(key: key);
  final UserAuthen userAuthen;
  @override
  _AccountManagementState createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  final Map userSample = {
    'name': 'Loading',
    'photoURL':
        'https://s3-alpha-sig.figma.com/img/a0b4/fd34/2210c5f7a9f72b3e284ed0769b35803a?Expires=1627862400&Signature=VX~evHwLNiL6QRjxX-EWTwDXyOrzkNvleJUZmo3H4VCvBbyigv6MsSlV9ATrdXhLghoWhmgGJeR6KCgO3Qd8Tf3zzzCGSWuwmRx1hdY04DSKk3eZ79mhG76oGuJWu5wQw9xLeljbqaAr8tH1St~hUzfg4QdJPQguJLjI-3UZtTVOCU~CvHgPT1POU6iYsrnesWmfQHXH71cQXQ19ggC5z01CYszg9lfHquhw4to-RRaOiY0oMvlCXjYGGVNC0YKR6qriBh1kFdSJ1U42SkjDiYkzGDDBzAEexCiyzBgRri8AxR8QYaQBV9Y7IDDnXLd4PLwOM6~k12bY6K1vegML4w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    'email': 'Loading',
  };
  String currency = 'VND';
  bool isSignout = false;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    Function updateCurrency = (String newCurrency) {
      setState(() {
        currency = newCurrency;
      });
    };
    final docSnap = Provider.of<DocumentSnapshot?>(context);
    final user = docSnap != null ? docSnap.data() : userSample;
    if (isSignout) return buildLoading();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffecf9f4),
            fontSize: 16 * curScaleFactor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          title: Text("T??i kho???n")),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: MediaQuery.of(context).size.height / 333.5 * 44,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //         image: AssetImage("assets/images/screen_header.png"),
            //         fit: BoxFit.fitWidth,
            //         alignment: Alignment.topCenter
            //     )
            //   ),
            //       child:
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children:
            //            [
            //              Container(
            //                width: MediaQuery.of(context).size.width / 187.5 * 8,
            //                height: MediaQuery.of(context).size.height / 333.5 * 1,
            //              ),
            //              Image.asset("assets/images/previous_icon.png"),
            //              Container(
            //                width: MediaQuery.of(context).size.width / 187.5 * 5,
            //                height: MediaQuery.of(context).size.height / 333.5 * 1,
            //              ),
            //              new Text("Quay l???i",
            //                  textAlign: TextAlign.center,
            //                  style: TextStyle(
            //                    fontFamily: 'Inter',
            //                    color: Color(0xffecf9f4),
            //                    fontSize: 14 * curScaleFactor,
            //                    fontWeight: FontWeight.w400,
            //                    fontStyle: FontStyle.normal,
            //                  )
            //              ),
            //              Container(
            //                width: MediaQuery.of(context).size.width / 187.5 * 30,
            //                height: MediaQuery.of(context).size.height / 333.5 * 1,
            //              ),
            //              new Text("T??i kho???n",
            //                  textAlign: TextAlign.center,
            //                  style: TextStyle(
            //                    fontFamily: 'Inter',
            //                    color: Color(0xffecf9f4),
            //                    fontSize: 16 * curScaleFactor,
            //                    fontWeight: FontWeight.w500,
            //                    fontStyle: FontStyle.normal,
            //                  )
            //              ),
            //            ]
            //         )
            // ),
            Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/avatar.png",
                    width: MediaQuery.of(context).size.width / 187.5 * 82.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 45,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 30,
                    height: MediaQuery.of(context).size.height / 333.5 * 6,
                  ),
                  new Text(user['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff1a1a1a),
                        fontSize: 24 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  new Text(user['email'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 12 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 30,
                    height: MediaQuery.of(context).size.height / 333.5 * 18,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                // InkWell(
                //   // borderRadius: BorderRadius.all(Radius.circular(5)),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (BuildContext context) => Provider(
                //                 create: (context) => updateCurrency,
                //                 builder: (context, child) =>
                //                     SelectCurrencyUnit())));
                //   },
                //   child: Container(
                //     width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                //     height: MediaQuery.of(context).size.height / 333.5 * 33,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xffffffff)),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Container(
                //           width: MediaQuery.of(context).size.width / 187.5 * 8,
                //           height:
                //               MediaQuery.of(context).size.height / 333.5 * 1,
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             new Text("????n v??? ti???n t???",
                //                 style: TextStyle(
                //                   fontFamily: 'Inter',
                //                   color: Color(0xff1a1a1a),
                //                   fontSize: 16 * curScaleFactor,
                //                   fontWeight: FontWeight.w500,
                //                   fontStyle: FontStyle.normal,
                //                 )),
                //             Container(
                //               width:
                //                   MediaQuery.of(context).size.width / 187.5 * 8,
                //               height: MediaQuery.of(context).size.height /
                //                   333.5 *
                //                   2,
                //             ),
                //             new Text(currency,
                //                 style: TextStyle(
                //                   fontFamily: 'Inter',
                //                   color: Color(0xff999999),
                //                   fontSize: 12 * curScaleFactor,
                //                   fontWeight: FontWeight.w400,
                //                   fontStyle: FontStyle.normal,
                //                 ))
                //           ],
                //         ),
                //         Container(
                //           width: MediaQuery.of(context).size.width / 187.5 * 89,
                //           height:
                //               MediaQuery.of(context).size.height / 333.5 * 1,
                //         ),
                //         Image.asset("assets/images/next_icon.png",
                //             width: 40, height: 40),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 30,
                  height: MediaQuery.of(context).size.height / 333.5 * 4,
                ),
                InkWell(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text("Ng??n ng???",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 16 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 8,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  2,
                            ),
                            new Text("Ti???ng Vi???t",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff999999),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ))
                          ],
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 100,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 1,
                        ),
                        Image.asset("assets/images/next_icon.png",
                            width: 40, height: 40),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 0.8,
                    color: Color(0xffededed)),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Provider(
                          create: (context) => docSnap,
                          builder: (context, child) => UserProfile(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text("?????i th??ng tin",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 16 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 1,
                        ),
                        Image.asset("assets/images/next_icon.png",
                            width: 40, height: 40),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 89,
                  height: MediaQuery.of(context).size.height / 333.5 * 4,
                ),
                InkWell(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    if (UserAuthen().signInMethod() == 'password')
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen()));
                    else
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  'L???i',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text(
                                    "B???n ??ang ????ng nh???p v???i t??i kho???n Google, v?? v???y ch??ng t??i kh??ng th??? thay ?????i m???t kh???u ???????c"),
                              ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text("?????i m???t kh???u",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 16 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 89,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 1,
                        ),
                        Image.asset("assets/images/next_icon.png",
                            width: 40, height: 40),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 0.8,
                    color: Color(0xffededed)),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 8,
                ),
                InkWell(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () async {
                    setState(() {
                      isSignout = true;
                    });
                    await widget.userAuthen.signOut();
                    Navigator.pop(context);
                    // setState(() {
                    //   isSignout = false;
                    // });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 23,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffffffff),
                    ),
                    child: new Text("????ng xu???t",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xffff2d2d),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
