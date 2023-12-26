import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/banner_container.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_version/new_version.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Tickets',
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              //   const BannerContainer(),
              const SizedBox(height: 25),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.transparent,
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    boxShadow: [AppShadows.buttonShadow],
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        AppColors.appGradientColor1,
                        AppColors.appGradientColor2
                      ],
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'selectTicketsPage');
                      },
                      child: Container(
                        height: 165,
                        width: 165,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Buy\n Tickets',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 65),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'myTicketsMediatorPage');
                  },
                  child: AppButton(height: 60, width: 275, text: 'My Tickets')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'freeTicketsPage');
                  },
                  child:
                      AppButton(height: 60, width: 275, text: 'Free Tickets')),
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'couponsPage');
                  },
                  child: AppButton(height: 60, width: 275, text: 'Coupons')),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
