import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_offer_stamp.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class MembershipCard extends StatefulWidget {
  final int id;
  final String packageName;
  final String packageTitle;
  final int discountPrice;
  final int regularPrice;
  final int duration;
  final String packageValue;
  final String packageDescription;
  final String packageType;

  const MembershipCard(
      {Key? key,
      required this.id,
      required this.packageName,
      required this.packageTitle,
      required this.discountPrice,
      required this.regularPrice,
      required this.duration,
      required this.packageValue,
      required this.packageDescription,
      required this.packageType,
      ikj})
      : super(key: key);

  @override
  State<MembershipCard> createState() => _MembershipCardState();
}

class _MembershipCardState extends State<MembershipCard> {
  late TextStyle _textStyle;

  @override
  void initState() {
    _textStyle = TextStyle(
        color: AppColors.textGrey2, fontSize: 16, fontWeight: FontWeight.w500);
    super.initState();
  }

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
          color: widget.duration == 30
              ? const Color(0xffd8f092)
              : widget.duration == 90
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
                  color: widget.duration == 30
                      ? const Color(0xffd8f092)
                      : widget.duration == 90
                          ? const Color(0xff97eef7)
                          : const Color(0xffb8a1ff),
                ),
                child: Center(
                  child: Text(
                    widget.packageTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Duration: ${widget.packageName}',
                textAlign: TextAlign.center,
                style: _textStyle, // DRY implementation
              ),
              const Spacer(),
              widget.regularPrice == widget.discountPrice
                  ? const SizedBox(height: 0)
                  : Text(
                      'Regular Price: ${widget.regularPrice}',
                      style: TextStyle(
                        color: Colors.red.withOpacity(.75),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
              Text(
                'Price: ৳${widget.discountPrice}',
                style: _textStyle.copyWith(
                    fontWeight: FontWeight.bold), // DRY implementation
              ),
              const Spacer(),
              Text(
                'Unlimited time and visit for ${widget.duration} days',
                style: _textStyle, // DRY implementation
              ),
              const Spacer(),
            ],
          ),
          widget.regularPrice - widget.discountPrice != 0
              ? Positioned(
                  top: -10,
                  right: 5,
                  child: widget.id == 361
                      ? MembershipOfferStamp(
                          text:
                              '${(((widget.regularPrice - widget.discountPrice) / widget.regularPrice) * 100).toStringAsFixed(0)}% OFF',
                          color: Colors.red)
                      : const Text(''),
                )
              : const Text(''),
        ],
      ),
    );
  }
}
