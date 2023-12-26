part of 'past_event_bloc.dart';

abstract class PastEventState extends Equatable {
  const PastEventState();

  @override
  List<Object> get props => [];
}

class PastEventLoadingState extends PastEventState {}

class PastEventLoadedState extends PastEventState {
  final PastEventModel pastEventModel;
  const PastEventLoadedState({
    required this.pastEventModel,
  });
}
