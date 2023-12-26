import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_item_model.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_item_repository.dart';
import 'package:meta/meta.dart';

part 'ticket_order_item_event.dart';
part 'ticket_order_item_state.dart';

class TicketOrderItemBloc
    extends Bloc<TicketOrderItemEvent, TicketOrderItemState> {
  final TicketOrderItemRepository _ticketOrderItemRepository;
  final int pk;

  TicketOrderItemBloc(this._ticketOrderItemRepository, this.pk)
      : super(TicketOrderItemLoadingState()) {
    on<TicketOrderItemEvent>((event, emit) async {
      final ticketOrderItems =
          await _ticketOrderItemRepository.getTicketOrderItem(pk);
      emit(TicketOrderItemLoadedState(ticketOrderItemModel: ticketOrderItems));
    });
  }
}
