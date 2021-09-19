
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 187.5 * 171.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 25,
            ),
            Text("Sức khỏe",
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xff333333),
                fontSize: 24 * curScaleFactor,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 40,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Icon(Icons.remember_me_rounded, color: Color(0xff12b281),),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Nhắc lịch khám sức khỏe",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 30,
                              height: MediaQuery.of(context).size.height / 333.5 * 1,
                            ),
                            Icon(Icons.arrow_forward_rounded, color: Color(0xff999999))
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 5,
                          height: MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 130.5,
                          child: Text("Chúng tôi phát hành chức năng này trong thời gian sớm nhất.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff999999),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        )
                      ],
                    )
                  ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 40,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Icon(Icons.group_rounded, color: Color(0xff12b281),),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Cộng đồng chăm sóc sức khỏe",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 7,
                              height: MediaQuery.of(context).size.height / 333.5 * 1,
                            ),
                            Icon(Icons.arrow_forward_rounded, color: Color(0xff999999))
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 5,
                          height: MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 130.5,
                          child: Text("Chúng tôi phát hành chức năng này trong thời gian sớm nhất.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff999999),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        )
                      ],
                    )
                  ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 40,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Icon(Icons.headphones_battery_rounded, color: Color(0xff12b281),),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Sản phẩm chăm sóc sức khỏe",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 10,
                              height: MediaQuery.of(context).size.height / 333.5 * 1,
                            ),
                            Icon(Icons.arrow_forward_rounded, color: Color(0xff999999))
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 5,
                          height: MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 130.5,
                          child: Text("Chúng tôi phát hành chức năng này trong thời gian sớm nhất.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff999999),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        )
                      ],
                    )
                  ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 50,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Icon(Icons.book_rounded, color: Color(0xff12b281),),
                    Container(
                      width: MediaQuery.of(context).size.width / 187.5 * 8,
                      height: MediaQuery.of(context).size.height / 333.5 * 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Hội thảo về sức khỏe",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 45,
                              height: MediaQuery.of(context).size.height / 333.5 * 1,
                            ),
                            Icon(Icons.arrow_forward_rounded, color: Color(0xff999999))
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 5,
                          height: MediaQuery.of(context).size.height / 333.5 * 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 130.5,
                          child: Text("Chúng tôi phát hành chức năng này trong thời gian sớm nhất.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff999999),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        )
                      ],
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}