import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/party_booking_history_model.dart';
import 'package:flutter_babuland_app/data/repository/party_booking_history_repository.dart';

part 'party_booking_history_event.dart';
part 'party_booking_history_state.dart';

class PartyBookingHistoryBloc
    extends Bloc<PartyBookingHistoryEvent, PartyBookingHistoryState> {
  final PartyBookingRepository _bookingHistoryRepository;
  final int customerId;
  PartyBookingHistoryBloc(this._bookingHistoryRepository, this.customerId)
      : super(PartyBookingHistoryLoadingState()) {
    on<PartyBookingHistoryEvent>((event, emit) async {
      final partyHistory = await _bookingHistoryRepository
          .getPartyBookingHistory(customerId: customerId);
      emit(PartyBookingHistoryLoadedState(
          partyBookingHistoryModel: partyHistory));
    });
  }
}
