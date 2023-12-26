import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/child_circle_avatar.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class HealthyFoodRecepiePage extends StatelessWidget {
  const HealthyFoodRecepiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Recepie',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    'https://natashaskitchen.com/wp-content/uploads/2019/02/Greek-Salad.jpg',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Food Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                child: Text(
                  'Ingredients',
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
              const SizedBox(height: 25),
              Center(
                child: Text(
                  'Recepie',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Text(
                    'Vestibulum non lorem ac enim viverra mattis malesuada eu. Maecenas nisl ligula, vulputate at vehicula non, rutrum et odio. Nunc vestibulum lorem sit amet tempor elementum. Vestibulum non lorem ac enim viverra mattis malesuada eu. Maecenas nisl ligula, vulputate at vehicula non, rutrum et odio. Nunc vestibulum lorem sit amet tempor elementum.',
                    style: TextStyle(color: AppColors.textGrey2, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
