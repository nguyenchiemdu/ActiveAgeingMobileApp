import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatelessWidget {
  final Function cancelTimer;
  VerificationScreen(this.cancelTimer, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final userAuthen = Provider.of<UserAuthen>(context);
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
          title: Text("Đăng ký tài khoản")),
      body: Container(
        color: Color(0xffd3f1e7),
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: Text("Xác thực email của bạn",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: 18 * curScaleFactor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                child: Text("Một mã xác thực đã được gửi về địa chỉ email: " +
                    FirebaseAuth.instance.currentUser.email +" của bạn, vui lòng kiểm tra email và làm theo hướng dẫn.",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff666666),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 150,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(12 * curScaleFactor),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    cancelTimer();
                    //print('ok');
                    userAuthen.signOut();
                    cancelTimer();
                  },
                  child: Text('ĐĂNG XUẤT'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
