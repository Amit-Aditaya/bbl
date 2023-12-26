import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/slot_booking/slot_booking_branch/slot_booking_branch/slot_booking_branch_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/branch_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/my_arch.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_branch_repository.dart';

import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/slot_booking/slot_date_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SlotBookingBranchPage extends StatelessWidget {
  //const SlotBookingBranchPage({Key? key}) : super(key: key);
  final int? couponCodepk;
  final String? couponCode;

  final int sbeId;

  final String slotBookingStartDate;
  final String slotBookingEndDate;

  SlotBookingBranchPage({
    Key? key,
    this.couponCodepk,
    this.couponCode,
    required this.sbeId,
    required this.slotBookingEndDate,
    required this.slotBookingStartDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(couponCodepk);
    print(couponCode);
    return BlocProvider(
      create: (context) => SlotBookingBranchBloc(
          slotBookingBranchRepository:
              RepositoryProvider.of<SlotBookingBranchRepository>(context),
          sbeId: sbeId)
        ..add(LoadSlotBookingBranchApiEvent()),
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Choose Branch',
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: BlocBuilder<SlotBookingBranchBloc, SlotBookingBranchState>(
            builder: (context, state) {
              if (state is SlotBookingBranchLoadedState) {
                return GridView.count(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .20),
                    crossAxisCount: 2,
                    children: List.generate(
                        state.slotBookingBranchModel.items.length,
                        (index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, 'slotBookingDatePage',
                                    arguments: SlotDatePage(
                                      couponCodepk: couponCodepk,
                                      couponCode: couponCode,
                                      slotDateStart: slotBookingStartDate,
                                      slotDateEnd: slotBookingEndDate,
                                      sbeId: sbeId,
                                      branch: state.slotBookingBranchModel
                                          .items[index].branch,
                                    ));
                              },
                              child: BranchButton(
                                  branchName: state.slotBookingBranchModel
                                      .items[index].branch,
                                  buttonColor: Colors.red),
                            )));
              } else {
                return Center(
                  child: SpinKitFadingGrid(color: AppColors.primaryColor),
                );
              }
            },
          )),
    );
  }
}
