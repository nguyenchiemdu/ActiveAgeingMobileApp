import 'package:flutter/material.dart';

class EditRetirementPlan extends StatelessWidget {
  EditRetirementPlan(this.dataPlan, {Key? key}) : super(key: key);
  // final Function addRetirementPlan;
  final Map dataPlan;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController currentAge;
  late TextEditingController retirementAge;
  late TextEditingController income;
  late TextEditingController increase;
  late TextEditingController saving;
  late TextEditingController yearsRetirement;
  //----------
  late TextEditingController annualSaving;
  late TextEditingController retirementPay;
  late TextEditingController rateBefore;
  late TextEditingController rateAfter;
  late TextEditingController pension;
  @override
  Widget build(BuildContext context) {
    print('build lai');
    currentAge = TextEditingController(
        text: (dataPlan['currentAge']).round().toString());
    retirementAge = TextEditingController(
        text: dataPlan['retirementAge'].round().toString());
    income = TextEditingController(text: dataPlan['income'].toString());
    increase = TextEditingController(text: dataPlan['increase'].toString());
    saving = TextEditingController(text: dataPlan['saving'].toString());
    yearsRetirement = TextEditingController(
        text: dataPlan['yearsRetirement'].round().toString());
    //----------
    annualSaving =
        TextEditingController(text: dataPlan['annualSaving'].toString());
    retirementPay =
        TextEditingController(text: dataPlan['retirementPay'].toString());
    rateBefore = TextEditingController(text: dataPlan['rateBefore'].toString());
    rateAfter = TextEditingController(text: dataPlan['rateAfter'].toString());
    pension = TextEditingController(text: dataPlan['pension'].toString());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          // width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(dataPlan['namePlan']),
              Text('Basic information'),
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
                      Text('Financial Information'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '1. Annual retirement savings as a percentage of income (%)'),
                          Text('What is this ?'),
                        ],
                      ),
                      TextFormField(
                        controller: annualSaving,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực!';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2. Income required at retirement (%)'),
                          Text('What is this ?'),
                        ],
                      ),
                      TextFormField(
                        controller: retirementPay,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực!';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '3. Expected rate of return before retirement (%)'),
                          Text('What is this ?'),
                        ],
                      ),
                      TextFormField(
                        controller: rateBefore,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực!';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '4. Expected rate of return during retirement (%)'),
                          Text('What is this ?'),
                        ],
                      ),
                      TextFormField(
                        controller: rateAfter,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực!';
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '5. Pension/Other Post-Retirement Income (mil VND)'),
                          Text('What is this ?'),
                        ],
                      ),
                      TextFormField(
                        controller: pension,
                        validator: (value) {
                          if (double.tryParse(value.toString()) == null)
                            return 'Hãy nhập vào 1 số thực!';
                          return null;
                        },
                      )
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map tmp = {
                        'namePlan': dataPlan['namePlan'],
                        'currentAge': double.parse(currentAge.text),
                        'retirementAge': double.parse(retirementAge.text),
                        'income': double.parse(income.text),
                        'increase': double.parse(increase.text),
                        'saving': double.parse(saving.text),
                        'yearsRetirement': double.parse(yearsRetirement.text),
                        //======
                        'annualSaving': double.parse(annualSaving.text),
                        'retirementPay': double.parse(retirementPay.text),
                        'rateBefore': double.parse(rateBefore.text),
                        'rateAfter': double.parse(rateAfter.text),
                        'pension': double.parse(pension.text),
                      };
                      // print(tmp);
                      Navigator.pop(context, tmp);
                      // data.addAll(tmp);
                      // Navigator.pop(context);
                      // Navigator.pop(context);
                      // Navigator.pop(context);
                      // addRetirementPlan(data);
                    }
                  },
                  child: Text('Lưu thay đổi'.toUpperCase())),
            ],
          ),
        ),
      ),
    );
  }
}
