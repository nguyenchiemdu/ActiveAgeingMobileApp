import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTransactionItem extends StatelessWidget {
  const ListTransactionItem(this.condition, {Key? key}) : super(key: key);
  final String condition;
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    Stream<QuerySnapshot?> snap = FirebaseFirestore.instance
        .collection('users/' + uid + '/listTransactions')
        .where('typeWallet', isEqualTo: condition)
        .snapshots();
    return StreamProvider<QuerySnapshot?>(
      create: (context) => snap,
      initialData: null,
      child: Container(
        child: Consumer<QuerySnapshot?>(
          builder: (context, querySnapshot, child) {
            print(condition + "da toi day");
            if (querySnapshot != null) {
              querySnapshot.docs.forEach((element) {
                print(element.data());
              });
            }
            return child!;
          },
          child: Column(
            children: [Text('ahihi')],
          ),
        ),
      ),
    );
  }
}
