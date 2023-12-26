import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/upcoming_event_model.dart';
import 'package:flutter_babuland_app/data/repository/upcoming_event_repository.dart';

part 'upcoming_event_event.dart';
part 'upcoming_event_state.dart';

class UpcomingEventBloc extends Bloc<UpcomingEventEvent, UpcomingEventState> {
  final UpcomingEventRepository _upcomingEventRepository;

  UpcomingEventBloc(this._upcomingEventRepository)
      : super(UpcomingEventLoadingState()) {
    on<LoadUpcomingEventApiEvent>((event, emit) async {
      final upcomingEvents = await _upcomingEventRepository.getUpcomingEvents();
      emit(UpcomingEventLoadedState(upcomingEventModel: upcomingEvents));
    });
  }
}
