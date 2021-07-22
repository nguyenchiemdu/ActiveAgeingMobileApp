import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final Function updateVerifyEmail;
  LoginScreen(this.updateVerifyEmail, {Key? key}) : super(key: key);
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
                      .signInWithEmailPassword(email.text, password.text)
                      .then((value) {
                    if (value == true)
                      updateVerifyEmail(
                          FirebaseAuth.instance.currentUser.emailVerified);
                  });
                },
                child: Text('Log in'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await UserAuthen().signInWithGoogle();
                  },
                  child: Text('Sign in with Google')),
              InkWell(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SignUpScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
