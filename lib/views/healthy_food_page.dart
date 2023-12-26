import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/child_circle_avatar.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/mom_circle_avatar.dart';

class HealthyFoodPage extends StatelessWidget {
  const HealthyFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Healthy Food',
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: 70),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'healthyFoodTypePage');
              },
              child: const ChildCircleAvatar(),
            ),
            const SizedBox(height: 10),
            const Text(
              'Child',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 60),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'healthyFoodTypePage');
              },
              child: const MomcircleAvatar(),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mom',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
