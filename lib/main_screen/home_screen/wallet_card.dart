import 'package:flutter/material.dart';

class WalletCard extends StatefulWidget {
  const WalletCard(this.wallet, {Key? key}) : super(key: key);
  final Map wallet;

  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.wallet['name']),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        isVisibility = !isVisibility;
                      });
                    },
                    child: Row(
                      children: [
                        Text('Ẩn số dư '),
                        isVisibility
                            ? Icon(
                                Icons.visibility,
                              )
                            : Icon(
                                Icons.visibility_off,
                              ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            child: isVisibility
                ? Text(widget.wallet['money'] + ' ' + widget.wallet['currency'])
                : Text(List.generate(widget.wallet['money'].toString().length,
                        (_) => '*').join(' ') +
                    ' ' +
                    widget.wallet['currency']),
          )
        ],
      ),
    );
  }
}
