import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function updateVerifyEmail;
  LoginScreen(this.updateVerifyEmail, {Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    bool _value = false;

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 10.5,
              ),
              Center(
                child: new Text("Đăng nhập tài khoản",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: 18 * curScaleFactor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 10,
              ),

              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 28,
                  decoration: new BoxDecoration(
                      border: Border.all(width:1.0,color: Color(0xffededed), style: BorderStyle.solid),
                      color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: email,
                        decoration: InputDecoration(
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
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width:1.0,color: Color(0xffededed))
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Mật khẩu",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                _value = !_value;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: Color(0xff12b281),
                                  borderRadius:
                                  BorderRadius.circular(4)),
                              child: _value
                                  ? Icon(
                                Icons.check,
                                size: 15,
                                color: Colors.white,
                              )
                                  : Icon(
                                Icons.check_box_outline_blank,
                                size: 15,
                                color: Color(0xff12b281),
                              ),
                            )),
                      ),
                      new Text("Ghi nhớ đăng nhập",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 16 * curScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 22.5,
                        height: MediaQuery.of(context).size.height / 333.5 * 0,
                      ),
                      RichText(
                          text: new TextSpan(children: [
                            new TextSpan(
                                text: "Quên mật khẩu?",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1581ff),
                                  fontSize: 16 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                          ])),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ) ,
                  child: ElevatedButton(
                    onPressed: () {
                      //print('ok');
                      UserAuthen()
                          .signInWithEmailPassword(email.text, password.text)
                          .then((value) {
                        if (value == true)
                          widget.updateVerifyEmail(
                              FirebaseAuth.instance.currentUser.emailVerified);
                      });
                    },
                    child: Text('ĐĂNG NHẬP'),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 12.5,
              ),
              Center(
                child: InkWell(
                  child: new Text("Tôi chưa có tài khoản",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => SignUpScreen(),
                        ));
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 19,
              ),
              Center(
                child: new Text("Bạn có thể",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffc7c7c7),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 1,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 24,
                    decoration: new BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                        onPressed: () async {
                            await UserAuthen().signInWithGoogle();
                            },
                        child: Text('Đăng nhập với Google')),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
