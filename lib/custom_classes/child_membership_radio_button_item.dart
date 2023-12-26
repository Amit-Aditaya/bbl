import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class CustomChildMembershipRadioButtonItem extends StatelessWidget {
  //const CustomChildMembershipRadioButtonItem({Key? key}) : super(key: key);

  String text;
  bool isActive;
  int id;

  CustomChildMembershipRadioButtonItem(this.id, this.text, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7.5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.primaryColor, width: 2),
        color: isActive == true ? AppColors.primaryColor : Colors.white,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : AppColors.primaryColor,
          fontSize: 16,
        ),
      )),
    );
  }
}
