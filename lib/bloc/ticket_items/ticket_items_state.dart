part of 'ticket_items_bloc.dart';

abstract class TicketItemsState extends Equatable {
  const TicketItemsState();

  @override
  List<Object> get props => [];
}

class TicketItemsLoadingState extends TicketItemsState {}

class TicketItemsLoadedState extends TicketItemsState {
  final TicketItemModel ticketItemModel;
  const TicketItemsLoadedState({
    required this.ticketItemModel,
  });
}
