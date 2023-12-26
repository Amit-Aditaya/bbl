part of 'upcoming_event_bloc.dart';

abstract class UpcomingEventState extends Equatable {
  const UpcomingEventState();

  @override
  List<Object> get props => [];
}

class UpcomingEventLoadingState extends UpcomingEventState {}

class UpcomingEventLoadedState extends UpcomingEventState {
  final UpcomingEventModel upcomingEventModel;
  UpcomingEventLoadedState({
    required this.upcomingEventModel,
  });
}
