import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({Key? key}) : super(key: key);

  @override
  _TimePickerScreenState createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  List<String> list = ['1', '2', '3', '6', '12', 'other'];
  List<bool> listSelectStatus = [false, false, false, false, false, false];
  bool _displayOtherTime = false;
  var startTime;
  var endTime;
  late List<Widget> listCurrency = list
      .map((value) => TimeDurationItem(value, false, updateStatus))
      .toList();
  void updateStatus(String currency) {
    int index = list.indexOf(currency);
    List<bool> tmp = listSelectStatus;
    tmp = tmp.map((element) {
      return false;
    }).toList();
    tmp[index] = true;
    List<Widget> tmpWidget = [];
    for (int i = 0; i < list.length; i++) {
      tmpWidget.add(TimeDurationItem(list[i], tmp[i], updateStatus));
    }
    setState(() {
      listSelectStatus = tmp;
      listCurrency = tmpWidget;
      if (currency == 'other') {
        _displayOtherTime = true;
      } else {
        _displayOtherTime = false;
      }
    });
  }

  String nof = '';
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1.3 / 3,
              child: ListView(
                children: listCurrency,
              ),
            ),
            _displayOtherTime
                ? Container(
                    child: Column(
                      children: [
                        Text('Chọn khoảng thời gian'),
                        Row(
                          children: [
                            Container(
                              width: width / 2,
                              child: GestureDetector(
                                onTap: () => {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      // minTime: DateTime.now(),
                                      // maxTime: DateTime(2019, 6, 7),
                                      onChanged: (date) {
                                    print(DateFormat.yMMMMEEEEd().format(date));
                                  }, onConfirm: (date) {
                                    // print('confirm $date');
                                    setState(() {
                                      startTime = date;
                                    });
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.vi)
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 26),
                                              child: Icon(
                                                Icons.calendar_today_outlined,
                                                color: Color(0xff12B281),
                                              ),
                                            ),
                                            Text(
                                              startTime != null
                                                  ? DateFormat('dd/MMM/yyyy')
                                                      .format(startTime)
                                                  : '',
                                              style: TextStyle(
                                                  color: Color(0xff12B281)),
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: width / 2,
                              child: GestureDetector(
                                onTap: () => {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: startTime,
                                      // maxTime: DateTime(2019, 6, 7),
                                      onChanged: (date) {
                                    print(DateFormat.yMMMMEEEEd().format(date));
                                  }, onConfirm: (date) {
                                    // print('confirm $date');
                                    setState(() {
                                      endTime = date;
                                    });
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.vi)
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 26),
                                              child: Icon(
                                                Icons.calendar_today_outlined,
                                                color: Color(0xff12B281),
                                              ),
                                            ),
                                            Text(
                                              endTime != null
                                                  ? DateFormat('dd/MMM/yyyy')
                                                      .format(endTime)
                                                  : '',
                                              style: TextStyle(
                                                  color: Color(0xff12B281)),
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(),
            Container(
              child: Text(
                nof,
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width / 187.5 * 171.5,
        height: MediaQuery.of(context).size.height / 333.5 * 24,
        child: ElevatedButton(
          child: Text('LƯU',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xffFFFFFF),
              fontSize: 16 * curScaleFactor,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),),
          onPressed: () {
            int index = listSelectStatus.indexOf(true);
            Map result = {};
            if (index >= 0) {
              print(list[index]);
              if (list[index] != 'other') {
                Duration duration = Duration(
                    days: 30 * int.parse(list[index]), hours: 23, minutes: 59);
                DateTime now = DateTime.now();
                endTime = DateTime(now.year, now.month, now.day, 23, 59);
                startTime = endTime.subtract(duration);
                // startTime = Timestamp.fromDate(startTime);
                // endTime = Timestamp.fromDate(endTime);
                result = {
                  'startTime': startTime,
                  'endTime': endTime,
                  'duration': list[index] + ' tháng'
                };
                Navigator.pop(context, result);
              } else {
                if (startTime == null || endTime == null)
                  setState(() {
                    nof = 'Dữ liệu chưa hợp lệ!';
                  });
                else {
                  startTime =
                      DateTime(startTime.year, startTime.month, startTime.day);
                  endTime = DateTime(
                      endTime.year, endTime.month, endTime.day, 23, 59);
                  result = {
                    'startTime': startTime,
                    'endTime': endTime,
                    'duration': ''
                  };
                  Navigator.pop(context, result);
                }
              }
            } else {
              setState(() {
                nof = 'Dữ liệu chưa hợp lệ!';
              });
            }
            // if (list[index] !='other')
          },
        ),
      ),
    );
  }
}

class TimeDurationItem extends StatelessWidget {
  TimeDurationItem(this.duration, this.isSelected, this.updateStatus,
      {Key? key})
      : super(key: key);
  final String duration;
  final bool isSelected;
  final Function updateStatus;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Icon(Icons.money),
      title: Text(
          duration != 'other' ? duration + ' tháng' : 'Nhập vào giá trị khác'),
      trailing: isSelected
          ? Icon(
              Icons.done,
              color: Color(0xff12B281),
            )
          : null,
      onTap: () {
        updateStatus(duration);
      },
    );
  }
}
