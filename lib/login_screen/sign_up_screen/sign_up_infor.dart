import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpInforScreen extends StatelessWidget {
  SignUpInforScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController job = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        "https://s3-alpha-sig.figma.com/img/a0b4/fd34/2210c5f7a9f72b3e284ed0769b35803a?Expires=1627862400&Signature=VX~evHwLNiL6QRjxX-EWTwDXyOrzkNvleJUZmo3H4VCvBbyigv6MsSlV9ATrdXhLghoWhmgGJeR6KCgO3Qd8Tf3zzzCGSWuwmRx1hdY04DSKk3eZ79mhG76oGuJWu5wQw9xLeljbqaAr8tH1St~hUzfg4QdJPQguJLjI-3UZtTVOCU~CvHgPT1POU6iYsrnesWmfQHXH71cQXQ19ggC5z01CYszg9lfHquhw4to-RRaOiY0oMvlCXjYGGVNC0YKR6qriBh1kFdSJ1U42SkjDiYkzGDDBzAEexCiyzBgRri8AxR8QYaQBV9Y7IDDnXLd4PLwOM6~k12bY6K1vegML4w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"
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
