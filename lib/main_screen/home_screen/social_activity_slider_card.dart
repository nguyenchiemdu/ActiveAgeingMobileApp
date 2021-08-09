import 'package:active_ageing_mobile_app/login_screen/loading_screen.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/social_activity_card.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'wallet_card.dart';

class SocialActivitySliderCard extends StatefulWidget {
  @override
  _SocialActivitySliderCardState createState() =>
      _SocialActivitySliderCardState();
}

class _SocialActivitySliderCardState extends State<SocialActivitySliderCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>(
      create: (context) =>
          FirebaseFirestore.instance.collection('socialActivities').snapshots(),
      initialData: null,
      child: Consumer<QuerySnapshot?>(
        builder: (context, socialActivitiesSnap, child) => Container(
          height: MediaQuery.of(context).size.height / 333.5 * 155.5,
          child: socialActivitiesSnap != null &&
                  socialActivitiesSnap.docs != null &&
                  socialActivitiesSnap.docs.length > 0
              ? Center(
                  child: CarouselSlider.builder(
                      itemCount: socialActivitiesSnap.docs.length,
                      itemBuilder: (BuildContext context, int index, realIdx) =>
                          Container(
                            child: SocialActivityCard(
                                socialActivitiesSnap.docs[index]),
                          ),
                      options: CarouselOptions(
                        autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 3),
                        // autoPlayAnimationDuration: Duration(milliseconds: 300),
                        // autoPlayCurve: Curves.fastOutSlowIn,
                        // enlargeCenterPage: false,
                        // viewportFraction: 0.65,
                        viewportFraction: 0.8,
                        aspectRatio: (MediaQuery.of(context).size.height /
                                333.5 *
                                155.5) /
                            (MediaQuery.of(context).size.width / 187.5 * 168),
                        scrollDirection: Axis.horizontal,
                        // enlargeCenterPage: true
                      )))
              : buildLoading(),
        ),
      ),
    );
  }
}
