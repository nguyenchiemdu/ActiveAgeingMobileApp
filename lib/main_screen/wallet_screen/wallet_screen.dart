import 'package:active_ageing_mobile_app/main_screen/wallet_screen/list_wallets.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_management.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);
  final Map userSample = {
    'name': 'Loading',
    'photoURL':
        'https://s3-alpha-sig.figma.com/img/a0b4/fd34/2210c5f7a9f72b3e284ed0769b35803a?Expires=1627862400&Signature=VX~evHwLNiL6QRjxX-EWTwDXyOrzkNvleJUZmo3H4VCvBbyigv6MsSlV9ATrdXhLghoWhmgGJeR6KCgO3Qd8Tf3zzzCGSWuwmRx1hdY04DSKk3eZ79mhG76oGuJWu5wQw9xLeljbqaAr8tH1St~hUzfg4QdJPQguJLjI-3UZtTVOCU~CvHgPT1POU6iYsrnesWmfQHXH71cQXQ19ggC5z01CYszg9lfHquhw4to-RRaOiY0oMvlCXjYGGVNC0YKR6qriBh1kFdSJ1U42SkjDiYkzGDDBzAEexCiyzBgRri8AxR8QYaQBV9Y7IDDnXLd4PLwOM6~k12bY6K1vegML4w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    'email': 'Loading',
  };
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final docSnap = Provider.of<DocumentSnapshot?>(context);
    final user = docSnap != null ? docSnap.data() : userSample;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 187.5 * 171.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 8,
              height: MediaQuery.of(context).size.height / 333.5 * 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              child: new Text("Ví của bạn",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff333333),
                    fontSize: 24 * curScaleFactor,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 8,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffffffff)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/avatar.png",
                      width: MediaQuery.of(context).size.width / 187.5 * 82.5,
                      height: MediaQuery.of(context).size.height / 333.5 * 45,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 4,
                    ),
                    Text(user['name'],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff1a1a1a),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    Text(user['email'],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 66,
                      height: MediaQuery.of(context).size.height / 333.5 * 12,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    StreamProvider<DocumentSnapshot?>(
                                  create: (context) => FirebaseFirestore
                                      .instance
                                      .collection('users')
                                      .doc(
                                          FirebaseAuth.instance.currentUser.uid)
                                      .snapshots(),
                                  initialData: null,
                                  builder: (context, child) =>
                                      AccountManagement(),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffededed),
                              shadowColor: Colors.transparent),
                          child: Text('Quản lí tài khoản',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff4d4d4d),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ))),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 8,
              height: MediaQuery.of(context).size.height / 333.5 * 4,
            ),
            InkWell(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              onTap: () {
                var param =
                    user['listWallet'] == null ? [] : user['listWallet'];
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListWallet(param)));
              },
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
                      height: MediaQuery.of(context).size.height / 333.5 * 1,
                    ),
                    Image.asset("assets/images/wallet_icon.png",
                        width: 40, height: 40),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text("Ví của bạn",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff1a1a1a),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        new Text("Danh sách ví của bạn",
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
                      width: MediaQuery.of(context).size.width / 187.5 * 50,
                      height: MediaQuery.of(context).size.height / 333.5 * 1,
                    ),
                    Image.asset("assets/images/next_icon.png",
                        width: 40, height: 40),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 8,
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
                      height: MediaQuery.of(context).size.height / 333.5 * 1,
                    ),
                    Image.asset("assets/images/wallet_icon.png",
                        width: 40, height: 40),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text("Xem báo cáo",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff1a1a1a),
                              fontSize: 14 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 8,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        new Text("Báo cáo về giao dịch, tiết kiệm, đầu tư",
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
                      width: MediaQuery.of(context).size.width / 187.5 * 4,
                      height: MediaQuery.of(context).size.height / 333.5 * 1,
                    ),
                    Image.asset("assets/images/next_icon.png",
                        width: 40, height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
