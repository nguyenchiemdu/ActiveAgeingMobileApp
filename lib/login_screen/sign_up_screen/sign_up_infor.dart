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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: 'Họ và tên'),
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(hintText: 'Nơi ở hiện tại'),
            ),
            TextField(
              controller: job,
              decoration: InputDecoration(hintText: 'Nghề nghiệp'),
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(hintText: 'Số điện thoại'),
            ),
            ElevatedButton(
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
                child: Text('ok'))
          ],
        ),
      ),
    );
  }
}
