import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class ChildVaccineAgeListPage extends StatelessWidget {
  const ChildVaccineAgeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Child Age',
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        width: double.infinity,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'finalChildVaccineInfoPage');
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [AppShadows.buttonShadow],
                  color: Colors.white,
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                child: Center(
                  child: Text(
                    '$index Months',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
