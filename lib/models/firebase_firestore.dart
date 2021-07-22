// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabase {
  User user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> getUserData() async {
    print('getting user data');
    Map<String, dynamic> userData = {};
    await firestore.collection('users').doc(user.uid).get().then((docSnap) {
      userData = docSnap.data();
    }).onError((error, stackTrace) {
      print('firebase_firestore.dart: ' + error.toString());
    });
    return userData;
  }

  Future firstUploadUserData(Map<String, dynamic> data) async {
    DocumentSnapshot docSnap =
        await firestore.collection('users').doc(user.uid).get();
    // print(docSnap.data());
    if (docSnap.data() != null)
      firestore.collection('users').doc(user.uid).update(data).then((value) {
        print('firstUploadUserData : Sucsess!');
      }).onError((error, stackTrace) {
        print('firstUploadUserData :' + error.toString());
      });
    else
      firestore.collection('users').doc(user.uid).set(data).then((value) {
        print('firstUploadUserData : Sucsess!');
      }).onError((error, stackTrace) {
        print('firstUploadUserData :' + error.toString());
      });
  }

  Future updateUserData(Map<String, dynamic> data) async {
    firestore.collection('users').doc(user.uid).update(data).then((value) {
      print('updateUserData : Success!');
    });
  }
}
