import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
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
                  SvgPicture.asset(
                    'assets/images/no-wifi.svg',
                    height: 125,
                    width: 125,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'No Internet',
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 24),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Please make sure you have a stable internet connection',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.textGrey2, fontSize: 16),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
