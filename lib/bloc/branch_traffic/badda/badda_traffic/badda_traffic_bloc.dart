import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/branch_traffic_model/badda_traffic_model.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/badda_traffic_repository.dart';

part 'badda_traffic_event.dart';
part 'badda_traffic_state.dart';

class BaddaTrafficBloc extends Bloc<BaddaTrafficEvent, BaddaTrafficState> {
  final BaddaTrafficRepository _baddaTrafficRepository;
  BaddaTrafficBloc(this._baddaTrafficRepository)
      : super(BaddaTrafficLoadingState()) {
    on<LoadBaddaTrafficApiEvent>((event, emit) async {
      final baddaTraffic = await _baddaTrafficRepository.getBaddaTraffic();
      emit(BaddaTrafficLoadedState(baddaTrafficModel: baddaTraffic));
    });
  }
}
