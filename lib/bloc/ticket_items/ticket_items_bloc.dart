import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/ticket_item_model.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';

part 'ticket_items_event.dart';
part 'ticket_items_state.dart';

class TicketItemsBloc extends Bloc<TicketItemsEvent, TicketItemsState> {
  final TicketItemRepository _ticketItemRepository;

  TicketItemsBloc(this._ticketItemRepository)
      : super(TicketItemsLoadingState()) {
    on<TicketItemsEvent>((event, emit) async {
      final ticketItems = await _ticketItemRepository.getTicketItems();
      emit(TicketItemsLoadedState(ticketItemModel: ticketItems));
    });
  }
}
