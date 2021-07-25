import 'package:flutter/material.dart';

class FailWidget extends StatelessWidget {
  const FailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Fail!'),
      ),
    );
  }
}
