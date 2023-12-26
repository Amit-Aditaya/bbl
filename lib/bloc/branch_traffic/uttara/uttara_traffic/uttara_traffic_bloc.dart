import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/branch_traffic_model/uttara_traffic_model.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/uttara_traffic_repository.dart';

part 'uttara_traffic_event.dart';
part 'uttara_traffic_state.dart';

class UttaraTrafficBloc extends Bloc<UttaraTrafficEvent, UttaraTrafficState> {
  final UttaraTrafficRepository _uttaraTrafficRepository;
  UttaraTrafficBloc(this._uttaraTrafficRepository)
      : super(UttaraTrafficLoadingState()) {
    on<LoadUttaraTrafficApiEvent>((event, emit) async {
      final uttaraTraffic = await _uttaraTrafficRepository.getUttaraTraffic();
      emit(UttaraTrafficLoadedState(uttaraTrafficModel: uttaraTraffic));
    });
  }
}
