import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerCarePage extends StatelessWidget {
  const CustomerCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Customer Care',
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse("tel://880 1313-428423"));
            },
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue.shade200,
                radius: 70,
                child: SvgPicture.asset(
                  'assets/images/call.svg',
                  height: 60,
                  width: 60,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 17.5,
          ),
          Text(
            'Customer Care',
            style: TextStyle(color: AppColors.textGrey2, fontSize: 16),
          ),
          const SizedBox(height: 60),
          InkWell(
            onTap: () async {
              bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
              if (whatsapp) {
                openWhatsapp();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppColors.primaryRed,
                    content: const Text(
                      'You do not have Whatsapp installed in your device',
                      textAlign: TextAlign.center,
                    )));
              }
            },
            child: Center(
              child: SvgPicture.asset(
                'assets/images/whatsapp.svg',
                height: 140,
                width: 140,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 17.5),
          Text(
            'WhatsApp',
            style: TextStyle(color: AppColors.textGrey2, fontSize: 16),
          ),
        ],
      ),
    );
  }

  void openWhatsapp() async {
    await FlutterLaunch.launchWhatsapp(
        phone: "8801313428423", message: "Hello!!");
  }
}
