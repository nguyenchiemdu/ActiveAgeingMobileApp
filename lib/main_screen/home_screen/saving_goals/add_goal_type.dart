import 'package:flutter/material.dart';

import 'add_goal_name.dart';

class AddGoalType extends StatefulWidget {
  const AddGoalType({Key? key}) : super(key: key);

  @override
  _AddGoalTypeState createState() => _AddGoalTypeState();
}

class _AddGoalTypeState extends State<AddGoalType> {
  int _selectedIndex = -1;
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
      body: Center(
        child: Container(
          child: Column(children: [
            Container(
              width: (MediaQuery.of(context).size.width) / 187.5 * 8,
              height: (MediaQuery.of(context).size.height) / 333.5 * 16,
            ),
            Container(
              width: (MediaQuery.of(context).size.width) / 187.5 * 171.5,
              child: new Text("Bạn tiết kiệm cho\n mục tiêu gì?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xff4d4d4d),
                    fontSize: 20 * curScaleFactor,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) / 187.5 * 8,
              height: (MediaQuery.of(context).size.height) / 333.5 * 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 0
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Học tập",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 0
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                  height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 1
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.car_rental_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Xe hơi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 1
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                  height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 2
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.computer_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Thiết bị điện tử",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 2
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: (MediaQuery.of(context).size.width) / 187.5 * 4,
              height: (MediaQuery.of(context).size.height) / 333.5 * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 3
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pie_chart_outline_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Đầu tư",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 3
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                  height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 4
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wheelchair_pickup_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Kế hoạch về hưu",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 4
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                  height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 5;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 5
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.house_siding_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Nhà và Căn hộ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 5
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: (MediaQuery.of(context).size.width) / 187.5 * 4,
              height: (MediaQuery.of(context).size.height) / 333.5 * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 6;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 6
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wallet_giftcard_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Quà tặng",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 6
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                  height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 7;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 7
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.travel_explore_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Du lịch",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 7
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                  height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 8;
                    });
                  },
                  child: Ink(
                    width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                    height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex == 8
                                ? Color(0xff12B281)
                                : Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.music_video_rounded, color: Color(0xff666666), size: 30,),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) / 187.5 * 1,
                          height:
                              (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        new Text("Giải trí",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: _selectedIndex == 8
                                  ? Color(0xff12B281)
                                  : Color(0xff666666),
                              fontSize: 12 * curScaleFactor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // DropdownButton<String>(
            //   value: _goalType,
            //   icon: const Icon(Icons.arrow_downward),
            //   iconSize: 24,
            //   elevation: 16,
            //   style: const TextStyle(color: Colors.deepPurple),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _goalType = newValue!;
            //     });
            //   },
            //   items: _listType.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width / 187.5 * 171.5,
                  height: MediaQuery.of(context).size.height / 333.5 * 24,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 333.5 * 16,
                  ),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_selectedIndex == -1) return;
                        var submitData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddGoalName(
                                    {'type': _listType[_selectedIndex]})));
                        if (submitData != null)
                          Navigator.pop(context, submitData);
                      },
                      child: Text('TIẾP THEO'.toUpperCase())),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
