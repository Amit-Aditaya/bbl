import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChildCircleAvatar extends StatelessWidget {
  const ChildCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.green),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SvgPicture.asset(
          'assets/images/infant.svg',
          height: 35,
          width: 35,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
