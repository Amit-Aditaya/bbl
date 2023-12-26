import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:notification_permissions/notification_permissions.dart';

class MyTicketsMediatorPage extends StatelessWidget {
  const MyTicketsMediatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'My Tickets',
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'validTicketsPage');
              },
              child: AppButton(
                width: 270,
                height: 60,
                text: ' Valid Tickets',
              ),
            ),
          ),
          const SizedBox(height: 35),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'expiredTicketsPage');
              },
              // child: Container(
              //   height: 90,
              //   width: 290,
              //   decoration: BoxDecoration(
              //       boxShadow: [AppShadows.buttonShadow],
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.white,
              //       border:
              //           Border.all(color: AppColors.primaryColor, width: 8)),
              //   child: Center(
              //       child: Text(
              //     'Expired & Used \n Tickets',
              //     style: TextStyle(
              //         color: AppColors.primaryColor,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 21),
              //     textAlign: TextAlign.center,
              //   )),
              // ),
              child: AppButton(
                height: 60,
                width: 270,
                text: 'Expired & Used Tickets',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
