import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/slot_booking/slot_booking_event_model.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_event_repository.dart';
import 'package:meta/meta.dart';

part 'slot_booking_event_event.dart';
part 'slot_booking_event_state.dart';

class SlotBookingEventBloc
    extends Bloc<SlotBookingEventEvent, SlotBookingEventState> {
  final SlotBookingEventRepository _slotBookingEventRepository;
  SlotBookingEventBloc(this._slotBookingEventRepository)
      : super(SlotBookingEventLoadingState()) {
    on<SlotBookingEventEvent>((event, emit) async {
      final slotsBookingEvents =
          await _slotBookingEventRepository.getSlotBookingEvent();
      emit(SlotBookingEventLoadedState(slotsBookingEvents));
    });
  }
}
