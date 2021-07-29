import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'add_retirement_financial.dart';

class AddRetirementBacisInfor extends StatelessWidget {
  AddRetirementBacisInfor(this.name, this.addRetirementPlan, {Key? key})
      : super(key: key);
  final Function addRetirementPlan;
  final String name;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController currentAge = TextEditingController();
  final TextEditingController retirementAge = TextEditingController();
  final TextEditingController income = TextEditingController();
  final TextEditingController increase = TextEditingController();
  final TextEditingController saving = TextEditingController();
  final TextEditingController yearsRetirement = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text(name),
              Text('Basic information'),
              Text(
                  'Hoàn thành biểu mẫu sau và máy sẽ tính toán giúp bạn về mục tiêu về hưu.'),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1.Current age'),
                      TextFormField(
                        controller: currentAge,
                        validator: (value) {
                          if (int.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số nguyên';
                          return null;
                        },
                      ),
                      Text('2. Expected age of retirement'),
                      TextFormField(
                        controller: retirementAge,
                        validator: (value) {
                          if (int.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số nguyên';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('3. Household Income'),
                          InkWell(
                            onTap: () {},
                            child: Text('What is this ?'),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: income,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('4. Expected annual income growth rate (%)'),
                          InkWell(
                            onTap: () {},
                            child: Text('What is this ?'),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: increase,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '5. Current retirement savings balance (mil VND)'),
                          InkWell(
                            onTap: () {},
                            child: Text('What is this ?'),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: saving,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('6. Years of living on retirement savings fund'),
                          InkWell(
                            onTap: () {},
                            child: Text('What is this ?'),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: yearsRetirement,
                        validator: (value) {
                          if (int.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số nguyên';
                          return null;
                        },
                      ),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map data = {
                        'namePlan': name,
                        'currentAge': double.parse(currentAge.text),
                        'retirementAge': double.parse(retirementAge.text),
                        'income': double.parse(income.text),
                        'increase': double.parse(increase.text),
                        'saving': double.parse(saving.text),
                        'yearsRetirement': double.parse(yearsRetirement.text),
                      };
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddRetirementFinancial(
                                  data, addRetirementPlan)));
                    } else {}
                  },
                  child: Text('Tiếp theo'))
            ],
          ),
        ),
      ),
    );
  }
}
