import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletEditScreen extends StatelessWidget {
  const WalletEditScreen(this.wallet, this.deleteWallet, {Key? key})
      : super(key: key);
  final wallet;
  final Function deleteWallet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          wallet['type'] == 'cash'
                              ? Icon(Icons.money, color: Color(0xff12B281))
                              : Icon(Icons.savings, color: Color(0xff12B281)),
                          Text(wallet['name'])
                        ],
                      )),
                  Container(
                      child: Row(
                    children: [
                      Icon(Icons.toll, color: Color(0xff12B281)),
                      Text(wallet['money'])
                    ],
                  )),
                  Container(
                      child: Row(
                    children: [
                      Icon(Icons.attach_money, color: Color(0xff12B281)),
                      Text(wallet['currency'])
                    ],
                  ))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              'Warning',
                              style: TextStyle(color: Colors.red),
                            ),
                            content: Text(
                                "Are you sure you want to delete this wallet?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                              TextButton(
                                  onPressed: () {
                                    deleteWallet(wallet);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes')),
                            ],
                          ));
                },
                child: Text('Xoá ví')),
          ],
        ),
      ),
    );
  }
}
