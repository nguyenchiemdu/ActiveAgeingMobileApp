// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

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

  Future<String> createWalletsHistory(Map<String, dynamic> data) async {
    data['listHistory'] = [
      {
        'time': int.parse(DateFormat('yyyyMMdd').format(DateTime.now())),
        'money': data['money']
      }
    ];
    data.remove('money');
    print(data);
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/historyWallets';
    String result =
        await firestore.collection(path).add(data).then((value) => value.id);
    return result;
  }

  Future<bool> updateHistoryWallets(
      String historyWalletId, Map<String, dynamic> data) async {
    bool result = true;
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/historyWallets';
    firestore
        .collection(path)
        .doc(historyWalletId)
        .update(data)
        .catchError((error) {
      result = false;
    });
    return result;
  }

  Future deleteHistoryWallet(String historyWalletId) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/historyWallets';
    firestore.collection(path).doc(historyWalletId).delete();
  }

  Future deleteTransactions(String nameWallet) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/listTransactions';
    firestore
        .collection(path)
        .where('nameWallet', isEqualTo: nameWallet)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  Future<bool> addTransaction(Map<String, dynamic> transaction) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/listTransactions';
    try {
      await firestore.collection(path).add(transaction);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future updateTransaction() async {}
}
