import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class FinalMomVaccineInfoPage extends StatelessWidget {
  const FinalMomVaccineInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Vaccine Info',
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            const Center(
              child: CircleAvatar(
                radius: 75,
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Vaccine Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Reason for taking the Vaccine',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Text(
                'Vestibulum non lorem ac enim viverra mattis malesuada eu. rutrum et odio. Nunc vestibulum lorem sit amet tempor elementum.',
                style: TextStyle(color: AppColors.textGrey2, fontSize: 15),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Text(
                'Locations',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              //margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.transparent,
              child: Text(
                '• vestibulum non lorem ac enim\n• viverra mattis malesuada eu.\n• Maecenas nisl ligula, \n• vulputate at vehicula non, \n• rutrum et odio. Nunc vestibulum lorem sit\n• amet tempor elementum.',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.textGrey2, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
