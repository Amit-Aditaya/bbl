import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/custom_widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/app_drawer.dart';
import 'package:flutter_babuland_app/custom_widgets/home_page_body_container.dart';
import 'package:flutter_babuland_app/custom_widgets/home_page_rp_sum_box.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_version/new_version.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../custom_classes/local_notification.dart';

class HomePage extends StatefulWidget {
  final User? currentUser;
  const HomePage({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 6500), () {
      Future<PermissionStatus> permissionStatus =
          NotificationPermissions.requestNotificationPermissions();

      Platform.isAndroid
          ? OneSignal.shared.setAppId(dotenv.env['ANDROID_ONE_SIGNAL_APP_ID']!)
          : OneSignal.shared.setAppId(dotenv.env['IOS_ONE_SIGNAL_APP_ID']!);
      OneSignal.shared.promptUserForPushNotificationPermission();
    });

    ///version check
    void basicStatusCheck(NewVersion newVersion) {
      newVersion.showAlertIfNecessary(context: context);
    }

    void checkVersion() async {
      final newVersion = NewVersion();
      var versionInfo = await newVersion.getVersionStatus();
      // print(versionInfo?.storeVersion);
      // print(versionInfo?.localVersion);

      if (versionInfo?.localVersion != versionInfo?.storeVersion ||
          versionInfo!.canUpdate) {
        basicStatusCheck(newVersion);
      }
    }

    checkVersion();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          'Home',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        actions: [
          // HomePageRewardPointSumBox(),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'notificationHistoryPage');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                // size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: const HomePageBodyContainer(),
      bottomNavigationBar: AppBottomNavigationBar(
        index: _currentIndex,
      ),
    );
  }
}
