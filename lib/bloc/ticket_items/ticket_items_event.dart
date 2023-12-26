part of 'ticket_items_bloc.dart';

abstract class TicketItemsEvent extends Equatable {
  const TicketItemsEvent();

  @override
  List<Object> get props => [];
}

class LoadTicketItemsApiEvent extends TicketItemsEvent {}
