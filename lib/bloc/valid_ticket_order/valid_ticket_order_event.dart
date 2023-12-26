part of 'valid_ticket_order_bloc.dart';

abstract class ValidTicketOrderEvent extends Equatable {
  const ValidTicketOrderEvent();

  @override
  List<Object> get props => [];
}

class LoadValidTicketOrderApiEvent extends ValidTicketOrderEvent {}
