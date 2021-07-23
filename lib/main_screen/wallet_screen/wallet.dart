import 'package:flutter/material.dart';

import 'wallet_edit.dart';

class Wallet extends StatelessWidget {
  const Wallet(this.wallet, this.deleteWallet, {Key? key}) : super(key: key);
  final Map wallet;
  final Function deleteWallet;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WalletEditScreen(wallet, deleteWallet)));
      },
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            wallet['type'] == 'cash'
                ? Icon(
                    Icons.money,
                    color: Color(0xff12B281),
                  )
                : Icon(Icons.savings, color: Color(0xff12B281)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wallet['name'].toString()),
                Text(wallet['money'].toString() +
                    " " +
                    wallet['currency'].toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
