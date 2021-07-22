import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyUnit extends StatelessWidget {
  CurrencyUnit(this.unit, this.isSelected, this.updateStatus, {Key? key})
      : super(key: key);
  final String unit;
  final bool isSelected;
  final Function updateStatus;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.money),
      title: Text(unit),
      trailing: isSelected ? Icon(Icons.verified) : null,
      onTap: () {
        updateStatus(unit);
      },
    );
  }
}
