part of 'badda_traffic_bloc.dart';

abstract class BaddaTrafficState extends Equatable {
  const BaddaTrafficState();

  @override
  List<Object> get props => [];
}

class BaddaTrafficLoadingState extends BaddaTrafficState {}

class BaddaTrafficLoadedState extends BaddaTrafficState {
  final BaddaTrafficModel baddaTrafficModel;
  const BaddaTrafficLoadedState({
    required this.baddaTrafficModel,
  });
}
