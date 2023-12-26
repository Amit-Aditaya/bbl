part of 'party_booking_history_bloc.dart';

abstract class PartyBookingHistoryState extends Equatable {
  const PartyBookingHistoryState();

  @override
  List<Object> get props => [];
}

class PartyBookingHistoryLoadingState extends PartyBookingHistoryState {}

class PartyBookingHistoryLoadedState extends PartyBookingHistoryState {
  final PartyBookingHistoryModel partyBookingHistoryModel;

  const PartyBookingHistoryLoadedState(
      {required this.partyBookingHistoryModel});
}
