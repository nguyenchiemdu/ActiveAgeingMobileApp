// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_firestore.dart';

class UserAuthen {
  Future signInWithEmailPassword(String email, String password) async {
    try {
      // UserCredential userCredential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future createUser(
      String email, String password, String name, BuildContext context) async {
    try {
      //UserCredential userCredential =
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Map<String, dynamic> data = {
          'email': value.user.email,
          'password': password,
          'name': name
        };
        UserDatabase().firstUploadUserData(data);
        FirebaseAuth.instance.currentUser.sendEmailVerification();
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
