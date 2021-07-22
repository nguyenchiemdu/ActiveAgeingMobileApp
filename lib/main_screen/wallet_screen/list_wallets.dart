import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'bottom_choose_wallet.dart';
import 'wallet.dart';

class ListWallet extends StatefulWidget {
  ListWallet(this.listWallet, {Key? key}) : super(key: key);
  final List listWallet;
  @override
  _ListWalletState createState() => _ListWalletState();
}

class _ListWalletState extends State<ListWallet> {
  @override
  initState() {
    super.initState();
    listWallet = widget.listWallet;
    listWalletWidget =
        widget.listWallet.map((wallet) => Wallet(wallet)).toList();
  }

  addWallet(Map wallet) async {
    var tmp = listWallet;
    tmp.add(wallet);
    var data = {'listWallet': tmp};
    await UserDatabase().updateUserData(data);
    setState(() {
      listWallet = tmp;
      listWalletWidget = tmp.map((wallet) => Wallet(wallet)).toList();
    });
  }

  List listWallet = [];
  List<Widget> listWalletWidget = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              child: Column(
                children: listWalletWidget,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomChooseWallet(addWallet));
                },
                child: Text('Tạo ví mới'.toUpperCase()))
          ],
        ),
      ),
    );
  }
}
