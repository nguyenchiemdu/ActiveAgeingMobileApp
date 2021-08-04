import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'select_currency_unit.dart';

class CreateWallet extends StatefulWidget {
  final Function addWallet;
  final String type;
  const CreateWallet(this.addWallet, this.type, {Key? key}) : super(key: key);

  @override
  _CreateWalletState createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  String currency = 'VND';
  var _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController money = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    Function updateCurrency = (String newCurrency) {
      setState(() {
        currency = newCurrency;
      });
    };
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
          title: Text("Tạo ví mới")),
      body: Container(
          child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  child: TextFormField(
                      controller: name,
                      validator: (name) {
                        if (name == "") {
                          return 'Vui lòng điền tiền ví!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Tên Ví',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0xff12b281),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0xffededed),
                            width: 1.0,
                          ),
                        ),
                      ))),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              InkWell(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Provider(
                              create: (context) => updateCurrency,
                              builder: (context, child) =>
                                  SelectCurrencyUnit())));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffffffff)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 8,
                        height: MediaQuery.of(context).size.height / 333.5 * 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text("Đơn vị tiền tệ",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                          Container(
                            width:
                                MediaQuery.of(context).size.width / 187.5 * 8,
                            height:
                                MediaQuery.of(context).size.height / 333.5 * 2,
                          ),
                          new Text(currency,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff999999),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 89,
                        height: MediaQuery.of(context).size.height / 333.5 * 1,
                      ),
                      Image.asset("assets/images/next_icon.png",
                          width: 40, height: 40),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 89,
                height: MediaQuery.of(context).size.height / 333.5 * 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                height: MediaQuery.of(context).size.height / 333.5 * 55,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 89,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                      child: Text('Số tiền hiện có',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff999999),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 89,
                      height: MediaQuery.of(context).size.height / 333.5 * 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                      height: MediaQuery.of(context).size.height / 333.5 * 24,
                      child: TextFormField(
                          controller: money,
                          validator: (money) {
                            if (double.tryParse(money.toString()) == null) {
                              return 'Số tiền không hợp lệ!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Color(0xff12b281),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Color(0xffededed),
                                width: 1.0,
                              ),
                            ),
                          )),
                    )
                  ],
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var wallet = {
                              'name': name.text,
                              'type': widget.type,
                              'currency': currency,
                              'money': double.parse(money.text)
                            };
                            Map<String, dynamic> historyData = {};
                            historyData.addAll(wallet);
                            String id = await UserDatabase()
                                .createWalletsHistory(historyData);
                            wallet['id'] = id;
                            print(wallet);
                            widget.addWallet(wallet);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Tạo ví'.toUpperCase())),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
