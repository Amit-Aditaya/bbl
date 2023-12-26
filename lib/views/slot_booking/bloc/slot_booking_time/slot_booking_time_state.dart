part of 'slot_booking_time_bloc.dart';

@immutable
abstract class SlotBookingTimeState {}

class SlotBookingTimeLoadingState extends SlotBookingTimeState {}

class SlotBookingTimeLoadedState extends SlotBookingTimeState {
  final SlotBookingTimeModel slotBookingTimeModel;
  SlotBookingTimeLoadedState(this.slotBookingTimeModel);
}
