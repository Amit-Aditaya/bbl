import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/bloc/slot_booking/slot_booking_branch/slot_booking_branch/slot_booking_branch_bloc.dart';
import 'package:flutter_babuland_app/data/model/slot_booking/booked_slots_model.dart';
import 'package:flutter_babuland_app/data/repository/slot_booking/slot_repository.dart';
import 'package:meta/meta.dart';

part 'booked_slot_event.dart';
part 'booked_slot_state.dart';

class BookedSlotBloc extends Bloc<BookedSlotEvent, BookedSlotState> {
  final SlotRepository slotRepository;
  BookedSlotBloc(this.slotRepository) : super(BookedSlotLoadingState()) {
    on<BookedSlotEvent>((event, emit) async {
      final bookedSlots = await slotRepository.getBookedSlots();
      emit(BookedSlotLoadedState(bookedSlots));
    });
  }
}
