import 'package:active_ageing_mobile_app/main_screen/wallet_screen/list_wallets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_management.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);
  final Map userSample = {
    'name': 'Loading',
    'photoURL':
        'https://s3-alpha-sig.figma.com/img/a0b4/fd34/2210c5f7a9f72b3e284ed0769b35803a?Expires=1627862400&Signature=VX~evHwLNiL6QRjxX-EWTwDXyOrzkNvleJUZmo3H4VCvBbyigv6MsSlV9ATrdXhLghoWhmgGJeR6KCgO3Qd8Tf3zzzCGSWuwmRx1hdY04DSKk3eZ79mhG76oGuJWu5wQw9xLeljbqaAr8tH1St~hUzfg4QdJPQguJLjI-3UZtTVOCU~CvHgPT1POU6iYsrnesWmfQHXH71cQXQ19ggC5z01CYszg9lfHquhw4to-RRaOiY0oMvlCXjYGGVNC0YKR6qriBh1kFdSJ1U42SkjDiYkzGDDBzAEexCiyzBgRri8AxR8QYaQBV9Y7IDDnXLd4PLwOM6~k12bY6K1vegML4w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    'email': 'Loading',
  };
  @override
  Widget build(BuildContext context) {
    final docSnap = Provider.of<DocumentSnapshot?>(context);
    final user = docSnap != null ? docSnap.data() : userSample;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      width: double.infinity - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallet',
            style: TextStyle(fontSize: 30),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Image.network(
                  user['photoURL'],
                  width: 50,
                  height: 50,
                ),
                Text(user['name']),
                Text(user['email']),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              StreamProvider<DocumentSnapshot?>(
                            create: (context) => FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser.uid)
                                .snapshots(),
                            initialData: null,
                            builder: (context, child) => AccountManagement(),
                          ),
                        ),
                      );
                    },
                    child: Text('Quản lí tài khoản'))
              ],
            ),
          ),
          InkWell(
            // borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListWallet()));
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ví của bạn',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Xem danh dách ví của bạn'),
                ],
              ),
            ),
          ),
          InkWell(
            // borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: () {},
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xem báo cáo',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Báo cáo về giao dịch, tiết kiệm, đầu tư'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
