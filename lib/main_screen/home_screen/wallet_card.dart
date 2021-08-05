import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletCard extends StatefulWidget {
  const WalletCard(this.wallet, {Key? key}) : super(key: key);
  final Map wallet;

  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  bool isVisibility = true;
  NumberFormat formatter = NumberFormat('###,###,###,##0.#');
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: MediaQuery.of(context).size.width / 187.5 * 171.5,
      height: MediaQuery.of(context).size.height / 333.5 * 52,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(widget.wallet['name'],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: 16 * curScaleFactor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        isVisibility = !isVisibility;
                      });
                    },
                    child: Row(
                      children: [
                        new Text('Ẩn số dư',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 4,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 0,
                        ),
                        isVisibility
                            ? Icon(
                                Icons.visibility,
                                color: Color(0xff666666),
                                size: 16,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Color(0xff666666),
                                size: 16,
                              ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
              child: isVisibility
                  ? new Text(
                      formatter.format(widget.wallet['money']) +
                          ' ' +
                          widget.wallet['currency'],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 24 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                  : new Text(
                      List.generate(widget.wallet['money'].toString().length,
                              (_) => '*').join(' ') +
                          ' ' +
                          widget.wallet['currency'],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 24 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )))
        ],
      ),
    );
  }
}
