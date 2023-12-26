import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class AppButton extends StatelessWidget {
  //const AppButton({Key? key}) : super(key: key);
  double height;
  double width;
  String text;
  AppButton({required this.height, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [AppShadows.buttonShadow],
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFDC830),
            Color(0xffF37335),
          ],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [AppShadows.buttonShadow],
          ),
        ),
      ),
    );
  }
}
