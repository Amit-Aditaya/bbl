import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class AppBottomNavigationBar extends StatefulWidget {
  int index;
  // PageController pageController;
  AppBottomNavigationBar({
    Key? key,
    required this.index,
    // required this.pageController,
  }) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1, bottom: 15, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [AppShadows.buttonShadow],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.qrcode_viewfinder),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),
          ],
          currentIndex: widget.index,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          onTap: (index) {
            // widget.pageController.jumpToPage(
            //   index,
            // );
            if (index == 1) {
              Navigator.pushNamed(context, 'scanCouponPage');
              //   Navigator.pushNamed(context, 'quizPage');
            } else if (index == 2) {
              Navigator.pushNamed(context, 'profilePage');
            } else if (index == 3) {
              Navigator.pushNamed(context, 'locationPage');
            } else if (index == 0) {
              setState(() {});
            }
          },
        ),
      ),
    );
  }
}
