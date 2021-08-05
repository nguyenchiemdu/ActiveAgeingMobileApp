import 'package:flutter/material.dart';

class RecreationalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: MediaQuery.of(context).size.width / 187.5 * 138,
      height: MediaQuery.of(context).size.height / 333.5 * 155.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),

            ),
            child: Image.asset("assets/images/test1.png",
              width: MediaQuery.of(context).size.width / 187.5 * 138,
              height: MediaQuery.of(context).size.height / 333.5 * 67.5,
              alignment: Alignment.topCenter,
              fit: BoxFit.fill
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1,
            height: MediaQuery.of(context).size.height / 333.5 * 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 130,
            child: new Text("ĐANG DIỄN RA",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xffec5b5b),
                  fontSize: 12 * curScaleFactor,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 1,
            height: MediaQuery.of(context).size.height / 333.5 * 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 187.5 * 130,
            child: new Text("Future Healthcare Exhibition & Conference 2021",
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
            child: new Text("45 người khác quan tâm",
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
                      borderRadius: BorderRadius.circular(12)
                  ),
                  alignment: Alignment.center,
                  child:
                  new Text("Xem chi tiết",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff4d4d4d),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 20,
                  height: MediaQuery.of(context).size.height / 333.5 * 20,
                  decoration: BoxDecoration(
                      color: Color(0xffededed),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.favorite_border_outlined)
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}