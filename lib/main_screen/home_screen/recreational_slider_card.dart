import 'package:active_ageing_mobile_app/main_screen/home_screen/social_activity_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'wallet_card.dart';

class RecreationalActivitySliderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 333.5 * 155.5,
      child: Center(
          child: CarouselSlider.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index, realIdx) =>
                  Container(
                    child: SocialActivityCard(),
                  ),
              options: CarouselOptions(
                autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 300),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: false,
                // viewportFraction: 0.65,
                viewportFraction: 0.8,
                aspectRatio: (MediaQuery.of(context).size.height / 333.5 * 155.5)/(MediaQuery.of(context).size.width / 187.5 * 168),
                scrollDirection: Axis.horizontal,
                // enlargeCenterPage: true
              ))),
    );
  }
}
