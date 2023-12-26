part of 'ticket_order_bloc.dart';

abstract class TicketOrderState extends Equatable {
  const TicketOrderState();

  @override
  List<Object> get props => [];
}

class TicketOrderLoadingState extends TicketOrderState {}

class TicketOrderLoadedState extends TicketOrderState {
  final TicketOrderModel ticketOrderModel;
  const TicketOrderLoadedState({
    required this.ticketOrderModel,
  });
}
