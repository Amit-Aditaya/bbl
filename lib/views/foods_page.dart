import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Food Menu',
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(height: 50),
            FittedBox(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                height: 160,
                width: MediaQuery.of(context).size.width * .98,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      child: Container(
                        // width: 160,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [AppShadows.buttonShadow],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'fastFoodPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/Burger-01.svg',
                                  height: 85,
                                  width: 85,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              height: 22,
                              color: Colors.transparent,
                              child: const Center(
                                child: Text(
                                  'Fast Food',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //    const Spacer(),
                    FittedBox(
                      child: Container(
                        // width: 160,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [AppShadows.buttonShadow],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'drinksPage');
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/Lime-Juice.svg',
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              height: 22,
                              color: Colors.transparent,
                              child: const Center(
                                child: Text(
                                  'Drinks',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              height: 160,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //width: 160,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [AppShadows.buttonShadow],
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'iceCreamPage');
                            },
                            icon: SvgPicture.asset(
                              'assets/images/10-ice-cream.svg',
                              height: 100,
                              width: 100,
                              //fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 22,
                          color: Colors.transparent,
                          child: const Center(
                            child: Text('Ice Cream',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  const Spacer(),
                  Container(
                    // width: 160,
                    color: Colors.transparent,
                    child: Column(children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppShadows.buttonShadow],
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'desertsPage');
                          },
                          icon: SvgPicture.asset(
                            'assets/images/Muffin.svg',
                            height: 120,
                            width: 120,
                            //fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        height: 22,
                        color: Colors.transparent,
                        child: const Center(
                          child: Text('Desserts',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
