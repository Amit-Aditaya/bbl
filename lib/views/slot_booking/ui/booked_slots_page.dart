import 'package:custom_clippers/Clippers/multiple_points_clipper.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/slot_booking/booked_slot/booked_slot_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/booked_slot_card.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookedSlotsPage extends StatelessWidget {
  const BookedSlotsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookedSlotBloc(RepositoryProvider.of<SlotRepository>(context))
            ..add(LoadBookedSlotsApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Booked Slots',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<BookedSlotBloc, BookedSlotState>(
          builder: (context, state) {
            if (state is BookedSlotLoadedState) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    state.bookedSlotsModel.items.length,
                    (index) => BookedSlotCard(
                          bookingDate:
                              state.bookedSlotsModel.items[index].bookingDate,
                          branch:
                              state.bookedSlotsModel.items[index].bookingBrunch,
                          bookingId:
                              state.bookedSlotsModel.items[index].bookingId,
                          bookingTime:
                              state.bookedSlotsModel.items[index].bookingTime,
                        )),
              );
            } else {
              return Center(
                child: SpinKitCubeGrid(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
