import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/coupon_item/coupon_item_bloc.dart';
import 'package:flutter_babuland_app/bloc/scanned_coupon/scanned_coupon_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/my_coupon.dart';
import 'package:flutter_babuland_app/data/repository/coupon/scanned_coupon_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_booking_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../bloc/scanned_coupon/scanned_coupon_bloc.dart';
import '../custom_widgets/my_coupon.dart';

class ScannedCouponPage extends StatelessWidget {
  //const ScannedCouponPage({Key? key}) : super(key: key);

  final String scannedData;

  const ScannedCouponPage({Key? key, required this.scannedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScannedCouponBloc(
          scannedCouponRepository:
              RepositoryProvider.of<ScannedCouponRepository>(context),
          couponValue: scannedData)
        ..add(LoadScannedTicketApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Coupon',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Icon(CupertinoIcons.back)),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BlocBuilder<ScannedCouponBloc, ScannedCouponState>(
              builder: (context, state) {
                if (state is ScannedCouponLoadedState) {
                  if (state.scannedCouponModel.items.isEmpty) {
                    return Center(
                      child: Text(
                        'Invalid Coupon',
                        style: TextStyle(
                            color: AppColors.primaryRed, fontSize: 18),
                      ),
                    );
                  } else {
                    return MyCoupon(
                        pk: state.scannedCouponModel.items[0].pk,
                        couponCode: state.scannedCouponModel.items[0].cuponCode,
                        couponItemId: state.scannedCouponModel.items[0].itemId,
                        ticketType:
                            state.scannedCouponModel.items[0].productName,
                        qty: state.scannedCouponModel.items[0].qty,
                        startDate: state.scannedCouponModel.items[0].startDate,
                        expireDate: state.scannedCouponModel.items[0].endDate);
                  }
                } else {
                  return Center(
                      child: SpinKitFadingGrid(
                    color: AppColors.primaryColor,
                  ));
                }
              },
            ),
            BlocBuilder<ScannedCouponBloc, ScannedCouponState>(
              builder: (context, state) {
                if (state is ScannedCouponLoadedState
                    //&&                    state.scannedCouponModel.items[0].endDate != null
                    ) {
                  // String expDate = state.scannedCouponModel.items[0].endDate!;
                  // DateTime expireDateTime =
                  //     DateFormat('dd-MMM-yyyy').parse(expDate);

                  return DraggableScrollableSheet(
                    initialChildSize: 0.35,
                    minChildSize: 0.08,
                    maxChildSize: 0.8,
                    builder: (context, scrollController) {
                      return Container(
                        margin: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.yellow.shade700, width: 6)),
                        child: state.scannedCouponModel.items[0].status
                                    ?.toLowerCase() ==
                                'activated'
                            ? Center(
                                child: Text(
                                  'This coupon is already activated',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.primaryRed,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : state.scannedCouponModel.items[0].consume != null
                                ? Center(
                                    child: Text(
                                      'This coupon is already used',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.primaryRed,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                // : DateTime.now().isAfter(expireDateTime)
                                //     ? Center(
                                //         child: Text(
                                //           'Sorry \n this coupon is expired',
                                //           textAlign: TextAlign.center,
                                //           style: TextStyle(
                                //               color: AppColors.primaryRed,
                                //               fontSize: 18,
                                //               fontWeight: FontWeight.w600),
                                //         ),
                                //       )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        'Do you want to activate this coupon?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textGrey),
                                      )),
                                      Center(
                                          child: Text(
                                        '** The coupon can be used at one of our \n branches after activation ** ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            // fontWeight: FontWeight.w400,
                                            color: AppColors.primaryRed),
                                      )),
                                      const SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(Colors
                                                            .yellow.shade700)),
                                            child: const Text('No'),
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty
                                                          .all<Color>(Colors
                                                              .yellow
                                                              .shade700)),
                                              onPressed: () {
                                                // ScannedCouponRepository
                                                //         .availScannedCoupon(
                                                //             state
                                                //                 .scannedCouponModel
                                                //                 .items[0]
                                                //                 .pk
                                                //                 .toString())
                                                //     .then((value) {
                                                //   Navigator.pop(context);
                                                //   Navigator.pop(context);
                                                // }).then((value) {
                                                //   ScaffoldMessenger.of(
                                                //           context)
                                                //       .showSnackBar(
                                                //           SnackBar(
                                                //     content: const Text(
                                                //       'Coupon Activated Successfully',
                                                //       textAlign:
                                                //           TextAlign.center,
                                                //     ),
                                                //     backgroundColor:
                                                //         AppColors
                                                //             .primaryGreen,
                                                //   ));
                                                // });

                                                // Navigator.pushNamed(context,
                                                //     'slotBookingPage');

                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                          'Terms of Use',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor),
                                                        ),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const Text(
                                                                  '** To use this coupon you must book a slot, for your time of visit. \n '),
                                                              Text(
                                                                '** You must arrive within the chosen time slot or a 50% charge will be applicable for your ticket. \n ',
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryRed),
                                                              ),
                                                              const Text(
                                                                  '** After booking the slot, you can find your "virtual" coupon on the \'My Coupons\' page in the Babuland app. \n '),
                                                              const Text(
                                                                  '** Just show the coupon at the counter in one of our branches to enter. \n '),
                                                              const Text(
                                                                  '** Your child must be between the 122 centimeter or 4 feet in height. \n '),
                                                              const Text(
                                                                  '** You can always check your slots in the \'Book Now\' page in the Babuland App. \n '),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    style: ButtonStyle(
                                                                        backgroundColor:
                                                                            MaterialStateProperty.all(AppColors.primaryColor)),
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pushNamed(
                                                                          context,
                                                                          'slotBookingPage',
                                                                          arguments:
                                                                              SlotBookingPage(
                                                                            couponCodepk:
                                                                                state.scannedCouponModel.items[0].pk,
                                                                            couponCode:
                                                                                state.scannedCouponModel.items[0].cuponCode,
                                                                          ));
                                                                    },
                                                                    style: ButtonStyle(
                                                                        backgroundColor:
                                                                            MaterialStateProperty.all(AppColors.primaryColor)),
                                                                    child: Text(
                                                                        'Agree'),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: const Text('Yes')),
                                        ],
                                      )
                                    ],
                                  ),
                      );
                    },
                  );
                } else {
                  return const SizedBox(height: 1);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
