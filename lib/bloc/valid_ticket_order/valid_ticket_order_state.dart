part of 'valid_ticket_order_bloc.dart';

abstract class ValidTicketOrderState extends Equatable {
  const ValidTicketOrderState();

  @override
  List<Object> get props => [];
}

class ValidTicketOrderLoadingState extends ValidTicketOrderState {}

class ValidTicketOrderLoadedState extends ValidTicketOrderState {
  final TicketOrderModel ticketOrderModel;
  const ValidTicketOrderLoadedState({
    required this.ticketOrderModel,
  });
}
