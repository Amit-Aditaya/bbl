part of 'party_booking_history_bloc.dart';

abstract class PartyBookingHistoryEvent extends Equatable {
  const PartyBookingHistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadPartyBookingHistoryApiEvent extends PartyBookingHistoryEvent {}
