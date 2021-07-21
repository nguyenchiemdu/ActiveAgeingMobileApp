import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>(
            create: (context) => FirebaseAuth.instance.authStateChanges(),
            initialData: null)
      ],
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'sign up',
              style: TextStyle(fontSize: 30),
            ),
            Text('name'),
            TextField(
              controller: name,
            ),
            Text('email'),
            TextField(
              controller: email,
            ),
            Text('password'),
            TextField(
              controller: password,
            ),
            ElevatedButton(
                onPressed: () {
                  UserAuthen().createUser(
                      email.text, password.text, name.text, context);
                },
                child: Text('Sign Up')),
            ElevatedButton(
              onPressed: () {
                //print('ok');
                UserAuthen().signOut();
              },
              child: Text('log out'),
            ),
            Consumer<User?>(
                builder: (context, user, child) => Text(user.toString())),
          ],
        ),
      ),
    );
  }
}
