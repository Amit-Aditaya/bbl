import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/free_ticket_model.dart';
import 'package:flutter_babuland_app/data/repository/free_ticket_repository.dart';

part 'free_ticket_event.dart';
part 'free_ticket_state.dart';

class FreeTicketBloc extends Bloc<FreeTicketEvent, FreeTicketState> {
  final FreeTicketRepository _freeTicketRepository;
  FreeTicketBloc(this._freeTicketRepository) : super(FreeTicketLoadingState()) {
    on<FreeTicketEvent>((event, emit) async {
      final freeTickets = await _freeTicketRepository.getFreetickets();
      emit(FreeTicketLoadedState(freeTicketModel: freeTickets));
    });
  }
}
