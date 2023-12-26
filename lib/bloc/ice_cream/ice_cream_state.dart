part of 'ice_cream_bloc.dart';

abstract class IceCreamState extends Equatable {
  const IceCreamState();

  @override
  List<Object> get props => [];
}

class IceCreamLoadingState extends IceCreamState {}

class IceCreamLoadedState extends IceCreamState {
  final FoodModel foodModel;
  const IceCreamLoadedState({
    required this.foodModel,
  });
}
