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
    final docSnap = Provider.of<DocumentSnapshot?>(context);
    final user = docSnap != null ? docSnap.data() : userSample;
    name = TextEditingController(text: user['name']);
    email = TextEditingController(text: user['email']);
    address = TextEditingController(text: user['address']);
    job = TextEditingController(text: user['job']);
    phone = TextEditingController(text: user['phone']);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              controller: name,
            ),
            TextField(
              controller: email,
            ),
            TextField(
              controller: address,
            ),
            TextField(
              controller: job,
            ),
            TextField(
              controller: phone,
            ),
            ElevatedButton(
                onPressed: () {
                  UserDatabase().updateUserData(newUserInfor()).then((value) {
                    Navigator.pop(context);
                  });
                },
                child: Text('Lưu thông tin')),
          ],
        ),
      ),
    );
  }
}
