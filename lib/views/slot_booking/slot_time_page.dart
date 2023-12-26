import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/bloc/slot_booking/slot_booking_time/slot_booking_time_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/slot_time_card.dart';
import 'package:flutter_babuland_app/data/repository/coupon/scanned_coupon_repository.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_time_repository.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlotTimePage extends StatelessWidget {
  //const SlotTimePage({Key? key}) : super(key: key);
  final String branch;
  final String date;
  final int sbeId;

  late int slotBookingId;

  final int? couponCodepk;
  final String? couponCode;

  SlotTimePage(
      {Key? key,
      this.couponCodepk,
      this.couponCode,
      required this.branch,
      required this.date,
      required this.sbeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(couponCodepk);
    print(couponCode);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SlotBookingTimeBloc(
              slotBookingTimeRepository:
                  RepositoryProvider.of<SlotBookingTimeRepository>(context),
              branchName: branch,
              date: date,
              sbeId: sbeId)
            ..add(LoadSlotBookingTimeApiEvent()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Select Time',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<SlotBookingTimeBloc, SlotBookingTimeState>(
          builder: (context, state) {
            if (state is SlotBookingTimeLoadedState) {
              return state.slotBookingTimeModel.items.isEmpty
                  ? Center(
                      child: Text(
                        'Sorry, no slots are allocated for this date',
                        style: TextStyle(
                            color: AppColors.textGrey2,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                          state.slotBookingTimeModel.items.length, (index) {
                        slotBookingId =
                            state.slotBookingTimeModel.items[index].timeSlotId;

                        return InkWell(
                          onTap: () {
                            if (state.slotBookingTimeModel.items[index]
                                        .remainSlot ==
                                    0 ||
                                state.slotBookingTimeModel.items[index]
                                        .remainSlot <
                                    0) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text(
                                  'All slots are booked for this time',
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: AppColors.primaryRed,
                              ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return RepositoryProvider(
                                      create: (context) => CustomerRepository(),
                                      child: AlertDialog(
                                        title: Text(
                                          'Are you sure you want to book this slot ?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 18),
                                        ),
                                        content: BlocProvider(
                                          create: (context) => CustomerBloc(
                                              RepositoryProvider.of<
                                                  CustomerRepository>(context))
                                            ..add(LoadCustomerApiEvent()),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No'),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryColor)),
                                              ),
                                              BlocBuilder<CustomerBloc,
                                                  CustomerState>(
                                                builder:
                                                    (context, customerState) {
                                                  if (customerState
                                                      is CustomerLoadedState) {
                                                    return ElevatedButton(
                                                      onPressed: () async {
                                                        await SlotRepository.postSlotBooking(
                                                                slotBookingId:
                                                                    slotBookingId,
                                                                customerId:
                                                                    customerState
                                                                        .customerModel
                                                                        .items[
                                                                            0]
                                                                        .id,
                                                                branch: branch,
                                                                bookingDate:
                                                                    date,
                                                                sbeId: sbeId,
                                                                coupon:
                                                                    couponCode)
                                                            .then((value) {
                                                          Navigator.pushNamed(
                                                              context, '/');

                                                          Navigator.pushNamed(
                                                              context,
                                                              'bookNowPage');

                                                          Navigator.pushNamed(
                                                              context,
                                                              'bookNowPage');
                                                        }).then((value) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content:
                                                                  const Text(
                                                                'Slot Booking Successfull',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              backgroundColor:
                                                                  AppColors
                                                                      .primaryGreen,
                                                            ),
                                                          );
                                                        }).then((value) {
                                                          //     ScannedCouponRepository
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
                                                          if (couponCodepk ==
                                                              null) {
                                                            print(
                                                                'null coupon');
                                                          } else {
                                                            ScannedCouponRepository
                                                                .availScannedCoupon(
                                                                    couponCodepk
                                                                        .toString());
                                                          }
                                                        });
                                                      },
                                                      child: Text('Yes'),
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      AppColors
                                                                          .primaryColor)),
                                                    );
                                                  } else {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          child: SlotTimeCard(
                            timeSlotRange: state
                                .slotBookingTimeModel.items[index].timeSlotName,
                            remainingSlots: state
                                .slotBookingTimeModel.items[index].remainSlot,
                          ),
                        );
                      }),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
