import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class SlotBookingCard extends StatelessWidget {
  // const SlotBookingCard({Key? key}) : super(key: key);
  final String eventTitle;
  final String eventDetails;

  const SlotBookingCard(
      {Key? key, required this.eventTitle, required this.eventDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppShadows.buttonShadow],
        borderRadius: BorderRadius.circular(20),
      ),
      // child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //   Container(
      //     height: 200,
      //     width: double.infinity,
      //     //  margin: const EdgeInsets.symmetric(horizontal: 10),
      //     decoration: BoxDecoration(
      //         color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      //   ),
      //   const SizedBox(height: 15),
      //   Text(
      //     //state.slotBookingEventModel.items[index].sbeTitle,
      //     eventTitle,
      //     style: TextStyle(
      //         color: AppColors.primaryColor,
      //         fontSize: 16,
      //         fontWeight: FontWeight.bold),
      //     textAlign: TextAlign.start,
      //   ),
      //   const SizedBox(height: 5),
      //   // Text(
      //   //   '${state.slotBookingEventModel.items[index].visibilityStartDate}-${state.slotBookingEventModel.items[index].visibilityEndDate}',
      //   //   style: TextStyle(
      //   //       fontWeight: FontWeight.bold,
      //   //       color: AppColors.textGrey2,
      //   //       fontSize: 14),
      //   // ),
      // ]),
      child: Column(
        children: [
          Center(
            child: Text(
              eventTitle,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: Text(
              eventDetails,
              style: TextStyle(
                  color: AppColors.textGrey2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
