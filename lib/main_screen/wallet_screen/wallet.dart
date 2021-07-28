import 'package:flutter/material.dart';

import 'wallet_edit.dart';

class Wallet extends StatelessWidget {
  const Wallet(this.wallet, this.deleteWallet, {Key? key}) : super(key: key);
  final Map wallet;
  final Function deleteWallet;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Column(
      children: [
        InkWell(
          // borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WalletEditScreen(wallet, deleteWallet)));
            },
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffffffff)
              ),                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 8,
                  height: MediaQuery.of(context).size.height / 333.5 * 1,
                ),
                Image.asset("assets/images/wallet_icon.png",width:40,height:40),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 8,
                  height: MediaQuery.of(context).size.height / 333.5 * 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(wallet['name'].toString(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff1a1a1a),
                          fontSize: 14 * curScaleFactor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 2,
                    ),
                    new Text(wallet['money'].toString() + " " + wallet['currency'].toString(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 16 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    )
                  ],
                ),
              ],
            ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 187.5 * 4,
          height: MediaQuery.of(context).size.height / 333.5 * 4,
        ),
      ],
    );

    //   InkWell(
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => WalletEditScreen(wallet, deleteWallet)));
    //   },
    //   child:
    //   Container(
    //     width: double.infinity,
    //     child: Row(
    //       children: [
    //         wallet['type'] == 'cash'
    //             ? Icon(
    //                 Icons.money,
    //                 color: Color(0xff12B281),
    //               )
    //             : Icon(Icons.savings, color: Color(0xff12B281)),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(wallet['name'].toString()),
    //             Text(wallet['money'].toString() +
    //                 " " +
    //                 wallet['currency'].toString())
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    //
    // );
  }
}
