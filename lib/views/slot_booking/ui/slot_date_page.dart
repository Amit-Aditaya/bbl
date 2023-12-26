import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_time_page.dart';
import 'package:intl/intl.dart';

class SlotDatePage extends StatelessWidget {
  // SlotDatePage({Key? key}) : super(key: key);
  final int sbeId;
  final String branch;
  final String slotDateStart;
  final String slotDateEnd;

  final int? couponCodepk;
  final String? couponCode;

  SlotDatePage(
      {Key? key,
      this.couponCodepk,
      this.couponCode,
      required this.slotDateStart,
      required this.slotDateEnd,
      required this.sbeId,
      required this.branch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime d = DateFormat('dd-MMM-yyyy').parse(slotDateStart);
    DateTime d2 = DateFormat('dd-MMM-yyyy').parse(slotDateEnd);
    List<DateTime> days = [];
    List<String> month = [
      '',
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];

    List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        days.add(startDate.add(Duration(days: i)));
      }

      for (int j = 0; j < days.length; j++) {
        DateUtils.dateOnly(days[j]);
      }
      // print(days);
      return days;
    }

    getDaysInBetween(d, d2);

    print(couponCodepk);
    print(couponCode);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Choose Date',
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(days.length, (index) {
          return InkWell(
            onTap: () {
              //check if there is a slot bookind on this date

              if (days[index]
                  .isBefore(DateTime.now().subtract(Duration(days: 1)))) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Please choose a date after today',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: AppColors.primaryRed,
                ));
              } else {
                var date = DateFormat('MM/dd/yyyy').format(days[index]);
                Navigator.pushNamed(context, 'slotBookingTimePage',
                    arguments: SlotTimePage(
                      couponCodepk: couponCodepk,
                      couponCode: couponCode,
                      branch: branch,
                      date: date.toString(),
                      sbeId: sbeId,
                    ));
              }
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              height: 106,
              width: 106,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: days[index]
                          .isBefore(DateTime.now().subtract(Duration(days: 1)))
                      ? AppColors.textGrey2
                      : Colors.black),
              child: Center(
                  child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Center(
                            child: Text(
                          '${days[index].day}',
                          style: TextStyle(
                              color: days[index].isBefore(DateTime.now()
                                      .subtract(Duration(days: 1)))
                                  ? AppColors.textGrey2
                                  : Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Container(
                      height: 33,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: days[index].isBefore(
                                  DateTime.now().subtract(Duration(days: 1)))
                              ? AppColors.textGrey2
                              : Colors.black,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Center(
                          child: Text(
                        '${month[days[index].month]}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    ),
                  ],
                ),
              )),
            ),
          );
        }),
      ),
    );
  }
}
