import 'package:flutter/material.dart';

class MyLeastUpdateWidget extends StatelessWidget {
  const MyLeastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Son güncellenme: " + const TimeOfDay(hour: 15, minute: 50).format(context),
      textScaleFactor: 1.3,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
