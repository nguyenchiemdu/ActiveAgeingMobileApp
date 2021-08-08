// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthen extends ChangeNotifier {
  late bool _isSigningIn;
  late bool _isUserEmailVerified;
  UserAuthen() {
    _isSigningIn = false;
    User user = FirebaseAuth.instance.currentUser;
    if (user == null)
      _isUserEmailVerified = false;
    else {
      if (user.providerData[0].providerId == 'google.com')
        _isUserEmailVerified = true;
      else {
        _isUserEmailVerified = user.emailVerified;
      }
    }
  }
  bool get isSigningIn => _isSigningIn;
  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  bool get isUserEmailVerified => _isUserEmailVerified;
  set isUserEmailVerified(bool isUserEmailVerified) {
    _isUserEmailVerified = isUserEmailVerified;
    notifyListeners();
  }

  changeEmailVerification(bool newstatus) {
    print('changing Email Verfication status');
    isUserEmailVerified = newstatus;
  }

  String signInMethod() {
    if (FirebaseAuth.instance.currentUser != null)
      return FirebaseAuth.instance.currentUser.providerData[0].providerId;
    return 'notSignIn';
  }

  Future<String> signInWithEmailPassword(String email, String password) async {
    // isSigningIn = true;
    String message = '';

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      changeEmailVerification(userCredential.user.emailVerified);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      message = 'email hoặc mật khẩu không chính xác!';
    }
    print('message:' + message);
    // isSigningIn = false;
    return message;
  }

  Future signInWithGoogle() async {
    isSigningIn = true;

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      changeEmailVerification(true);
    } catch (e) {
      print('Error Sign in with Google :' + e.toString());
    }
    isSigningIn = false;
  }

  Future<String> createUser(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseAuth.instance.currentUser.sendEmailVerification();
        Navigator.pop(context);
      });
      return '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'Mật khẩu quá yếu!';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'Tài khoản cho email này đã tồn tại!';
      }
      return (e.code);
    } catch (e) {
      print(e);
      return (e.toString());
    }
  }

  Future<bool> validateCurentPassword(String password) async {
    User user = FirebaseAuth.instance.currentUser;
    AuthCredential credential =
        EmailAuthProvider.credential(email: user.email, password: password);
    try {
      var authResult = await user.reauthenticateWithCredential(credential);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> updateUserPassword(String password) async {
    String ok = 'true';
    User user = FirebaseAuth.instance.currentUser;
    try {
      await user.updatePassword(password);
    } on FirebaseException catch (e) {
      print(e.toString());
      ok = e.message;
    }
    return ok;
  }

  Future signOut() async {
    isSigningIn = true;
    if (FirebaseAuth.instance.currentUser.providerData[0].providerId ==
        'google.com') await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
    changeEmailVerification(false);
    isSigningIn = false;
  }
}
