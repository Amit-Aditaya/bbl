import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParentingPage extends StatelessWidget {
  const ParentingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Parenting',
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'remedyPage');
              },
              child: CircleAvatar(
                radius: 62,
                backgroundColor: Colors.brown.shade400,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: SvgPicture.asset(
                      'assets/images/mortar.svg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Home Remedy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 55),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'healthyFoodPage');
              },
              child: CircleAvatar(
                radius: 62,
                backgroundColor: Colors.lightGreen.shade900,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: SvgPicture.asset(
                      'assets/images/salad.svg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Healthy Food',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 55),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'vaccineInfoPage');
              },
              child: CircleAvatar(
                radius: 62,
                backgroundColor: Colors.red.shade500,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: SvgPicture.asset(
                      'assets/images/vaccine.svg',
                      height: 100,
                      width: 100,
                      // fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Vaccine Info',
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
