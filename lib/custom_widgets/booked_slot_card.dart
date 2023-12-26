import 'package:custom_clippers/Clippers/multiple_points_clipper.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BookedSlotCard extends StatelessWidget {
  //const BookedSlotCard({Key? key}) : super(key: key);

  final String bookingDate;
  final String bookingTime;
  final String branch;
  final int bookingId;

  const BookedSlotCard(
      {Key? key,
      required this.bookingDate,
      required this.bookingTime,
      required this.branch,
      required this.bookingId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DateFormat dateformat = DateFormat('dd-MMM-yyyy');
    DateTime d = DateFormat('dd-MMM-yyyy').parse(bookingDate);
    // print(d);
    return Container(
      margin: const EdgeInsets.all(5),
      height: 210,
      width: 180,
      color: Colors.transparent,
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: d.isBefore(DateTime.now().subtract(Duration(days: 1)))
                ? const Color(0xfff4f4f4)
                : const Color(0xffD3FB93),
            borderRadius: BorderRadius.circular(10),
            // border: d.isBefore(DateTime.now())
            //     ? Border.all(color: const Color(0xffc4c4c4), width: 1.5)
            //     : Border.all(color: const Color(0xff93C640), width: 1.5),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'SL: $bookingId',
                  style: const TextStyle(fontSize: 11),
                ),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color:
                          d.isBefore(DateTime.now().subtract(Duration(days: 1)))
                              ? const Color(0xffc4c4c4)
                              : const Color(0xff93C640),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    branch,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  )),
                ),
                Text(
                  bookingDate,
                ),
              ]),
        ),
        Expanded(
          child: Container(
            //  height: 100,
            width: double.infinity,
            color: Colors.transparent,
            child: Row(children: [
              Container(width: 30, color: Colors.transparent),
              Expanded(
                child: ClipPath(
                  clipper: MultiplePointsClipper(Sides.BOTTOM,
                      heightOfPoint: 7.5, numberOfPoints: 10),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    color: const Color(0xfff4f4f4),
                    child: Stack(children: [
                      Center(
                          child: Text(
                        bookingTime,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGrey2),
                        textAlign: TextAlign.center,
                      )),
                      d.isBefore(DateTime.now().subtract(Duration(days: 1)))
                          ? Center(
                              child: SvgPicture.asset(
                                'assets/images/expired.svg',
                                height: 60,
                                width: 60,
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          : const SizedBox(
                              height: 1,
                            ),
                    ]),
                  ),
                ),
              ),
              Container(width: 30, color: Colors.transparent),
            ]),
          ),
        ),
      ]),
    );
  }
}
