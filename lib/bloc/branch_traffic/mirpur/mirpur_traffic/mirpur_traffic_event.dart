part of 'mirpur_traffic_bloc.dart';

abstract class MirpurTrafficEvent extends Equatable {
  const MirpurTrafficEvent();

  @override
  List<Object> get props => [];
}

class LoadMirpurTrafficApiEvent extends MirpurTrafficEvent {}

class LoadMirpurTrafficNullEvent extends MirpurTrafficEvent {}
