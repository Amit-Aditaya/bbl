import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/branch_traffic_model/wari_traffic_model.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/wari_traffic_repository.dart';

part 'wari_traffic_event.dart';
part 'wari_traffic_state.dart';

class WariTrafficBloc extends Bloc<WariTrafficEvent, WariTrafficState> {
  final WariTrafficRepository _wariTrafficRepository;
  WariTrafficBloc(this._wariTrafficRepository)
      : super(WariTrafficLoadingState()) {
    on<LoadWariTrafficApiEvent>((event, emit) async {
      final waritraffic = await _wariTrafficRepository.getWariTraffic();
      emit(WariTrafficLoadedState(wariTrafficModel: waritraffic));
    });
  }
}
