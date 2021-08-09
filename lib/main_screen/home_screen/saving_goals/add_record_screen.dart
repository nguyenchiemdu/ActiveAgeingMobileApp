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
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

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
            title: Text("Nhật ký")),
        body: Container(
      padding: EdgeInsets.only(top: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              height: MediaQuery.of(context).size.height / 333.5 * 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 89,
                    height: MediaQuery.of(context).size.height / 333.5 * 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: Text('Số tiền',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xff1a1a1a),
                          fontSize: 12 * curScaleFactor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 187.5 * 155.5,
                    child: TextFormField(
                      controller: money,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff00865d),
                        fontSize: 32 * curScaleFactor,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                      validator: (value) {
                        if (double.tryParse(value!) == null)
                          return 'Dữ liệu k hợp lệ';
                        return null;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: MediaQuery.of(context).size.height / 333.5 * 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
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
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 333.5 * 16,),
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
                      child: Text('LƯU'.toUpperCase())),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
