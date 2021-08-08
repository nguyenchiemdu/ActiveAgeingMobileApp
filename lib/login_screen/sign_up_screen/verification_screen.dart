import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatelessWidget {
  final Function cancelTimer;
  VerificationScreen(this.cancelTimer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAuthen = Provider.of<UserAuthen>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hay xac thuc email cho ' +
                  FirebaseAuth.instance.currentUser.email),
              ElevatedButton(
                onPressed: () {
                  cancelTimer();
                  //print('ok');
                  userAuthen.signOut();
                  cancelTimer();
                },
                child: Text('log out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
