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
  _RecordScreenState(this.savingGoal);
  Map savingGoal;
  getDuration() {
    DateTime start = savingGoal['startTime'].toDate();
    DateTime end = savingGoal['endTime'].toDate();
    Duration duration = end.difference(start);
    int months = (duration.inDays / 30).floor();
    int weeks = ((duration.inDays % 30) / 7).floor();
    int days = (duration.inDays % 30) % 7;
    return 'Còn lại ${months} months ${weeks} weeks ${days} days';
  }

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

  @override
  Widget build(BuildContext context) {
    String timeDisplay = DateFormat('EEE, dd MMM yyyy')
            .format(savingGoal['startTime'].toDate()) +
        " - " +
        DateFormat('EEE, dd MMM yyyy').format(savingGoal['endTime'].toDate());
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('back')),
            Text(savingGoal['name']),
            Text(timeDisplay),
            Text('Còn lại: ' + remainSaving().toStringAsFixed(2)),
            // Text(savingGoal['type']),
            Container(
              child: Column(
                children: [
                  Text('Đã tích luỹ : ' + savingGoal['savedMoney'].toString()),
                  Text('Mục tiêu : ' + savingGoal['goal'].toString()),
                  isOnSchedule()
                      ? Text('Bạn đúng tiến độ')
                      : Text('Bạn chậm tiến độ')
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  savingGoal.containsKey('listRecord') &&
                          savingGoal['listRecord'] != null
                      ? Column(
                          children: savingGoal['listRecord']
                              .map<Widget>((record) => RecordDayWidget(record))
                              .toList(),
                        )
                      : Text(
                          'Bạn chưa ghi nhật ký, bấm vào nút dấu “+” để thêm nhật ký.')
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
