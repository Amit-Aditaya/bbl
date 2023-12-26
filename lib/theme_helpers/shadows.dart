import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppShadows {
  static BoxShadow buttonShadow = BoxShadow(
    blurRadius: 4,
    spreadRadius: 0,
    color: Colors.black.withOpacity(0.3),
    offset: const Offset(0, 4),
  );

  static BoxShadow buttonShadow2 = BoxShadow(
    blurRadius: 4,
    spreadRadius: 2,
    color: Colors.black.withOpacity(0.075),
    offset: const Offset(0, 4),
  );
}
