import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class ShowsPage extends StatelessWidget {
  const ShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Shows',
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'There are no active shows at the moment',
          style: TextStyle(
            color: AppColors.textGrey2,
          ),
        ),
      ),
    );
  }
}
