import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:flutter/material.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({Key? key}) : super(key: key);

  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  List<String> listPerson = [];
  var selectedPerson;
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  fetchData() async {
    List<String> listTmp = await UserDatabase().getListPersons();
    setState(() {
      listPerson = listTmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final width = MediaQuery.of(context).size.width;
    final appBar = AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xffecf9f4),
          fontSize: 16 * curScaleFactor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        title: Text("Chi tiết giao dịch"));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                initialIndex: 1,
                child: Column(
                  children: [
                    TabBar(
                        onTap: (index) {
                          //your currently selected index
                        },
                        labelColor: Color(0xff12B281),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Text('Thêm mới'.toUpperCase()),
                          ),
                          Tab(
                            child: Text('Danh bạ'.toUpperCase()),
                          ),
                        ]),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height) /
                          333.5 *
                          298,
                      child: TabBarView(
                        // controller: _tabController ,
                        children: [AddNewPerson(), Text('Tab2')],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewPerson extends StatelessWidget {
  const AddNewPerson({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Thêm người cho vay'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Thêm mới'))
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact(this.listPerson, this.selectedPerson, {Key? key})
      : super(key: key);
  final List<String> listPerson;
  final selectedPerson;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: listPerson.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(listPerson[index]),
                      selectedPerson == listPerson[index]
                          ? Icon(Icons.done)
                          : Container()
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
