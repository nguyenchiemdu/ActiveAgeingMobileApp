import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletEditScreen extends StatelessWidget {
  const WalletEditScreen(this.wallet, this.deleteWallet, {Key? key})
      : super(key: key);
  final wallet;
  final Function deleteWallet;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffecf9f4),
            fontSize: 16 * curScaleFactor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          title: Text("Sửa ví")),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 8,
              height: MediaQuery.of(context).size.height / 333.5 * 24,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 28,
                      color: Color(0xffffffff),
                      child: Row(
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          wallet['type'] == 'cash'
                              ? Image.asset("assets/images/cash_icon.png",
                                  width: 30, height: 30)
                              : Image.asset("assets/images/pig_icon.png",
                                  width: 30, height: 30),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          Text(wallet['name'],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 20 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.8,
                      color: Color(0xffededed)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 28,
                      color: Color(0xffffffff),
                      child: Row(
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          Image.asset("assets/images/amount_icon.png",
                              width: 30, height: 30),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          Text(wallet['money'].toString(),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.8,
                      color: Color(0xffededed)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 28,
                      color: Color(0xffffffff),
                      child: Row(
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          Image.asset("assets/images/currency_icon.png",
                              width: 30, height: 30),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 1,
                          ),
                          Text(wallet['currency'],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 8,
              height: MediaQuery.of(context).size.height / 333.5 * 13,
            ),
            Text("XÓA VÍ",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xffff2d2d),
                  fontSize: 14 * curScaleFactor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                )),
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
                      child: Text('SỬA'.toUpperCase())),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
