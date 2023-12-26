import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/child_circle_avatar.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinalRemedyPage extends StatelessWidget {
  const FinalRemedyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Final Remedy',
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 35),
              const ChildCircleAvatar(),
              const SizedBox(height: 15),
              const Text(
                'Child',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Symptoms',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.transparent,
                child: Text(
                  'Vestibulum non lorem ac enim viverra mattis malesuada eu. Maecenas nisl ligula, vulputate at vehicula non, rutrum et odio. Nunc vestibulum lorem sit amet tempor elementum.',
                  style: TextStyle(color: AppColors.textGrey2, fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Remedy',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.transparent,
                child: Text(
                  'Cras malesuada mauris eget scelerisque lobortis. In in libero sem. Proin faucibus magna at quam posuere ullamcorper. Curabitur a tortor vitae elit dignissim placerat id et quam. Cras vitae odio ac velit viverra elementum. Pellentesque condimentum enim non ex luctus, ut imperdiet ante maximus. Vestibulum a feugiat turpis, sed bibendum felis. Donec vitae mi eget nulla dapibus ullamcorper. Nunc a orci id lacus mollis varius vitae vitae ipsum. Vivamus luctus sodales aliquet. Nullam vel mi vel tortor mollis euismod et id ante. Vestibulum non lorem ac enim viverra mattis malesuada eu mauris. Maecenas nisl ligula, vulputate at vehicula non, rutrum et odio. Nunc vestibulum lorem sit amet tempor elementum.',
                  style: TextStyle(color: AppColors.textGrey2, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
