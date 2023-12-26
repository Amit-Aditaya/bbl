import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/slot_booking/slot_booking_branch_model.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_branch_repository.dart';
import 'package:meta/meta.dart';

part 'slot_booking_branch_event.dart';
part 'slot_booking_branch_state.dart';

class SlotBookingBranchBloc
    extends Bloc<SlotBookingBranchEvent, SlotBookingBranchState> {
  final SlotBookingBranchRepository slotBookingBranchRepository;
  final int sbeId;
  SlotBookingBranchBloc(
      {required this.slotBookingBranchRepository, required this.sbeId})
      : super(SlotBookingBranchLoadingState()) {
    on<SlotBookingBranchEvent>((event, emit) async {
      final slotBookingBranches =
          await slotBookingBranchRepository.getSlotBookingBranch(sbeId);
      emit(SlotBookingBranchLoadedState(slotBookingBranches));
    });
  }
}
