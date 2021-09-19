
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {

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
            Text("Tài chính",
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
              height: MediaQuery.of(context).size.height / 333.5 * 52,
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
                  Icon(Icons.calendar_today_rounded, color: Color(0xff12b281),),
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
                          Text("Nhật ký chi tiêu",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff1a1a1a),
                              fontSize: 16 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),),
                          Container(
                            width: MediaQuery.of(context).size.width / 187.5 * 65,
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
                        child: Text("Tổng hợp những chi tiêu của bạn theo một danh sách các ngày để bạn có thể dễ dàng theo dõi những khoản mục chi tiêu của mình.",
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
              height: MediaQuery.of(context).size.height / 333.5 * 60,
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
                    Icon(Icons.table_view_rounded, color: Color(0xff12b281),),
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
                            Text("Kế hoạch về hưu",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 62,
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
                          child: Text("Bạn đang tìm kiếm một kế hoạch về hưu mà không biết bắt đầu như thế nào? Ngay đây chúng tôi sẽ giúp bạn. Thiết lập tầm nhìn kế hoạch về hưu của cá nhân bạn chỉ bằng việc trả lời một số câu hỏi. Bắt đầu thôi!",
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
                    Icon(Icons.savings_rounded, color: Color(0xff12b281),),
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
                            Text("Mục tiêu tiết kiệm",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 57,
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
                          child: Text("Hỗ trợ bạn tạo mục tiêu tiết kiệm và theo dõi tiến độ tiết kiệm để giúp bạn đạt được mục tiêu mua sắm, đầu tư trong tương lai.",
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
                    Icon(Icons.compare, color: Color(0xff12b281),),
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
                            Text("Gợi ý gói đầu tư",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1a1a1a),
                                fontSize: 16 * curScaleFactor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Container(
                              width: MediaQuery.of(context).size.width / 187.5 * 65,
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
                          child: Text("Gợi ý những gói đầu tư phù hợp với tình hình tài chính của bạn hiện tại, giúp bạn có được danh mục đầu tư ổn định và bền vững.",
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