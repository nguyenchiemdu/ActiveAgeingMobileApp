import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'wallet_card.dart';

class WalletSliderCard extends StatelessWidget {
  WalletSliderCard(this.listWallet, {Key? key}) : super(key: key);
  final List listWallet;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Center(
          child: listWallet.length == 0
              ? Container(
            width: MediaQuery.of(context).size.width / 187.5 * 171.5,
            height: MediaQuery.of(context).size.height / 333.5 * 45,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xff12b281), width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Text("Bạn chưa tạo ví!",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 16 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1.0, color: Color(0xff12b281)),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              new Text('TẠO VÍ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff12b281),
                                    fontSize: 14 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width / 187.5 * 4,
                                height:
                                MediaQuery.of(context).size.height / 333.5 * 0,
                              ),
                              Icon(
                                Icons.add,
                                color: Color(0xff12b281),
                                size: 16,
                              )

                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                    child: new Text(
                       "Tạo ví ngay để quản lý chi tiêu.",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff999999),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                        )
              ],
            ),
          )
              : CarouselSlider.builder(
                  itemCount: listWallet.length,
                  itemBuilder: (BuildContext context, int index, realIdx) =>
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: WalletCard(listWallet[index]),
                      ),
                  options: CarouselOptions(
                    autoPlay: true,
                    // autoPlayInterval: Duration(seconds: 3),
                    // autoPlayAnimationDuration: Duration(milliseconds: 300),
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    // enlargeCenterPage: false,
                    // viewportFraction: 0.65,
                    viewportFraction: 0.95,
                    aspectRatio: 3.5,
                    scrollDirection: Axis.horizontal,
                    // enlargeCenterPage: true
                  ))),
    );
  }
}
