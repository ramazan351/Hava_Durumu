import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLocationWidget extends StatelessWidget {
  const MyLocationWidget({Key? key,@required String? city}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text("Ankara",textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold),);
  }
}
