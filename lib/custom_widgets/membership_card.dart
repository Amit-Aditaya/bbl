import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_offer_stamp.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class MembershipCard extends StatelessWidget {
  final int id;
  final String packageName;
  final String packageTitle;
  final int discountPrice;
  final int regularPrice;
  final int duration;
  final String packageValue;
  final String packageDescription;
  final String packageType;

  const MembershipCard({
    Key? key,
    required this.id,
    required this.packageName,
    required this.packageTitle,
    required this.discountPrice,
    required this.regularPrice,
    required this.duration,
    required this.packageValue,
    required this.packageDescription,
    required this.packageType, ikj
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: duration == 30
              ? const Color(0xffd8f092)
              : duration == 90
                  ? const Color(0xff97eef7)
                  : const Color(0xffb8a1ff),
        ),
        color: Colors.transparent,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13)),
                  color: duration == 30
                      ? const Color(0xffd8f092)
                      : duration == 90
                          ? const Color(0xff97eef7)
                          : const Color(0xffb8a1ff),
                ),
                child: Center(
                  child: Text(
                    packageTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Duration: $packageName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.textGrey2,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              regularPrice == discountPrice
                  ? const SizedBox(height: 0)
                  : Text(
                      'Regular Price: $regularPrice',
                      style: TextStyle(
                        color: Colors.red.withOpacity(.75),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
              Text(
                'Price: ৳$discountPrice',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                'Unlimited time and visit for $duration days',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey2),
              ),
              const Spacer(),
            ],
          ),
          regularPrice - discountPrice != 0
              ? Positioned(
                  top: -10,
                  right: 5,
                  child: id == 361
                      ? MembershipOfferStamp(
                          text:
                              '${(((regularPrice - discountPrice) / regularPrice) * 100).toStringAsFixed(0)}% OFF',
                          color: Colors.red)
                      : const Text(''),
                )
              : const Text(''),
        ],
      ),
    );
  }
}
