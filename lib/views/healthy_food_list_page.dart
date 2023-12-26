import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class HealthyFoodListPage extends StatelessWidget {
  const HealthyFoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Food List',
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'healthyFoodRecepiePage');
                },
                child: Container(
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [AppShadows.buttonShadow],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            margin: const EdgeInsets.all(10),
                          ),
                          Container(
                            height: 50,
                            width: 220,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                'Food List $index',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 20,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
