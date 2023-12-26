import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class ClassDetailsCard extends StatelessWidget {
  final String branchName;
  final String day;
  final String time;
  const ClassDetailsCard({
    Key? key,
    required this.branchName,
    required this.day,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeSplit = time.split(' - ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          branchName,
          style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 5),
        Container(
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [AppShadows.buttonShadow],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              color: Colors.transparent,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 2.5,
                horizontal: 5,
              ),
              child: Center(
                child: Text(
                  day,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 2.5,
                horizontal: 5,
              ),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 2.5),
              color: Colors.transparent,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 2.5,
                horizontal: 5,
              ),
              child: Text(
                '${timeSplit[0]}.\n to \n ${timeSplit[1]}',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
