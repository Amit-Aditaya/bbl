import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ticket_count_state.dart';

class TicketCountCubit extends Cubit<TicketCountState> {
  TicketCountCubit() : super(TicketCountState(value: 0));

  void increment() => emit(TicketCountState(
        value: state.value + 1,
      ));

  void decrement() => emit(TicketCountState(
        value: state.value - 1,
      ));
}
