import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletEditScreen extends StatefulWidget {
  const WalletEditScreen(this.wallet, this.deleteWallet, this.editWallet,
      {Key? key})
      : super(key: key);
  final wallet;
  final Function deleteWallet;
  final Function editWallet;
  @override
  _WalletEditScreenState createState() => _WalletEditScreenState();
}

class _WalletEditScreenState extends State<WalletEditScreen> {
  @override
  initState() {
    name = TextEditingController(text: widget.wallet['name']);
    money = TextEditingController(text: widget.wallet['money'].toString());
    currency = TextEditingController(text: widget.wallet['currency']);
    super.initState();
  }

  bool _status = false;
  late TextEditingController name;
  late TextEditingController money;
  late TextEditingController currency;
  final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: Container(
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
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            widget.wallet['type'] == 'cash'
                                ? Image.asset("assets/images/cash_icon.png",
                                    width: 30, height: 30)
                                : Image.asset("assets/images/pig_icon.png",
                                    width: 30, height: 30),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 8,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            Flexible(
                              child: TextFormField(
                                  validator: (value) {
                                    if (value.toString().length == 0)
                                      return 'Trường này k được phép trống';
                                    return null;
                                  },
                                  controller: name,
                                  enabled: _status,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.transparent)),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff1a1a1a),
                                    fontSize: 20 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            )
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height:
                            MediaQuery.of(context).size.height / 333.5 * 0.8,
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
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            Image.asset("assets/images/amount_icon.png",
                                width: 30, height: 30),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 8,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            Flexible(
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (double.tryParse(value.toString()) ==
                                        null) return 'Dữ liệu k hợp lệ';
                                    return null;
                                  },
                                  controller: money,
                                  enabled: _status,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.transparent)),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff1a1a1a),
                                    fontSize: 14 * curScaleFactor,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            )
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height:
                            MediaQuery.of(context).size.height / 333.5 * 0.8,
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
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            Image.asset("assets/images/currency_icon.png",
                                width: 30, height: 30),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 8,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  1,
                            ),
                            // Text(wallet['currency'],
                            //     style: TextStyle(
                            //       fontFamily: 'Inter',
                            //       color: Color(0xff1a1a1a),
                            //       fontSize: 14 * curScaleFactor,
                            //       fontWeight: FontWeight.w400,
                            //       fontStyle: FontStyle.normal,
                            //     )),
                            Flexible(
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString().length == 0)
                                    return 'Trường này k được phép trống';
                                  return null;
                                },
                                controller: currency,
                                // initialValue: widget.wallet['currency'],
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff1a1a1a),
                                  fontSize: 14 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                enabled: _status,
                                decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.transparent)),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 8,
                height: MediaQuery.of(context).size.height / 333.5 * 13,
              ),
              GestureDetector(
                onTap: () {
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
                                    widget.deleteWallet(widget.wallet);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes')),
                            ],
                          ));
                },
                child: Text("XÓA VÍ",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xffff2d2d),
                      fontSize: 14 * curScaleFactor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
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
                          // print(name.text + money.text + currency.text);
                          if (!_status)
                            setState(() {
                              _status = !_status;
                            });
                          else if (_formKey.currentState!.validate()) {
                            print(money.text);
                            Map newWallet = new Map.from(widget.wallet);
                            newWallet['name'] = name.text;
                            newWallet['money'] = double.parse(money.text);
                            newWallet['currency'] = currency.text;
                            widget.editWallet(widget.wallet, newWallet);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(_status ? "Lưu" : 'SỬA'.toUpperCase())),
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
