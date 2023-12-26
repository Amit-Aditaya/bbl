import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class InternetLoadingPage extends StatelessWidget {
  const InternetLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Trying to connect to the internet',
                  style: TextStyle(fontSize: 18, color: AppColors.textGrey2),
                ),
                const SizedBox(height: 20),
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
