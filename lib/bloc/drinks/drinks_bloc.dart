import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:flutter_babuland_app/data/repository/drinks_repository.dart';

part 'drinks_event.dart';
part 'drinks_state.dart';

class DrinksBloc extends Bloc<DrinksEvent, DrinksState> {
  final DrinksRepository _drinksRepository;
  DrinksBloc(this._drinksRepository) : super(DrinksLoadingState()) {
    on<LoadDrinksApiEvent>((event, emit) async {
      final drinks = await _drinksRepository.getDrinks();
      emit(DrinksLoadedState(foodModel: drinks));
    });
  }
}
