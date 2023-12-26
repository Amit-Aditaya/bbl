part of 'mirpur_traffic_bloc.dart';

abstract class MirpurTrafficState extends Equatable {
  const MirpurTrafficState();

  @override
  List<Object> get props => [];
}

class MirpurTrafficLoadingState extends MirpurTrafficState {}

class MirpurTrafficLoadedState extends MirpurTrafficState {
  final MirpurTrafficModel mirpurTrafficModel;
  const MirpurTrafficLoadedState({
    required this.mirpurTrafficModel,
  });
}
