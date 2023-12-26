part of 'uttara_traffic_bloc.dart';

abstract class UttaraTrafficState extends Equatable {
  const UttaraTrafficState();

  @override
  List<Object> get props => [];
}

class UttaraTrafficLoadingState extends UttaraTrafficState {}

class UttaraTrafficLoadedState extends UttaraTrafficState {
  final UttaraTrafficModel uttaraTrafficModel;
  const UttaraTrafficLoadedState({
    required this.uttaraTrafficModel,
  });
}
