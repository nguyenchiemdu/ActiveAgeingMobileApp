import 'package:flutter/material.dart';

import 'create_wallet.dart';

class BottomChooseWallet extends StatelessWidget {
  final Function addWallet;
  BottomChooseWallet(this.addWallet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 333.5 * 120,      //color: Colors.red,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1.5,
            height: MediaQuery.of(context).size.height / 333.5 * 8,
          ),
          new Text("Tạo ví mới",
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xff1a1a1a),
                fontSize: 16 * curScaleFactor,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1.5,
            height: MediaQuery.of(context).size.height / 333.5 * 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            child: Center(
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
                      width: MediaQuery.of(context).size.width / 187.5 * 80,
                      height: MediaQuery.of(context).size.height / 333.5 * 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffededed),width: 1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 187.5 * 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/cash_icon.png", width: 50, height: 50),
                          Container(
                            width: MediaQuery.of(context).size.width / 187.5 * 8,
                            height: MediaQuery.of(context).size.height / 333.5 * 8,
                          ),
                          Text(
                            'Ví thông thường',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff00865D),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 187.5 * 1.5,
                            height: MediaQuery.of(context).size.height / 333.5 * 4,
                          ),
                          Text('Ghi chép giao dịch thực tế của bạn',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 8,
                    height: MediaQuery.of(context).size.height / 333.5 * 4,
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
                      width: MediaQuery.of(context).size.width / 187.5 * 80,
                      height: MediaQuery.of(context).size.height / 333.5 * 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffededed),width: 1),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 187.5 * 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/pig_icon.png", width: 50, height: 50),
                          Container(
                            width: MediaQuery.of(context).size.width / 187.5 * 8,
                            height: MediaQuery.of(context).size.height / 333.5 * 8,
                          ),
                          Text(
                              'Ví tiết kiệm',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff00865D),
                                fontSize: 14 * curScaleFactor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 187.5 * 1.5,
                            height: MediaQuery.of(context).size.height / 333.5 * 4,
                          ),
                          Text('Ghi chép các khoản tiết kiệm mục tiêu',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff666666),
                                fontSize: 12 * curScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
