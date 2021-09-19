import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:active_ageing_mobile_app/main_screen/home_screen/money_management/diary_widget.dart';

listTransactionsByDate(List<int> listDate, Map<int, List> mapGroup, context) {
  final NumberFormat formatter = NumberFormat('###,###,###,##0.##');

  return listDate.map<Widget>((day) {
    DateTime time = mapGroup[day]![0]['time'].toDate();

    return Container(

      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
              color: Color(0xffdedede)
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 2,
                height: MediaQuery.of(context).size.height / 333.5 * 24,
                color: Color(0xff12b281)
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 6,
                  height: MediaQuery.of(context).size.height / 333.5 * 1,
              ),
              Text(time.day.toString(),
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xff1a1a1a),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),),
              Container(
                width: MediaQuery.of(context).size.width / 187.5 * 4,
                height: MediaQuery.of(context).size.height / 333.5 * 4,
              ),
              Column(
                children: [
                  Text(DateFormat('EEEE').format(time),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff1a1a1a),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),),
                  Text(DateFormat('MM/yyyy').format(time),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff999999),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),),
                ],
              )
            ],
          ),
          Column(
            children: mapGroup[day]!.map<Widget>((transaction) {
              // print(transaction);
              return Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                      color: Color(0xffdedede)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 333.5 * 24,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 12,
                          height: MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Icon(Icons.format_list_bulleted_rounded, color:Color(0xffededed)),
                        Container(
                          width: MediaQuery.of(context).size.width / 187.5 * 14,
                          height: MediaQuery.of(context).size.height / 333.5 * 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(transaction['name'].toString(),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff1A1A1A),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),),
                            Text(formatter.format(transaction['money']),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xff18CE8C),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }).toList();
}
