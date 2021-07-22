import 'package:flutter/material.dart';
import 'wallet.dart';

class ListWallet extends StatelessWidget {
  const ListWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [Wallet('Cash', 10000), Wallet('Saving', 140000)],
        ),
      ),
    );
  }
}
