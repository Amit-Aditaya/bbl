import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_booking_page.dart';

class SlotBookingMediatorPage extends StatelessWidget {
  const SlotBookingMediatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Slot Booking',
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'bookedSlotsPage');
            },
            child: AppButton(
              height: 60,
              width: 275,
              text: 'My Booked Slots',
            ),
          ),
          // InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, 'slotBookingPage',
          //           arguments:
          //               SlotBookingPage(couponCodepk: null, couponCode: null));
          //     },
          //     child: AppButton(
          //       height: 60,
          //       width: 275,
          //       text: 'Book A Slot',
          //     )),
        ],
      )),
    );
  }
}
