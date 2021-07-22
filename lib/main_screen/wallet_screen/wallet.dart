import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet(this.name, this.number, {Key? key}) : super(key: key);
  final name;
  final number;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text(name.toString()), Text(number.toString())],
      ),
    );
  }
}
