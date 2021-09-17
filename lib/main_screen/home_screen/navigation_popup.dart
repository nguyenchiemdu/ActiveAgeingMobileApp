import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'money_management/add_transaction_screen.dart';
import 'money_management/money_management.dart';

class NavigationPopUp extends StatelessWidget {
  const NavigationPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot? docsnap = Provider.of<DocumentSnapshot?>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 98),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff12B281),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 238,
          height: 108,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('tapped');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoneyManagementScreen(
                              docsnap!.data()['listWallet'], true, 1)));

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransactionScreen(docsnap.data()['listWallet'])))
                },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 23, bottom: 12, left: 16, right: 16),
                  height: double.infinity,
                  width: 118,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Image.asset(
                          "assets/images/bill.png",
                          width: 20,
                          height: 18,
                        ),
                      ),
                      Text(
                        'Ghi chép chi tiêu',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 48,
                color: Color(0xff5CCEA4),
              ),
              InkWell(
                onTap: () {
                  print('tapped');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoneyManagementScreen(
                              docsnap!.data()['listWallet'], false, 1)));

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransactionScreen(docsnap.data()['listWallet'])))
                },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 23, bottom: 12, left: 16, right: 16),
                  height: double.infinity,
                  width: 118,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Image.asset(
                          "assets/images/money.png",
                          width: 20,
                          height: 18,
                        ),
                      ),
                      Text(
                        'Nhật kí tiết kiệm',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
