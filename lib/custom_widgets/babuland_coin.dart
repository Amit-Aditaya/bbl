import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class BabulandCoin extends StatelessWidget {
  const BabulandCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(50),
          color: Colors.yellowAccent.shade700),
      child: Center(
          child: Text(
        'B',
        style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 12
            //  fontSize: 14,
            ),
      )),
    );
  }
}
