import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MomcircleAvatar extends StatelessWidget {
  const MomcircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: Colors.pinkAccent.shade100,
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.pink.shade100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SvgPicture.asset(
          'assets/images/mother-2.svg',
          height: 90,
          width: 90,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
