part of 'upcoming_event_bloc.dart';

abstract class UpcomingEventEvent extends Equatable {
  const UpcomingEventEvent();

  @override
  List<Object> get props => [];
}

class LoadUpcomingEventApiEvent extends UpcomingEventEvent {}
