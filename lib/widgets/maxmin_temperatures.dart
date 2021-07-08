import 'package:flutter/material.dart';

class MyMaxMinTemperaturesWidget extends StatelessWidget {
  const MyMaxMinTemperaturesWidget({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Maksimum Sıcaklık: " + 24.toString() + "°C",
          textScaleFactor: 1.1,
        ),
        Text("Minimum Sıcaklık: " + 15.toString() + "°C",textScaleFactor: 1.1,)
      ],
    );
  }
}
