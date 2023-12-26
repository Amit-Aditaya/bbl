part of 'uttara_traffic_bloc.dart';

abstract class UttaraTrafficEvent extends Equatable {
  const UttaraTrafficEvent();

  @override
  List<Object> get props => [];
}

class LoadUttaraTrafficApiEvent extends UttaraTrafficEvent {}

class LoadUttaraTrafficNullEvent extends UttaraTrafficEvent {}
