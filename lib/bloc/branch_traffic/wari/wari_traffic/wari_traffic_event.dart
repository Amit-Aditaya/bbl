part of 'wari_traffic_bloc.dart';

abstract class WariTrafficEvent extends Equatable {
  const WariTrafficEvent();

  @override
  List<Object> get props => [];
}

class LoadWariTrafficApiEvent extends WariTrafficEvent {}

class LoadWariTrafficNullEvent extends WariTrafficEvent {}
