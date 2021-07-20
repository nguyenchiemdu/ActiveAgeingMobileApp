// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabase {
  User user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Map> getUserData() async {
    Map userData = {};
    await firestore.collection('users').doc(user.uid).get().then((docSnap) {
      userData = docSnap.data();
    }).onError((error, stackTrace) {
      print('firebase_firestore.dart: ' + error.toString());
    });
    return userData;
  }
}
