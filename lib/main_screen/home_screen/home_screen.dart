import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<DocumentSnapshot?>(builder: (context, docSnap, child) {
            return docSnap == null
                ? Text('loading')
                : Row(
                    children: [
                      Image.network(
                        docSnap.data()['photoURL'],
                        width: 50,
                        height: 50,
                      ),
                      Text('Hello, ' + docSnap.data()['name'])
                    ],
                  );
          }),
        ],
      ),
    );
  }
}
