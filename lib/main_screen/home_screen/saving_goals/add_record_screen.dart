import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddRecordScreen extends StatefulWidget {
  const AddRecordScreen({Key? key}) : super(key: key);

  @override
  _AddRecordScreenState createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  DateTime time = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  TextEditingController money = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_back_ios_outlined)),
                Text('Nhật ký'),
                ElevatedButton(onPressed: () {}, child: Text('Lưu'))
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Số tiền'),
                  TextFormField(
                    controller: money,
                    validator: (value) {
                      if (double.tryParse(value!) == null)
                        return 'Dữ liệu k hợp lệ';
                      return null;
                    },
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.subject_outlined,
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: note,
                            validator: (value) {
                              if (value == "") return 'mục này k thể trống';
                              return null;
                            },
                            decoration: InputDecoration(hintText: 'Ghi chú'),
                          ))
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => {
                DatePicker.showDatePicker(context,
                    showTitleActions: true, minTime: DateTime.now(),
                    // maxTime: DateTime(2019, 6, 7),
                    onChanged: (date) {
                  print(DateFormat.yMMMMEEEEd().format(date));
                }, onConfirm: (date) {
                  // print('confirm $date');
                  setState(() {
                    time = date;
                  });
                }, currentTime: time, locale: LocaleType.vi)
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 26),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xff12B281),
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().format(time),
                            style: TextStyle(color: Color(0xff12B281)),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map data = {
                      'money': double.parse(money.text),
                      'note': note.text,
                      'time': Timestamp.fromDate(time)
                    };
                    print(data);
                    Navigator.pop(context, data);
                  }
                },
                child: Text('Lưu'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
