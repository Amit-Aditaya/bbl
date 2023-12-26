part of 'past_event_bloc.dart';

abstract class PastEventEvent extends Equatable {
  const PastEventEvent();

  @override
  List<Object> get props => [];
}

class LoadApiEvent extends PastEventEvent {}
