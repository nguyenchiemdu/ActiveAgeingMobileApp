import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return MultiProvider(
      providers: [
        StreamProvider<User?>(
            create: (context) => FirebaseAuth.instance.authStateChanges(),
            initialData: null)
      ],
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: new Text("Đăng ký tài khoản",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: 18 * curScaleFactor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 1,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 28,
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width:1.0,color: Color(0xffededed))
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: name,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      hintText: "Họ và tên",
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 1,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 28,
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width:1.0,color: Color(0xffededed))
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: email,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      hintText: "Địa chỉ email",
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 1,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 28,
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width:1.0,color: Color(0xffededed))
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      hintText: "Nhập mật khẩu",
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 1,
              height: MediaQuery.of(context).size.height / 333.5 * 103,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(12 * curScaleFactor),
                ) ,
                child: ElevatedButton(
                  onPressed: () {
                    UserAuthen().createUser(
                        email.text, password.text, name.text, context);
                  },
                  child: Text('ĐĂNG KÝ'),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                //print('ok');
                UserAuthen().signOut();
              },
              child: Text('log out'),
            ),
            Consumer<User?>(
                builder: (context, user, child) => Text(user.toString())),
          ],
        ),
      ),
    );
  }
}
