part of 'booked_slot_bloc.dart';

@immutable
abstract class BookedSlotState {}

class BookedSlotLoadingState extends BookedSlotState {}

class BookedSlotLoadedState extends BookedSlotState {
  final BookedSlotsModel bookedSlotsModel;

  BookedSlotLoadedState(this.bookedSlotsModel);
}
