part of 'fast_food_bloc.dart';

abstract class FastFoodEvent extends Equatable {
  const FastFoodEvent();

  @override
  List<Object> get props => [];
}

class LoadFastFoodApiEvent extends FastFoodEvent {}
