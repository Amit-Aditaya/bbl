part of 'free_ticket_bloc.dart';

abstract class FreeTicketState extends Equatable {
  const FreeTicketState();

  @override
  List<Object> get props => [];
}

class FreeTicketLoadingState extends FreeTicketState {}

class FreeTicketLoadedState extends FreeTicketState {
  final FreeTicketModel freeTicketModel;
  const FreeTicketLoadedState({
    required this.freeTicketModel,
  });
}
