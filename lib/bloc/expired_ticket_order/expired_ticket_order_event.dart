part of 'expired_ticket_order_bloc.dart';

abstract class ExpiredTicketOrderEvent extends Equatable {
  const ExpiredTicketOrderEvent();

  @override
  List<Object> get props => [];
}

class LoadExpiredTicketOrderApiEvent extends ExpiredTicketOrderEvent {}
