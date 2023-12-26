part of 'slot_booking_event_bloc.dart';

@immutable
abstract class SlotBookingEventState {}

class SlotBookingEventLoadingState extends SlotBookingEventState {}

class SlotBookingEventLoadedState extends SlotBookingEventState {
  final SlotBookingEventModel slotBookingEventModel;

  SlotBookingEventLoadedState(this.slotBookingEventModel);
}
