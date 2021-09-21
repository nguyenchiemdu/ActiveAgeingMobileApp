import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_record_screen.dart';
import 'record_day_widget.dart';

class RecordScreen extends StatefulWidget {
  RecordScreen(this.savingGoal, this.updateData, {Key? key}) : super(key: key);
  final Map savingGoal;
  final Function updateData;
  @override
  _RecordScreenState createState() => _RecordScreenState(savingGoal);
}

class _RecordScreenState extends State<RecordScreen> {
  _RecordScreenState(this.savingGoal) {}
  Map savingGoal;
  List<int> listDate = [];
  Map<int, List> mapGroup = {};
  double remainSaving() {
    return savingGoal['goal'] - savingGoal['savedMoney'];
  }

  String remainTime() {
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(DateTime.now());
    int months = (duration.inDays / 30).floor();
    int weeks = ((duration.inDays % 30) / 7).floor();
    int days = (duration.inDays % 30) % 7;
    return 'Còn lại ${months} months ${weeks} weeks ${days} days';
  }

  bool isOnSchedule() {
    DateTime start = savingGoal['startTime'].toDate();
    DateTime end = savingGoal['endTime'].toDate();
    Duration durationAgo = DateTime.now().difference(start);
    Duration duration = end.difference(start);
    double onScheduleSaving =
        savingGoal['goal'] / duration.inDays * durationAgo.inDays;
    if (onScheduleSaving > savingGoal['savedMoney']) return false;
    return true;
  }

  addRecord(Map data) {
    Map tmp = savingGoal;
    if (!tmp.containsKey('listRecord') || tmp['listRecord'] == null)
      tmp['listRecord'] = [];
    tmp['listRecord'].add(data);
    tmp['savedMoney'] = tmp['savedMoney'] + data['money'];
    setState(() {
      savingGoal = tmp;
    });
    widget.updateData(tmp);
  }

  calculateGroup(List list) {
    if (list != null) {
      DateFormat datetonum = DateFormat('yyyyMMdd');
      Set<int> setDate = list.map((transaction) {
        return int.parse(datetonum.format(transaction['time'].toDate()));
      }).toSet();
      listDate = setDate.toList();
      listDate.sort();
      listDate.forEach((numday) {
        mapGroup[numday] = [];
      });
      list.forEach((transaction) {
        int nd = int.parse(datetonum.format(transaction['time'].toDate()));
        mapGroup[nd]!.add(transaction);
      });
    } else
      print('list record null');
  }

  NumberFormat formatter = NumberFormat('###,###,###,##0.##');
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    String timeDisplay =
        DateFormat('yMd').format(savingGoal['startTime'].toDate()) +
            " - " +
            DateFormat('yMd').format(savingGoal['endTime'].toDate());
    calculateGroup(savingGoal['listRecord']);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xffecf9f4),
            fontSize: 16 * curScaleFactor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          title: Text(savingGoal['name'])),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffffffff),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 1,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  Text(remainTime(),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff999999),
                        fontSize: 14 * curScaleFactor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 1,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Còn lại: ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff999999),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                      Text(formatter.format(remainSaving()),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xff1a1a1a),
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 1,
                    height: MediaQuery.of(context).size.height / 333.5 * 2,
                  ),
                  Stack(
                    children: [
                      Container(
                          width:
                              MediaQuery.of(context).size.width / 187.5 * 172,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 2,
                          decoration: BoxDecoration(
                              color: Color(0xffdedede),
                              borderRadius: BorderRadius.circular(12))),
                      Container(
                          width: MediaQuery.of(context).size.width /
                              187.5 *
                              (savingGoal['savedMoney'] / savingGoal['goal']) *
                              172,
                          height:
                              MediaQuery.of(context).size.height / 333.5 * 2,
                          decoration: BoxDecoration(
                              color: Color(0xff12b281),
                              borderRadius: BorderRadius.circular(12))),
                      Container(
                        width: MediaQuery.of(context).size.width / 187.5 * 1,
                        height: MediaQuery.of(context).size.height / 333.5 * 8,
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 172,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Đã tích luỹ : ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff666666),
                              fontSize: 16 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Text(
                            formatter.format(savingGoal['savedMoney']) +
                                " (" +
                                formatter.format(savingGoal['savedMoney'] /
                                    savingGoal['goal'] *
                                    100) +
                                "%)",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff12b281),
                              fontSize: 16 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 172,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mục tiêu : ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff666666),
                              fontSize: 16 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                        Text(
                            formatter.format(savingGoal['goal']) +
                                " " +
                                savingGoal['currency'].toString(),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xff12b281),
                              fontSize: 16 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 1,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ), // Text(savingGoal['type']),
                  Container(
                    child: Column(
                      children: [
                        isOnSchedule()
                            ? Text('Bạn đúng tiến độ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff18ce8c),
                                  fontSize: 14 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ))
                            : Text('Bạn chậm tiến độ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xffff2d2d),
                                  fontSize: 14 * curScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 1,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffffffff),
              child: Column(
                children: [
                  savingGoal.containsKey('listRecord') &&
                          savingGoal['listRecord'] != null
                      ? Column(
                          children: listDate.map((day) {
                          DateTime time = mapGroup[day]![0]['time'].toDate();
                          return Container(
                            child: Column(
                              children: [
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(DateFormat('EEEE').format(time),
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            color: Color(0xff1a1a1a),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),),
                                        Text(
                                            DateFormat('MM/yyyy').format(time),
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
                                  children:
                                      mapGroup[day]!.map<Widget>((transaction) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height / 333.5 * 24,
                                      child: Column(
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height / 333.5 * 0.5,
                                              color: Color(0xffededed)
                                          ),
                                          Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height / 333.5 * 2,
                                          ),
                                          Row(
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
                                                  Text(formatter
                                                      .format(transaction['money']),
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Color(0xff1A1A1A),
                                                      fontSize: 18 * curScaleFactor,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                    ),),
                                                  Text(transaction['note'],
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Color(0xff999999),
                                                      fontSize: 14*curScaleFactor,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.italic,
                                                    ),)
                                                ],
                                              )
                                            ],
                                          )
                                          ,


                                        ],
                                      ),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          );
                        }).toList())
                      : Column(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 187.5 * 1,
                              height: MediaQuery.of(context).size.height /
                                  333.5 *
                                  40,
                            ),
                            Text(
                                'Bạn chưa ghi nhật ký, bấm vào nút\ndấu “+” để thêm nhật ký.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff999999),
                                  fontSize: 14 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map record = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddRecordScreen()));
          if (record != null) addRecord(record);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
