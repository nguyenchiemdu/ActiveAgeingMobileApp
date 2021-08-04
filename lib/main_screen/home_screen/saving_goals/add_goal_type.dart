import 'package:flutter/material.dart';

import 'add_goal_name.dart';

class AddGoalType extends StatefulWidget {
  const AddGoalType({Key? key}) : super(key: key);

  @override
  _AddGoalTypeState createState() => _AddGoalTypeState();
}

class _AddGoalTypeState extends State<AddGoalType> {
  var _goalType = 'Learn';
  final List<String> _listType = [
    'Learn',
    'Car',
    'device',
    'investment',
    'retirement',
    'house',
    'gift',
    'travel',
    'entertainment'
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
          child:
              Column(
                  children: [
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
                      Container(
                        width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                        height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/education_icon.png"),
                            Container(
                              width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                              height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                            ),
                            new Text("Học tập",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff666666),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                        height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                        height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                        decoration : BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/car_icon.png"),
                            Container(
                              width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                              height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                            ),
                            new Text("Xe hơi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff666666),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                        height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                        height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                        decoration : BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/computer_icon.png"),
                            Container(
                              width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                              height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                            ),
                            new Text("Thiết bị điện tử",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xff666666),
                                  fontSize: 12 * curScaleFactor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
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
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                          decoration : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/invest_icon.png"),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                                height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                              ),
                              new Text("Đầu tư",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff666666),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                          decoration : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/retirement_icon.png"),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                                height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                              ),
                              new Text("Kế hoạch về hưu",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff666666),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                          decoration : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/house_icon.png"),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                                height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                              ),
                              new Text("Nhà và Căn hộ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff666666),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
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
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                          decoration : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/gift_icon.png"),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                                height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                              ),
                              new Text("Quà tặng",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff666666),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                          decoration : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/flight_icon.png"),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                                height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                              ),
                              new Text("Du lịch",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff666666),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 4,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) / 187.5 * 54.5,
                          height: (MediaQuery.of(context).size.height) / 333.5 * 44,
                          decoration : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/music_icon.png"),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 187.5 * 1,
                                height: (MediaQuery.of(context).size.height) / 333.5 * 4,
                              ),
                              new Text("Giải trí",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xff666666),
                                    fontSize: 12 * curScaleFactor,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),

                      ],
                    ),
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
                    items: _listType.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
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
                                var submitData = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddGoalName({'type': _goalType})));
                                if (submitData != null) Navigator.pop(context, submitData);
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
