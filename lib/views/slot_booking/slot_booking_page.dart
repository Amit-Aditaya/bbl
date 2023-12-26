import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/slot_booking/slot_booking_event/slot_booking_event_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/slot_event_card.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_event_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_booking_branch_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SlotBookingPage extends StatelessWidget {
  final int? couponCodepk;
  final String? couponCode;

  const SlotBookingPage({Key? key, this.couponCodepk, this.couponCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(couponCodepk);
    print(couponCode);
    return BlocProvider(
      create: (context) => SlotBookingEventBloc(
          RepositoryProvider.of<SlotBookingEventRepository>(context))
        ..add(LoadSlotBookingEventAPiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Slot Booking',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<SlotBookingEventBloc, SlotBookingEventState>(
          builder: (context, state) {
            if (state is SlotBookingEventLoadedState) {
              return ListView.builder(
                itemCount: state.slotBookingEventModel.items.length,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      if (index == 0 && couponCodepk! < 589440 ||
                          couponCodepk! > 594438) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Sorry, your\'s is not a corporate coupon',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: AppColors.primaryRed,
                        ));
                      } else if (index == 1 &&
                          couponCodepk! > 589440 &&
                          couponCodepk! < 594438) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Sorry, your\'s is a corporate coupon',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: AppColors.primaryRed,
                        ));
                      } else {
                        Navigator.pushNamed(context, 'slotBookingBranchPage',
                            arguments: SlotBookingBranchPage(
                              couponCodepk: couponCodepk,
                              couponCode: couponCode,
                              sbeId: state
                                  .slotBookingEventModel.items[index].sbeId,
                              slotBookingEndDate: state.slotBookingEventModel
                                  .items[index].visibilityEndDate,
                              slotBookingStartDate: state.slotBookingEventModel
                                  .items[index].visibilityStartDate,
                            ));
                      }
                    },
                    child: SlotBookingCard(
                      eventTitle:
                          state.slotBookingEventModel.items[index].sbeTitle,
                      eventDetails:
                          state.slotBookingEventModel.items[index].sbeDetails,
                    )),
              );
            } else {
              return Center(
                  child: SpinKitFadingGrid(
                color: AppColors.primaryColor,
              ));
            }
          },
        ),
      ),
    );
  }
}
