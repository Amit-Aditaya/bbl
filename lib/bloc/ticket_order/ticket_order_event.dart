part of 'ticket_order_bloc.dart';

abstract class TicketOrderEvent extends Equatable {
  const TicketOrderEvent();

  @override
  List<Object> get props => [];
}

class LoadTicketOrderApiEvent extends TicketOrderEvent {}
