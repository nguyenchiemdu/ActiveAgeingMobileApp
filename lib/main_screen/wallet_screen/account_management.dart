import 'package:active_ageing_mobile_app/main_screen/wallet_screen/user_profile.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_password.dart';
import 'select_currency_unit.dart';

class AccountManagement extends StatefulWidget {
  AccountManagement({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    Function updateCurrency = (String newCurrency) {
      setState(() {
        currency = newCurrency;
      });
    };
    final docSnap = Provider.of<DocumentSnapshot?>(context);
    final user = docSnap != null ? docSnap.data() : userSample;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Image.network(
                    user['photoURL'],
                    width: 50,
                    height: 50,
                  ),
                  Text(user['name']),
                  Text(user['email']),
                ],
              ),
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
                                create: (context) => updateCurrency,
                                builder: (context, child) =>
                                    SelectCurrencyUnit())));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Đơn vị tiền tệ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(currency)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ngôn Ngữ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('Tiếng Việt')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text('----------------'),
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
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Đổi thông tin',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
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
                                  'Error',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text(
                                    "You are sign in with Google account. So we can't change your password"),
                              ));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Đổi mật khẩu',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  onTap: () {
                    UserAuthen().signOut().then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Đăng xuất',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ],
                    ),
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
