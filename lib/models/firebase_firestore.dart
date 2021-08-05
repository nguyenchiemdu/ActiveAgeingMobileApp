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

  Future deleteTransactions(String idWallet) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/listTransactions';
    firestore
        .collection(path)
        .where('idWallet', isEqualTo: idWallet)
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

  addToHistory(
    DateTime time,
    String historyWalletId,
    String money,
    String method,
  ) async {
    int key = int.parse(DateFormat('yyyyMMdd').format(time));
    // List listHistoryWallets = widget.listHistoryWallets;
    // int index = listHistoryWallets.indexWhere(
    //     (historyWallet) => historyWallet['name'] == selectedNameWallet);
    // if (listHistoryWallets[index]['listHistory'] == null) {
    //   listHistoryWallets[index]['listHistory'] = [];
    // }
    String uid = FirebaseAuth.instance.currentUser.uid;
    String path = 'users/' + uid + '/historyWallets';
    Map historyWallet = await firestore
        .collection(path)
        .doc(historyWalletId)
        .get()
        .then((docSnap) => docSnap.data());
    List listHistory = historyWallet['listHistory'];
    if (listHistory.indexWhere((history) => history['time'] == key) < 0) {
      int index = listHistory.indexWhere((history) => history['time'] > key);
      double startMoney;
      if (index <= 0)
        startMoney = 0;
      else
        startMoney = listHistory[index - 1]['money'];
      if (index == -1) {
        listHistory.add({'time': key, 'money': startMoney});
      } else {
        int date = minus1Day(listHistory[index]['time']);
        while (!containDateInList(date, listHistory) && date >= key) {
          Map newHistory = {};
          newHistory['time'] = date;
          newHistory['money'] = startMoney;
          listHistory.insert(index, newHistory);
          date = minus1Day(date);
        }
      }
    }

    listHistory = listHistory.map((history) {
      if (history['time'] >= key) {
        if (method == '-')
          history['money'] -= double.parse(money);
        else
          history['money'] += double.parse(money);
        return history;
      }
      return history;
    }).toList();
    updateHistoryWallets(historyWalletId, {'listHistory': listHistory});
  }

  int minus1Day(int time) {
    int year = int.parse(time.toString().substring(0, 4));
    int month = int.parse(time.toString().substring(4, 6));
    int day = int.parse(time.toString().substring(6));
    DateTime date = DateTime(year, month, day);
    date = date.subtract(Duration(days: 1));
    return int.parse(DateFormat('yyyyMMdd').format(date));
  }

  bool containDateInList(int date, List listHistory) {
    int index = listHistory.indexWhere((history) => history['time'] == date);
    if (index >= 0) return true;
    return false;
  }
}
