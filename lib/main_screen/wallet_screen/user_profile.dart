import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final Map userSample = {
    'name': '',
    'photoURL':
        'https://s3-alpha-sig.figma.com/img/a0b4/fd34/2210c5f7a9f72b3e284ed0769b35803a?Expires=1627862400&Signature=VX~evHwLNiL6QRjxX-EWTwDXyOrzkNvleJUZmo3H4VCvBbyigv6MsSlV9ATrdXhLghoWhmgGJeR6KCgO3Qd8Tf3zzzCGSWuwmRx1hdY04DSKk3eZ79mhG76oGuJWu5wQw9xLeljbqaAr8tH1St~hUzfg4QdJPQguJLjI-3UZtTVOCU~CvHgPT1POU6iYsrnesWmfQHXH71cQXQ19ggC5z01CYszg9lfHquhw4to-RRaOiY0oMvlCXjYGGVNC0YKR6qriBh1kFdSJ1U42SkjDiYkzGDDBzAEexCiyzBgRri8AxR8QYaQBV9Y7IDDnXLd4PLwOM6~k12bY6K1vegML4w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    'email': '',
    'address': '',
  };
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController job;
  late TextEditingController phone;
  Map<String, dynamic> newUserInfor() {
    return {
      'name': name.text,
      'email': email.text,
      'address': address.text,
      'job': job.text,
      'phone': phone.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final docSnap = Provider.of<DocumentSnapshot?>(context);
    final user = docSnap != null ? docSnap.data() : userSample;
    name = TextEditingController(text: user['name']);
    email = TextEditingController(text: user['email']);
    address = TextEditingController(text: user['address']);
    job = TextEditingController(text: user['job']);
    phone = TextEditingController(text: user['phone']);

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
          title: Text("Thông tin cá nhân")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 187.5 * 8),
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border:
                    Border.all(width: 1.0, color: Color(0xffededed))),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Tên",
                    hintStyle:
                    TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffdedede),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff1a1a1a),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  controller: name,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 5,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 187.5 * 8),
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border:
                    Border.all(width: 1.0, color: Color(0xffededed))),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Email",
                    hintStyle:
                    TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffdedede),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff1a1a1a),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  controller: email,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 5,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 187.5 * 8),
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border:
                    Border.all(width: 1.0, color: Color(0xffededed))),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Nơi ở",
                    hintStyle:
                    TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffdedede),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff1a1a1a),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  controller: address,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 5,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 187.5 * 8),
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border:
                    Border.all(width: 1.0, color: Color(0xffededed))),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Nghề nghiệp",
                    hintStyle:
                    TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffdedede),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff1a1a1a),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),

                  controller: job,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 5,
                height: MediaQuery.of(context).size.height / 333.5 * 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 187.5 * 8),
                decoration: new BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border:
                    Border.all(width: 1.0, color: Color(0xffededed))),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Số điện thoại",
                    hintStyle:
                    TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffdedede),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff1a1a1a),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  controller: phone,

                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 5,
                height: MediaQuery.of(context).size.height / 333.5 * 70,
              ),

              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                decoration: BoxDecoration(
                  color: Color(0xff12b281),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ElevatedButton(
                    onPressed: () {
                      UserDatabase().updateUserData(newUserInfor()).then((value) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text('LƯU THÔNG TIN',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xffffffff),
                        fontSize: 15 * curScaleFactor,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
