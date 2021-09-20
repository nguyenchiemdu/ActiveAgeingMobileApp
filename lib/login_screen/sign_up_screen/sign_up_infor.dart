import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpInforScreen extends StatelessWidget {
  SignUpInforScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController(
      text: FirebaseAuth.instance.currentUser.displayName != null
          ? FirebaseAuth.instance.currentUser.displayName
          : '');
  final TextEditingController address = TextEditingController();
  final TextEditingController job = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 4,
                height:
                MediaQuery.of(context).size.height / 333.5 * 24,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  child: new Text("Thông tin cá nhân",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff1a1a1a),
                        fontSize: 18 * curScaleFactor,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      )),
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
                      border: Border.all(width: 1.0, color: Color(0xff98E8CB))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: name,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
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
                      border: Border.all(width: 1.0, color: Color(0xff98E8CB))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: address,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        hintText: "Nơi ở hiện tại",
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
                      border: Border.all(width: 1.0, color: Color(0xff98E8CB))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: job,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        hintText: "Nghề nghiệp",
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
                      border: Border.all(width: 1.0, color: Color(0xff98E8CB))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: phone,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        hintText: "Số điện thoại",
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
                height: MediaQuery.of(context).size.height / 333.5 * 65,
              ),

              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(12 * curScaleFactor),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> data = {
                        'email': FirebaseAuth.instance.currentUser.email,
                        'name': name.text,
                        'address': address.text,
                        'job': job.text,
                        'phone': phone.text,
                        'photoURL':
                            "https://firebasestorage.googleapis.com/v0/b/activeageingvietnam.appspot.com/o/avatar.png?alt=media&token=b03c337e-da36-4182-8b99-81d92a39972c"
                      };
                      UserDatabase().firstUploadUserData(data);
                    },
                    child: Text('HOÀN THÀNH')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
