part of 'expired_ticket_order_bloc.dart';

abstract class ExpiredTicketOrderState extends Equatable {
  const ExpiredTicketOrderState();

  @override
  List<Object> get props => [];
}

class ExpiredTicketOrderLoadingState extends ExpiredTicketOrderState {}

class ExpiredTicketOrderLoadedState extends ExpiredTicketOrderState {
  final TicketOrderModel ticketOrderModel;
  const ExpiredTicketOrderLoadedState({
    required this.ticketOrderModel,
  });
}
