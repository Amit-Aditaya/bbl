import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:flutter_babuland_app/data/repository/fast_food_repository.dart';

part 'fast_food_event.dart';
part 'fast_food_state.dart';

class FastFoodBloc extends Bloc<FastFoodEvent, FastFoodState> {
  final FastFoodRepository _fastFoodRepository;
  FastFoodBloc(this._fastFoodRepository) : super(FastFoodLoadingState()) {
    on<FastFoodEvent>((event, emit) async {
      final fastFood = await _fastFoodRepository.getFastFood();
      emit(FastFoodLoadedState(foodModel: fastFood));
    });
  }
}
