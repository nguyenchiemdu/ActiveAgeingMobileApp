import 'package:active_ageing_mobile_app/login_screen/loading_screen.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLogIn = false;
  String message = '';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserAuthen>(context, listen: false);
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    bool _value = false;
    if (isLogIn) return buildLoading();
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
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
                        ))),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 1,
                  height: MediaQuery.of(context).size.height / 333.5 * 10,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                    height: MediaQuery.of(context).size.height / 333.5 * 28,
                    decoration: new BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: Color(0xffededed),
                          style: BorderStyle.solid),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value.toString());
                          if (emailValid)
                            return null;
                          else
                            return 'email không hợp lệ!';
                        },
                        textAlignVertical: TextAlignVertical.center,
                        controller: email,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
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
                        border:
                            Border.all(width: 1.0, color: Color(0xffededed))),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length <= 6)
                            return 'Mật khẩu phải có ít nhất 6 kí tự!';
                          return null;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
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
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                      child: Text(
                    message,
                    style: TextStyle(color: Colors.red),
                  )),
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
                                    borderRadius: BorderRadius.circular(4)),
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
                            )),
                        Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 22.5,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 0,
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLogIn = true;
                          });
                          final provider =
                              Provider.of<UserAuthen>(context, listen: false);
                          String respondMessage =
                              await provider.signInWithEmailPassword(
                                  email.text, password.text);
                          if (respondMessage != '')
                            setState(() {
                              isLogIn = false;
                              message = respondMessage;
                            });
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text(respondMessage),
                          // ));

                          // showDialog<String>(
                          //   context: context,
                          //   builder: (BuildContext context) => AlertDialog(
                          //     title: const Text('Lỗi'),
                          //     content: new Text(respondMessage),
                          //     actions: <Widget>[
                          //       // TextButton(
                          //       //   onPressed: () => Navigator.pop(context, 'Cancel'),
                          //       //   child: const Text('Cancel'),
                          //       // ),
                          //       TextButton(
                          //         onPressed: () =>
                          //             Navigator.pop(context, 'OK'),
                          //         child: const Text('OK'),
                          //       ),
                          //     ],
                          //   ),
                          // );
                        }
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
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                SignUpScreen(provider),
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
                      )),
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                        onPressed: () async {
                          provider.signInWithGoogle();
                        },
                        child: Text('Đăng nhập với Google')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
