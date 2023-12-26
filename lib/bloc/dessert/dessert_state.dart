part of 'dessert_bloc.dart';

abstract class DessertState extends Equatable {
  const DessertState();

  @override
  List<Object> get props => [];
}

class DessertLoadingState extends DessertState {}

class DessertLoadedState extends DessertState {
  final FoodModel foodModel;
  const DessertLoadedState({
    required this.foodModel,
  });
}
