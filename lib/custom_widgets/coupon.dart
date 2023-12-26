import 'package:custom_clippers/Clippers/ticket_pass_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_offer_stamp.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_details_card_2.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class Coupon extends StatelessWidget {
  //const Coupon({Key? key}) : super(key: key);
  final String couponName;
  final int dicountPct;

  const Coupon({Key? key, required this.couponName, required this.dicountPct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TicketDetailsCard2.discountPct = dicountPct;
        TicketDetailsCard2.couponName = couponName;
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.white,
        height: 130,
        width: double.infinity,
        child: ClipPath(
          clipper: TicketPassClipper(holeRadius: 35, position: 80),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 254, 242, 224),
              // border: Border.all(color: AppColors.primaryColor, width: 1.5),
            ),
            height: 100,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          couponName,
                          style: TextStyle(
                              fontSize: 19, color: AppColors.primaryColor),
                        ),
                        Text(
                          '$dicountPct% discount on total order',
                          style: TextStyle(
                              color: AppColors.textGrey2, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //     '${state.couponItemModel.items[index].discPct}% OFF'),
                  MembershipOfferStamp(
                      text: '$dicountPct% OFF',
                      // color: Color.fromARGB(255, 238, 214, 169)),
                      color: AppColors.primaryColor),
                ]),
          ),
        ),
      ),
    );
  }
}
