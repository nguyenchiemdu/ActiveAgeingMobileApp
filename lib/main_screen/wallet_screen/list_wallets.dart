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
    listWalletWidget = widget.listWallet
        .map((wallet) => Wallet(wallet, deleteWallet))
        .toList();
  }

  addWallet(Map wallet) async {
    var tmp = listWallet;
    tmp.add(wallet);
    update(tmp);
  }

  deleteWallet(Map wallet) {
    var tmp = listWallet;
    tmp.remove(wallet);
    update(tmp);
  }

  update(List tmp) async {
    var data = {'listWallet': tmp};
    await UserDatabase().updateUserData(data);
    setState(() {
      listWallet = tmp;
      listWalletWidget =
          tmp.map((wallet) => Wallet(wallet, deleteWallet)).toList();
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
