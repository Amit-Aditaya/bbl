import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_model.dart';
import 'package:flutter_babuland_app/data/repository/valid_ticket_order_repository.dart';

part 'valid_ticket_order_event.dart';
part 'valid_ticket_order_state.dart';

class ValidTicketOrderBloc
    extends Bloc<ValidTicketOrderEvent, ValidTicketOrderState> {
  final ValidTicketOrderRepository _validTicketOrderRepository;

  ValidTicketOrderBloc(this._validTicketOrderRepository)
      : super(ValidTicketOrderLoadingState()) {
    on<ValidTicketOrderEvent>((event, emit) async {
      final validTicketOrders =
          await _validTicketOrderRepository.getValidTicketOrder();
      emit(ValidTicketOrderLoadedState(ticketOrderModel: validTicketOrders));
    });
  }
}
