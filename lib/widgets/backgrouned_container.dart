import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  const BackgroundContainer(
      {Key? key, required this.child, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        color[700] as Color,
        color[500] as Color,
        color[200] as Color
      ],begin: Alignment.topCenter,end: Alignment.bottomCenter,stops:const [0.6,0.8,1])),
    );
  }
}
