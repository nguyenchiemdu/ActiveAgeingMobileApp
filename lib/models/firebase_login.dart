// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

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

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
