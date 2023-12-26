part of 'ticket_order_item_bloc.dart';

@immutable
abstract class TicketOrderItemState {}

class TicketOrderItemLoadingState extends TicketOrderItemState {}

class TicketOrderItemLoadedState extends TicketOrderItemState {
  final TicketOrderItemModel ticketOrderItemModel;
  TicketOrderItemLoadedState({
    required this.ticketOrderItemModel,
  });
}
