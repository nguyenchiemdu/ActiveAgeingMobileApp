import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'wallet_card.dart';

class WalletSliderCard extends StatelessWidget {
  WalletSliderCard(this.listWallet, {Key? key}) : super(key: key);
  final List listWallet;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Center(
          child: listWallet.length == 0
              ? Text('You have no wallet')
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
