part of 'badda_traffic_bloc.dart';

abstract class BaddaTrafficEvent extends Equatable {
  const BaddaTrafficEvent();

  @override
  List<Object> get props => [];
}

class LoadBaddaTrafficApiEvent extends BaddaTrafficEvent {}

class LoadBaddaTrafficNullEvent extends BaddaTrafficEvent {}
