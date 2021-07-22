import 'package:flutter/material.dart';

import 'create_wallet.dart';

class BottomChooseWallet extends StatelessWidget {
  final Function addWallet;
  BottomChooseWallet(this.addWallet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      //color: Colors.red,
      child: Column(
        children: [
          Text(
            'Tạo ví mới',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CreateWallet(addWallet, 'cash')));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ví thông thường',
                          style: TextStyle(color: Color(0xff006A4A)),
                        ),
                        Text('Ghi chép giao dịch thực tế của bạn')
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CreateWallet(addWallet, 'saving')));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ví tiết kiệm',
                          style: TextStyle(color: Color(0xff006A4A)),
                        ),
                        Text('Ghi chép các khoản tiết kiệm mục tiêu')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
