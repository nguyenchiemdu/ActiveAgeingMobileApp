import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Email'),
              TextField(
                controller: email,
              ),
              Text('Password'),
              TextField(
                controller: password,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  //print('ok');
                  UserAuthen()
                      .signInWithEmailPassword(email.text, password.text);
                },
                child: Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
