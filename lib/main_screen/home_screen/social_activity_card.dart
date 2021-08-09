import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SocialActivityCard extends StatelessWidget {
  SocialActivityCard(QueryDocumentSnapshot queryDocumentSnapshot) {
    this.socialActivityData = queryDocumentSnapshot.data();
    this.socialActivityData['id'] = queryDocumentSnapshot.id;
  }
  late Map<String, dynamic> socialActivityData;
  final dateformat = DateFormat('EEE,dd MMM yyyy');
  calculateStatus(double curScaleFactor) {
    String status = '';
    DateTime start = socialActivityData['startTime'].toDate();
    DateTime end = socialActivityData['endTime'].toDate();
    DateTime now = DateTime.now();
    if (now.compareTo(start) >= 0 && now.compareTo(end) <= 0) {
      status = 'ĐANG DIỄN RA';
      return Text(
        status,
        style: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffec5b5b),
          fontSize: 12 * curScaleFactor,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      );
    } else {
      status = dateformat.format(start) + ' - ' + dateformat.format(end);
      return Text(
        status,
        style: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xff00865d),
          fontSize: 12 * curScaleFactor,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      );
    }
  }

  getConcernedPerson() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    int concernedPersons = socialActivityData['listConcernedPersons'] == null
        ? 0
        : socialActivityData['listConcernedPersons'].length;

    if (socialActivityData['listConcernedPersons'] != null &&
        socialActivityData['listConcernedPersons'].contains(uid))
      concernedPersons--;
    return concernedPersons;
  }

  concernStatus() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    if (socialActivityData['listConcernedPersons'] == null) return false;

    return socialActivityData['listConcernedPersons'].contains(uid);
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    Widget status = calculateStatus(curScaleFactor);
    int concernedPerson = getConcernedPerson();
    bool isConcerned = concernStatus();
    return Container(
      width: MediaQuery.of(context).size.width / 187.5 * 138,
      height: MediaQuery.of(context).size.height / 333.5 * 155.5,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            child: Image.network(socialActivityData['imageUrl'],
                width: MediaQuery.of(context).size.width / 187.5 * 138,
                height: MediaQuery.of(context).size.height / 333.5 * 67.5,
                alignment: Alignment.topCenter,
                fit: BoxFit.fill),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1,
            height: MediaQuery.of(context).size.height / 333.5 * 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 130,
            child: status,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1,
            height: MediaQuery.of(context).size.height / 333.5 * 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 130,
            child: new Text(socialActivityData['name'],
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xff1a1a1a),
                  fontSize: 16 * curScaleFactor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1,
            height: MediaQuery.of(context).size.height / 333.5 * 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 130,
            child: new Text(
                concernedPerson > 0
                    ? concernedPerson.toString() + " người khác quan tâm"
                    : '',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xff666666),
                  fontSize: 12 * curScaleFactor,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1,
            height: MediaQuery.of(context).size.height / 333.5 * 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 106,
                  height: MediaQuery.of(context).size.height / 333.5 * 20,
                  decoration: BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.circular(12)),
                  alignment: Alignment.center,
                  child: new Text("Xem chi tiết",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff4d4d4d),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                InkWell(
                  onTap: () {
                    UserDatabase().updateSocialActivities(socialActivityData);
                  },
                  child: Ink(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 20,
                        height: MediaQuery.of(context).size.height / 333.5 * 20,
                        decoration: BoxDecoration(
                            color: Color(0xffededed),
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: isConcerned
                            ? Icon(
                                Icons.favorite_border_outlined,
                                color: Color(0xff00865d),
                              )
                            : Icon(Icons.favorite_border_outlined)),
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
