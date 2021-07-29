import 'package:flutter/material.dart';

class AddRetirementFinancial extends StatelessWidget {
  AddRetirementFinancial(this.data, this.addRetirementPlan, {Key? key})
      : super(key: key);
  final Function addRetirementPlan;
  final Map data;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController annualSaving = TextEditingController();
  final TextEditingController retirementPay = TextEditingController();
  final TextEditingController rateBefore = TextEditingController();
  final TextEditingController rateAfter = TextEditingController();
  final TextEditingController pension = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text(data['namePlan']),
            Text('Financial Information'),
            Text(
                'Hoàn thành biểu mẫu sau và máy sẽ tính toán giúp bạn về mục tiêu về hưu.'),
            Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map tmp = {
                      'annualSaving': double.parse(annualSaving.text),
                      'retirementPay': double.parse(retirementPay.text),
                      'rateBefore': double.parse(rateBefore.text),
                      'rateAfter': double.parse(rateAfter.text),
                      'pension': double.parse(pension.text),
                    };
                    data.addAll(tmp);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    addRetirementPlan(data);
                  }
                },
                child: Text('Xem kế hoạch'.toUpperCase()))
          ],
        ),
      ),
    );
  }
}
