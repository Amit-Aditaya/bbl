import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyArc extends StatelessWidget {
  final double diameter;
  final String text;
  final Color color;

  const MyArc(
      {Key? key, this.diameter = 200, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                text,
                style: TextStyle(
                    color: color, fontSize: 30, fontWeight: FontWeight.bold),
              ))),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
