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
    Function updateCurrency = (String newCurrency) {
      setState(() {
        currency = newCurrency;
      });
    };
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextFormField(
                    controller: name,
                    validator: (name) {
                      if (name == "") {
                        return 'tên ví k được trống!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Tên Ví'),
                  ),
                ),
                InkWell(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Đơn vị tiền tệ'), Text(currency)],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Số tiền hiện có'),
                      TextFormField(
                        controller: money,
                        validator: (money) {
                          if (double.tryParse(money.toString()) == null) {
                            return 'Số tiền k hợp lệ';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var wallet = {
                          'name': name.text,
                          'type': widget.type,
                          'currency': currency,
                          'money': money.text
                        };
                        widget.addWallet(wallet);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Tạo ví'))
              ],
            ),
          )),
    );
  }
}
