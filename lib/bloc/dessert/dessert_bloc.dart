import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:flutter_babuland_app/data/repository/dessert_repository.dart';

part 'dessert_event.dart';
part 'dessert_state.dart';

class DessertBloc extends Bloc<DessertEvent, DessertState> {
  final DessertRepository _dessertRepository;

  DessertBloc(this._dessertRepository) : super(DessertLoadingState()) {
    on<LoadDessertApiEvent>((event, emit) async {
      final dessert = await _dessertRepository.getDessert();
      emit(DessertLoadedState(foodModel: dessert));
    });
  }
}
