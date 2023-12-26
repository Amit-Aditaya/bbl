import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/views/scan_coupon_page.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: 'Coupons',
      ),
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'scanCouponPage');
                },
                child:
                    AppButton(height: 60, width: 270, text: 'Scan A Coupon'))),
        const SizedBox(height: 30),
        Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'myCouponsPage');
                },
                child: AppButton(height: 60, width: 270, text: 'My Coupons'))),
      ]),
    );
  }
}
