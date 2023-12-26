part of 'slot_booking_branch_bloc.dart';

@immutable
abstract class SlotBookingBranchState {}

class SlotBookingBranchLoadingState extends SlotBookingBranchState {}

class SlotBookingBranchLoadedState extends SlotBookingBranchState {
  final SlotBookingBranchModel slotBookingBranchModel;
  SlotBookingBranchLoadedState(this.slotBookingBranchModel);
}
