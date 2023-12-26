part of 'free_ticket_bloc.dart';

abstract class FreeTicketEvent extends Equatable {
  const FreeTicketEvent();

  @override
  List<Object> get props => [];
}

class LoadFreeTicketApiEvent extends FreeTicketEvent {}
