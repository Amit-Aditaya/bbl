part of 'wari_traffic_bloc.dart';

abstract class WariTrafficState extends Equatable {
  const WariTrafficState();

  @override
  List<Object> get props => [];
}

class WariTrafficLoadingState extends WariTrafficState {}

class WariTrafficLoadedState extends WariTrafficState {
  final WariTrafficModel wariTrafficModel;
  const WariTrafficLoadedState({
    required this.wariTrafficModel,
  });
}
