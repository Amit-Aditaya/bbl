import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_model.dart';
import 'package:flutter_babuland_app/data/repository/expired_ticket_repository.dart';

part 'expired_ticket_order_event.dart';
part 'expired_ticket_order_state.dart';

class ExpiredTicketOrderBloc
    extends Bloc<ExpiredTicketOrderEvent, ExpiredTicketOrderState> {
  final ExpiredTicketRepository _expiredTicketRepository;
  ExpiredTicketOrderBloc(this._expiredTicketRepository)
      : super(ExpiredTicketOrderLoadingState()) {
    on<ExpiredTicketOrderEvent>((event, emit) async {
      final expiredTicketOrder =
          await _expiredTicketRepository.getExpiredTicketOrder();
      emit(ExpiredTicketOrderLoadedState(ticketOrderModel: expiredTicketOrder));
    });
  }
}
