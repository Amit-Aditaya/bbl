import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/rating_prompt_class.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/new_login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    'assets/images/logo_svg.svg',
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  Platform.isAndroid ? 'version 3.1.2' : 'version 1.2.1',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.price_change,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Tickets',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'ticketsPage');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Ticket History',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'myTicketsPage');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.card_membership_outlined,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Membership',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'membershipPage');
            },
          ),
          // ListTile(
          //   leading: Container(
          //     height: 25,
          //     width: 25,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: AppColors.primaryColor, width: 2),
          //       borderRadius: BorderRadius.circular(50),
          //       color: Colors.white,
          //     ),
          //     child: Center(
          //         child: Text(
          //       'B',
          //       style: TextStyle(
          //         color: AppColors.primaryColor,
          //         fontWeight: FontWeight.bold,
          //         //  fontSize: 14,
          //       ),
          //     )),
          //   ),
          //   title: Text(
          //     'Reward Points',
          //     style: TextStyle(color: AppColors.primaryColor),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, 'rewardPointsHistoryPage');
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.watch_later_rounded,
          //     color: AppColors.primaryColor,
          //   ),
          //   title: Text(
          //     'Opening Hours',
          //     style: TextStyle(color: AppColors.primaryColor),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, 'openingHoursPage');
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.people_alt,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Guest Volume',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'guestVolumePage');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.stars_sharp,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Send Review',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              RatingPrompt.ratingPromptShowDialogue(context);
            },
          ),
          const Divider(
            thickness: 2,
            endIndent: 15,
            indent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Our Branches',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'locationPage');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Customer Care',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'customerCarePage');
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.info_outline_rounded,
          //     color: AppColors.primaryColor,
          //   ),
          //   title: Text(
          //     'About Babuland',
          //     style: TextStyle(color: AppColors.primaryColor),
          //   ),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onTap: () async {
              final _auth = FirebaseAuth.instance;
              await _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => NewLoginPage())));
            },
          ),
        ],
      ),
    );
  }
}
