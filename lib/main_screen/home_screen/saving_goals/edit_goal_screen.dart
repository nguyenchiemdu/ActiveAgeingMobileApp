import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class EditGoalScreen extends StatefulWidget {
  const EditGoalScreen(this.data, {Key? key}) : super(key: key);
  final Map<String, dynamic> data;
  @override
  _EditGoalScreenState createState() => _EditGoalScreenState();
}

enum SingingCharacter { self, calculate }

// selectedFrequency = widget.data['frequency'];
class _EditGoalScreenState extends State<EditGoalScreen> {
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.data['name']);
    _goalType = widget.data['type'];
    savingTarget = TextEditingController(text: widget.data['goal'].toString());
    savedMoney =
        TextEditingController(text: widget.data['savedMoney'].toString());
    selectedCurrency = widget.data['currency'];
    startTime = widget.data['startTime'].toDate();
    _character = widget.data['isCalculated']
        ? SingingCharacter.calculate
        : SingingCharacter.self;
    endTime = widget.data['endTime'].toDate();
    if (_character == SingingCharacter.calculate) {
      savingAverage =
          TextEditingController(text: widget.data['savingAverage'].toString());
      autoNoteFrequency = widget.data[autoNoteFrequency];
      autoNote = widget.data['autoNote'];
      autoNoteDate = widget.data['autoNoteDate'].toDate();
      autoNoteFrequency = widget.data['autoNoteFrequency'];
    }
  }

  List<String> listCurrency = ['VND', 'USD', 'RUB'];
  List<String> listFrequency = ['Mỗi ngày', "Mỗi tuần", 'Mỗi tháng', 'Mỗi năm'];
  String selectedCurrency = 'VND';
  String selectedFrequency = 'Mỗi ngày';
  DateTime startTime = DateTime.now();
  var endTime;
  bool autoNote = false;
  var autoNoteDate;
  String autoNoteFrequency = 'Mỗi ngày';
  TextEditingController name = TextEditingController();
  TextEditingController savingAverage = TextEditingController();
  TextEditingController savingTarget = TextEditingController();
  TextEditingController savedMoney = TextEditingController();
  SingingCharacter? _character = SingingCharacter.self;
  bool _validate = true;
  final _formKey = GlobalKey<FormState>();
  calculatEndtime() {
    int factor = 0;
    switch (selectedFrequency) {
      case 'Mỗi ngày':
        factor = 1;
        break;
      case 'Mỗi tuần':
        factor = 7;
        break;
      case 'Mỗi tháng':
        factor = 30;
        break;
      case 'Mỗi năm':
        factor = 365;
        break;
    }
    if (_formKey.currentState!.validate() &&
        _character == SingingCharacter.calculate) {
      int durationDay =
          ((double.parse(savingTarget.text) - double.parse(savedMoney.text)) /
                  double.parse(savingAverage.text) *
                  factor)
              .round();
      if (durationDay < 0) durationDay = 0;
      // print(durationDay);
      setState(() {
        endTime = startTime.add(Duration(days: durationDay));
      });
    }
  }

  //--------------------------
  var _goalType = 'Learn';
  final List<String> _listType = [
    'Learn',
    'Car',
    'Device',
    'Investment',
    'Retirement',
    'House',
    'Gift',
    'Travel',
    'Entertainment'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.data['name']),
                      Text(widget.data['type']),
                      Text('Tên mục Tiêu'),
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value != '')
                            return null;
                          else
                            return 'Tên mục tiêu k được để trống!';
                        },
                        decoration: InputDecoration(
                            hintText: 'Tên mục tiêu',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      Text('Mục tiêu'),
                      DropdownButton<String>(
                        value: _goalType,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _goalType = newValue!;
                          });
                        },
                        items: _listType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Text('Số tiền mục tiêu'),
                      TextFormField(
                        validator: (value) {
                          if (double.tryParse(value.toString()) != null)
                            return null;
                          else
                            return 'Hãy nhập vào 1 số';
                        },
                        onChanged: (value) {
                          calculatEndtime();
                        },
                        controller: savingTarget,
                        decoration: InputDecoration(
                            hintText: 'Nhập số tiền mục tiêu',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      Text('Số tiền đã tích luỹ'),
                      Container(
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: TextFormField(
                                    onChanged: (value) {
                                      calculatEndtime();
                                    },
                                    validator: (value) {
                                      if (double.tryParse(value.toString()) !=
                                          null)
                                        return null;
                                      else
                                        return 'Hãy nhập vào 1 số';
                                    },
                                    controller: savedMoney,
                                    decoration: InputDecoration(
                                        hintText: 'Placeholder',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      value: selectedCurrency,
                                      items: listCurrency
                                          .map((value) => DropdownMenuItem(
                                                child: Text(value),
                                                value: value,
                                              ))
                                          .toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedCurrency = value.toString();
                                        });
                                      },
                                      hint: Text("Select item")),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ngày bắt đầu'),
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
                              startTime = date;
                            });
                          }, currentTime: startTime, locale: LocaleType.vi)
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
                                      margin: EdgeInsets.only(right: 26),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Color(0xff12B281),
                                      ),
                                    ),
                                    Text(
                                      DateFormat.yMMMMEEEEd().format(startTime),
                                      style:
                                          TextStyle(color: Color(0xff12B281)),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Text('Ngày kết thúc'),
                      Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('Tự đặt ngày kết thúc'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.self,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                  endTime = null;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Giúp tôi tính ngày kết thúc'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.calculate,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                  endTime = null;
                                });
                                calculatEndtime();
                              },
                            ),
                          ),
                        ],
                      ),
                      _character == SingingCharacter.self
                          ? GestureDetector(
                              onTap: () => {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true, minTime: startTime,
                                    // maxTime: DateTime(2019, 6, 7),
                                    onChanged: (date) {
                                  print(DateFormat.yMMMMEEEEd().format(date));
                                }, onConfirm: (date) {
                                  // print('confirm $date');
                                  setState(() {
                                    endTime = date;
                                  });
                                }, currentTime: endTime, locale: LocaleType.vi)
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
                                            margin: EdgeInsets.only(right: 26),
                                            child: Icon(
                                              Icons.calendar_today_outlined,
                                              color: Color(0xff12B281),
                                            ),
                                          ),
                                          Text(
                                            endTime != null
                                                ? DateFormat.yMMMMEEEEd()
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
                            )
                          : Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nhập số tiền tiết kiệm trung bình'),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          child: TextFormField(
                                            validator: (value) {
                                              if (double.tryParse(
                                                      value.toString()) !=
                                                  null)
                                                return null;
                                              else
                                                return 'Hãy nhập vào 1 số';
                                            },
                                            controller: savingAverage,
                                            onChanged: (text) {
                                              bool ok = false;
                                              if (double.tryParse(text) != null)
                                                ok = true;
                                              calculatEndtime();
                                              setState(() {
                                                _validate = ok;
                                              });
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: DropdownButtonFormField<
                                                  String>(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)))),
                                              value: selectedFrequency,
                                              items: listFrequency
                                                  .map((value) =>
                                                      DropdownMenuItem(
                                                        child: Text(value),
                                                        value: value,
                                                      ))
                                                  .toList(),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  selectedFrequency =
                                                      value.toString();
                                                });
                                                if (_validate)
                                                  calculatEndtime();
                                              },
                                              hint: Text("Select item")),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Thời gian kết thúc ước tính'),
                                      Text(
                                        endTime != null
                                            ? DateFormat.yMMMMEEEEd()
                                                .format(endTime)
                                            : '',
                                        style:
                                            TextStyle(color: Color(0xff12B281)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Tự động ghi chép'),
                                      Switch(
                                        value: autoNote,
                                        onChanged: (value) {
                                          setState(() {
                                            autoNote = value;
                                          });
                                        },
                                        activeTrackColor: Color(0xff18CE8C),
                                        activeColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IntrinsicHeight(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            child: Expanded(
                                              flex: 6,
                                              child: InkWell(
                                                onTap: () {
                                                  DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime: DateTime.now(),
                                                      // maxTime: DateTime(2019, 6, 7),
                                                      onChanged: (date) {
                                                    print(
                                                        DateFormat.yMMMMEEEEd()
                                                            .format(date));
                                                  }, onConfirm: (date) {
                                                    // print('confirm $date');
                                                    setState(() {
                                                      autoNoteDate = date;
                                                    });
                                                  },
                                                      currentTime: startTime,
                                                      locale: LocaleType.vi);
                                                },
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12,
                                                                horizontal: 16),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              // height: double.infinity,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          26),
                                                              child: Icon(
                                                                Icons
                                                                    .calendar_today_outlined,
                                                                color: Color(
                                                                    0xff12B281),
                                                              ),
                                                            ),
                                                            Text(
                                                              autoNoteDate !=
                                                                      null
                                                                  ? DateFormat(
                                                                          'EEE, MMM dd, yyyy')
                                                                      .format(
                                                                          autoNoteDate)
                                                                  : '',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff12B281)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              child: DropdownButtonFormField<
                                                  String>(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)))),
                                                value: autoNoteFrequency,
                                                items: listFrequency
                                                    .map((value) =>
                                                        DropdownMenuItem(
                                                          child: Text(value),
                                                          value: value,
                                                        ))
                                                    .toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    autoNoteFrequency =
                                                        value.toString();
                                                  });
                                                  if (_validate)
                                                    calculatEndtime();
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: Text(
                            'Xoá',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(context, {});
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('Lưu mục tiêu'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Map<String, dynamic> submitData = {
                                'name': name.text,
                                'type': _goalType,
                                'currency': selectedCurrency,
                                'goal': double.parse(savingTarget.text),
                                'savedMoney': double.parse(savedMoney.text),
                                'startTime': Timestamp.fromDate(startTime),
                                'endTime': Timestamp.fromDate(endTime),
                                'autoNote': autoNote,
                                'savingAverage':
                                    _character == SingingCharacter.calculate
                                        ? double.parse(savingAverage.text)
                                        : null,
                                'frequency': selectedFrequency,
                                'autoNoteDate': autoNoteDate == null
                                    ? null
                                    : Timestamp.fromDate(autoNoteDate),
                                'autoNoteFrequency': autoNoteFrequency,
                                'isCalculated':
                                    _character == SingingCharacter.calculate
                                        ? true
                                        : false
                              };
                              print(submitData);
                              // submitData.addAll(widget.data);
                              Navigator.pop(context, submitData);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
