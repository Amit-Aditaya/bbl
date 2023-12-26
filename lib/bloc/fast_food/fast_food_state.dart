part of 'fast_food_bloc.dart';

abstract class FastFoodState extends Equatable {
  const FastFoodState();

  @override
  List<Object> get props => [];
}

class FastFoodLoadingState extends FastFoodState {}

class FastFoodLoadedState extends FastFoodState {
  final FoodModel foodModel;
  const FastFoodLoadedState({
    required this.foodModel,
  });

  @override
  List<Object> get props => [];
}
