part of 'ice_cream_bloc.dart';

abstract class IceCreamEvent extends Equatable {
  const IceCreamEvent();

  @override
  List<Object> get props => [];
}

class LoadIceCreamApiEvent extends IceCreamEvent {}
