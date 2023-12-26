part of 'ticket_count_cubit.dart';

class TicketCountState extends Equatable {
  int value;
  TicketCountState({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}
