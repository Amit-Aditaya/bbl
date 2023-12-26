import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/past_event_model.dart';
import 'package:flutter_babuland_app/data/repository/past_events_repository.dart';

part 'past_event_event.dart';
part 'past_event_state.dart';

class PastEventBloc extends Bloc<PastEventEvent, PastEventState> {
  final PastEventRepository _eventRepository;

  PastEventBloc(this._eventRepository) : super(PastEventLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final pastEvents = await _eventRepository.getPastEvents();
      emit(PastEventLoadedState(pastEventModel: pastEvents));
    });
  }
}
