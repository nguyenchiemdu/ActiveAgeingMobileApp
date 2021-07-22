import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet(this.wallet, {Key? key}) : super(key: key);
  final Map wallet;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                Text(wallet['money'].toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
