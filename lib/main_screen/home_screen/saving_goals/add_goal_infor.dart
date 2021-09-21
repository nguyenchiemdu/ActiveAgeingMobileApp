import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddGoalInfor extends StatefulWidget {
  const AddGoalInfor(this.data, {Key? key}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _AddGoalInforState createState() => _AddGoalInforState();
}

enum SingingCharacter { self, calculate }

class _AddGoalInforState extends State<AddGoalInfor> {
  List<String> listCurrency = ['VND', 'USD', 'RUB'];
  List<String> listFrequency = ['Mỗi ngày', "Mỗi tuần", 'Mỗi tháng', 'Mỗi năm'];
  String selectedCurrency = 'VND';
  String selectedFrequency = 'Mỗi ngày';
  DateTime startTime = DateTime.now();
  var endTime;
  bool autoNote = false;
  var autoNoteDate;
  String autoNoteFrequency = 'Mỗi ngày';
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
        _character == SingingCharacter.calculate &&
        double.tryParse(savingAverage.text) != null) {
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
          title: Text("Thêm mục tiêu")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: MediaQuery.of(context).size.height / 333.5 * 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              child: Text('Về bước trước',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff999999),
                    fontSize: 14 * curScaleFactor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 89,
              height: MediaQuery.of(context).size.height / 333.5 * 3,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 171.5,
              child: Text('Thông tin chi tiết',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff4d4d4d),
                    fontSize: 16 * curScaleFactor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 187.5 * 1,
              height: MediaQuery.of(context).size.height / 333.5 * 8,
            ),
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 333.5 * 6),
                child: Column(
                  children: [
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.data['name'],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 24 * curScaleFactor,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Text(widget.data['type'],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff12B281),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Text(
                                      'Hoàn thành biểu mẫu sau và máy sẽ tính toán giúp bạn về mục tiêu về hưu.',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff666666),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        12,
                                  ),
                                  Text('Số tiền mục tiêu',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        4,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (double.tryParse(value.toString()) !=
                                          null)
                                        return null;
                                      else
                                        return 'Hãy nhập vào 1 số';
                                    },
                                    onChanged: (value) {
                                      calculatEndtime();
                                    },
                                    controller: savingTarget,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xff12b281),
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide(
                                          color: Color(0xffededed),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        10,
                                  ),
                                  Text('Số tiền đã tích luỹ',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        4,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        28,
                                    child: IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onChanged: (value) {
                                                    calculatEndtime();
                                                  },
                                                  validator: (value) {
                                                    if (double.tryParse(
                                                            value.toString()) !=
                                                        null)
                                                      return null;
                                                    else
                                                      return 'Hãy nhập vào 1 số';
                                                  },
                                                  controller: savedMoney,
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xff12b281),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffededed),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  187.5 *
                                                  47.5,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  333.5 *
                                                  28,
                                              child: DropdownButtonFormField<
                                                      String>(
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xff12b281),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffededed),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  value: selectedCurrency,
                                                  items: listCurrency
                                                      .map((value) =>
                                                          DropdownMenuItem(
                                                            child: Text(value),
                                                            value: value,
                                                          ))
                                                      .toList(),
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedCurrency =
                                                          value.toString();
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
                              width: MediaQuery.of(context).size.width /
                                  187.5 *
                                  171.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        10,
                                  ),
                                  Text('Ngày bắt đầu',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        4,
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime.now(),
                                          // maxTime: DateTime(2019, 6, 7),
                                          onChanged: (date) {
                                        print(DateFormat.yMMMMEEEEd()
                                            .format(date));
                                      }, onConfirm: (date) {
                                        // print('confirm $date');
                                        setState(() {
                                          startTime = date;
                                        });
                                      },
                                          currentTime: startTime,
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
                                                  margin: EdgeInsets.only(
                                                      right: 26),
                                                  child: Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    color: Color(0xff12B281),
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat.yMMMMEEEEd()
                                                      .format(startTime),
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
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        187.5 *
                                        1,
                                    height: MediaQuery.of(context).size.height /
                                        333.5 *
                                        10,
                                  ),
                                  Text('Ngày kết thúc',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xff1a1a1a),
                                        fontSize: 14 * curScaleFactor,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Column(
                                    children: <Widget>[
                                      ListTile(
                                        title:
                                            const Text('Tự đặt ngày kết thúc',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xff666666),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                )),
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
                                        title: const Text(
                                            'Giúp tôi tính ngày kết thúc',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff666666),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            )),
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
                                                showTitleActions: true,
                                                minTime: startTime,
                                                // maxTime: DateTime(2019, 6, 7),
                                                onChanged: (date) {
                                              print(DateFormat.yMMMMEEEEd()
                                                  .format(date));
                                            }, onConfirm: (date) {
                                              // print('confirm $date');
                                              setState(() {
                                                endTime = date;
                                              });
                                            },
                                                currentTime: endTime,
                                                locale: LocaleType.vi)
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 26),
                                                        child: Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color:
                                                              Color(0xff12B281),
                                                        ),
                                                      ),
                                                      Text(
                                                        endTime != null
                                                            ? DateFormat
                                                                    .yMMMMEEEEd()
                                                                .format(endTime)
                                                            : '',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff12B281)),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Nhập số tiền tiết kiệm trung bình',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xff999999),
                                                    fontSize:
                                                        14 * curScaleFactor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    187.5 *
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    333.5 *
                                                    4,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 6,
                                                    child: Container(
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: (value) {
                                                          if (double.tryParse(value
                                                                  .toString()) !=
                                                              null)
                                                            return null;
                                                          else
                                                            return 'Hãy nhập vào 1 số';
                                                        },
                                                        controller:
                                                            savingAverage,
                                                        onChanged: (text) {
                                                          bool ok = false;
                                                          if (double.tryParse(
                                                                  text) !=
                                                              null) ok = true;
                                                          calculatEndtime();
                                                          setState(() {
                                                            _validate = ok;
                                                          });
                                                        },
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: DropdownButtonFormField<
                                                              String>(
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)))),
                                                          value:
                                                              selectedFrequency,
                                                          items: listFrequency
                                                              .map((value) =>
                                                                  DropdownMenuItem(
                                                                    child: Text(
                                                                        value),
                                                                    value:
                                                                        value,
                                                                  ))
                                                              .toList(),
                                                          onChanged:
                                                              (String? value) {
                                                            setState(() {
                                                              selectedFrequency =
                                                                  value
                                                                      .toString();
                                                            });
                                                            if (_validate)
                                                              calculatEndtime();
                                                          },
                                                          hint: Text(
                                                              "Select item")),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    187.5 *
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    333.5 *
                                                    10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Thời gian kết thúc ước tính',
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xff999999),
                                                        fontSize:
                                                            14 * curScaleFactor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      )),
                                                  Text(
                                                      endTime != null
                                                          ? DateFormat.yMd()
                                                              .format(endTime)
                                                          : '',
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xff333333),
                                                        fontSize:
                                                            14 * curScaleFactor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      )),
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    187.5 *
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    333.5 *
                                                    10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Tự động ghi chép',
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xff1a1a1a),
                                                        fontSize:
                                                            14 * curScaleFactor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      )),
                                                  Switch(
                                                    value: autoNote,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        autoNote = value;
                                                      });
                                                    },
                                                    activeTrackColor:
                                                        Color(0xff18CE8C),
                                                    activeColor: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    187.5 *
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    333.5 *
                                                    4,
                                              ),
                                              Container(
                                                child: IntrinsicHeight(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Container(
                                                        child: Expanded(
                                                          flex: 6,
                                                          child: InkWell(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  showTitleActions:
                                                                      true,
                                                                  minTime:
                                                                      DateTime
                                                                          .now(),
                                                                  // maxTime: DateTime(2019, 6, 7),
                                                                  onChanged:
                                                                      (date) {
                                                                print(DateFormat
                                                                        .yMMMMEEEEd()
                                                                    .format(
                                                                        date));
                                                              }, onConfirm:
                                                                      (date) {
                                                                // print('confirm $date');
                                                                setState(() {
                                                                  autoNoteDate =
                                                                      date;
                                                                });
                                                              },
                                                                  currentTime:
                                                                      startTime,
                                                                  locale:
                                                                      LocaleType
                                                                          .vi);
                                                            },
                                                            child: Card(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            12,
                                                                        horizontal:
                                                                            16),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          // height: double.infinity,
                                                                          margin:
                                                                              EdgeInsets.only(right: 26),
                                                                          child:
                                                                              Icon(
                                                                            Icons.calendar_today_outlined,
                                                                            color:
                                                                                Color(0xff12B281),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          autoNoteDate != null
                                                                              ? DateFormat('EEE, MMM dd, yyyy').format(autoNoteDate)
                                                                              : '',
                                                                          style:
                                                                              TextStyle(color: Color(0xff12B281)),
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
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              DropdownButtonFormField<
                                                                  String>(
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)))),
                                                            value:
                                                                autoNoteFrequency,
                                                            items: listFrequency
                                                                .map((value) =>
                                                                    DropdownMenuItem(
                                                                      child: Text(
                                                                          value),
                                                                      value:
                                                                          value,
                                                                    ))
                                                                .toList(),
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                autoNoteFrequency =
                                                                    value
                                                                        .toString();
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
                            SizedBox(
                              child: Container(
                                width: MediaQuery.of(context).size.width /
                                    187.5 *
                                    171.5,
                                height: MediaQuery.of(context).size.height /
                                    333.5 *
                                    24,
                                margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height /
                                      333.5 *
                                      16,
                                ),
                                child: ElevatedButton(
                                  child: Text('Lưu mục tiêu'.toUpperCase()),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Map<String, dynamic> submitData = {
                                        'currency': selectedCurrency,
                                        'goal': double.parse(savingTarget.text),
                                        'savedMoney':
                                            double.parse(savedMoney.text),
                                        'startTime':
                                            Timestamp.fromDate(startTime),
                                        'endTime': Timestamp.fromDate(endTime),
                                        'autoNote': autoNote,
                                        'savingAverage': _character ==
                                                SingingCharacter.calculate
                                            ? double.parse(savingAverage.text)
                                            : null,
                                        'frequency': selectedFrequency,
                                        'autoNoteDate': autoNoteDate == null
                                            ? null
                                            : Timestamp.fromDate(autoNoteDate),
                                        'autoNoteFrequency': autoNoteFrequency,
                                        'isCalculated': _character ==
                                                SingingCharacter.calculate
                                            ? true
                                            : false
                                      };
                                      print('da toi day');
                                      submitData.addAll(widget.data);
                                      Navigator.pop(context, submitData);
                                    } else
                                      print('invalidate Form');
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
