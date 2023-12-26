import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/slot_booking/slot_booking_time_model.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_booking_time_repository.dart';
import 'package:meta/meta.dart';

part 'slot_booking_time_event.dart';
part 'slot_booking_time_state.dart';

class SlotBookingTimeBloc
    extends Bloc<SlotBookingTimeEvent, SlotBookingTimeState> {
  final SlotBookingTimeRepository slotBookingTimeRepository;
  final String branchName;
  final String date;
  final int sbeId;
  SlotBookingTimeBloc(
      {required this.slotBookingTimeRepository,
      required this.branchName,
      required this.date,
      required this.sbeId})
      : super(SlotBookingTimeLoadingState()) {
    on<SlotBookingTimeEvent>((event, emit) async {
      final slots = await slotBookingTimeRepository.getSlotBookingPage(
          branch: branchName, date: date, sbeId: sbeId);
      emit(SlotBookingTimeLoadedState(slots));
    });
  }
}
