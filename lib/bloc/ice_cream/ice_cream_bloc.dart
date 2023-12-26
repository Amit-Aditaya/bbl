import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:flutter_babuland_app/data/repository/ice_cream_repository.dart';

part 'ice_cream_event.dart';
part 'ice_cream_state.dart';

class IceCreamBloc extends Bloc<IceCreamEvent, IceCreamState> {
  final IceCreamRepository _iceCreamRepository;
  IceCreamBloc(this._iceCreamRepository) : super(IceCreamLoadingState()) {
    on<LoadIceCreamApiEvent>((event, emit) async {
      final iceCream = await _iceCreamRepository.getIceCream();
      emit(IceCreamLoadedState(foodModel: iceCream));
    });
  }
}
