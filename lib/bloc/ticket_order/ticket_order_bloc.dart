import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_model.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_repository.dart';

part 'ticket_order_event.dart';
part 'ticket_order_state.dart';

class TicketOrderBloc extends Bloc<TicketOrderEvent, TicketOrderState> {
  final TicketOrderRepository _ticketOrderRepository;
  TicketOrderBloc(this._ticketOrderRepository)
      : super(TicketOrderLoadingState()) {
    on<TicketOrderEvent>((event, emit) async {
      final ticketOrders = await _ticketOrderRepository.getTicketOrder();
      emit(TicketOrderLoadedState(ticketOrderModel: ticketOrders));
    });
  }
}
