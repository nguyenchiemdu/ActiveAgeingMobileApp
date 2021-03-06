import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        .map((wallet) => Wallet(wallet, deleteWallet, editWallet))
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
    UserDatabase().deleteHistoryWallet(wallet['id']);
    UserDatabase().deleteTransactions(wallet['id']);
  }

  editWallet(Map oldWallet, Map newWallet) {
    print(oldWallet);
    print(newWallet);
    print(listWallet);
    var tmp = listWallet;
    int index = tmp.indexOf(oldWallet);
    tmp[index] = newWallet;
    update(tmp);
    Map<String, dynamic> historyWallet = {
      'currency': newWallet['currency'],
      'name': newWallet['name'],
    };
    String money = (newWallet['money'] - oldWallet['money']).toString();
    UserDatabase userDatabase = UserDatabase();
    userDatabase.updateHistoryWallets(oldWallet['id'], historyWallet);
    userDatabase.addToHistory(
        DateTime.now(), oldWallet['id'], newWallet['money'].toString(), '+');
    Map<String, dynamic> transaction = {
      'money': double.parse(money),
      'name': 'Edit Wallet',
      'idWallet': oldWallet['id'],
      'note': " You changed wallet money from " +
          oldWallet['money'].toString() +
          ' to ' +
          newWallet['money'].toString(),
      'time': Timestamp.fromDate(DateTime.now()),
      'typeWallet': newWallet
    };
    userDatabase.addTransaction(transaction);
  }

  update(List tmp) async {
    var data = {'listWallet': tmp};
    await UserDatabase().updateUserData(data);
    setState(() {
      listWallet = tmp;
      listWalletWidget = tmp
          .map((wallet) => Wallet(wallet, deleteWallet, editWallet))
          .toList();
    });
  }

  List listWallet = [];
  List<Widget> listWalletWidget = [];
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffecf9f4),
            fontSize: 14 * curScaleFactor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          title: Text("Danh s??ch v??")),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 4,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Container(
              child: Column(
                children: listWalletWidget,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 333.5 * 16,
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                BottomChooseWallet(addWallet));
                      },
                      child: Text('T???o v?? m???i'.toUpperCase())),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
