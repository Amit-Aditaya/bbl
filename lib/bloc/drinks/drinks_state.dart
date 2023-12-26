part of 'drinks_bloc.dart';

abstract class DrinksState extends Equatable {
  const DrinksState();

  @override
  List<Object> get props => [];
}

class DrinksLoadingState extends DrinksState {}

class DrinksLoadedState extends DrinksState {
  final FoodModel foodModel;
  const DrinksLoadedState({
    required this.foodModel,
  });
}
