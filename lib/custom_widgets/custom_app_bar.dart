import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;
  final Color backgroundColor;
  CustomAppBar({required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      //elevation: 2,
      elevation: 0,
      iconTheme: backgroundColor == Colors.white
          ? IconThemeData(color: AppColors.primaryColor)
          : const IconThemeData(color: Colors.white),

      title: Text(
        title,
        style: TextStyle(
            color: backgroundColor == Colors.white
                ? AppColors.primaryColor
                : Colors.white),
      ),
    );
  }
}
