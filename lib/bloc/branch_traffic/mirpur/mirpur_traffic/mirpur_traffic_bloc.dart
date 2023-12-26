import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/branch_traffic_model/mirpur_traffic_model.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/mirpur_traffic_repository.dart';

part 'mirpur_traffic_event.dart';
part 'mirpur_traffic_state.dart';

class MirpurTrafficBloc extends Bloc<MirpurTrafficEvent, MirpurTrafficState> {
  final MirpurTrafficRepository _mirpurTrafficRepository;
  MirpurTrafficBloc(this._mirpurTrafficRepository)
      : super(MirpurTrafficLoadingState()) {
    on<LoadMirpurTrafficApiEvent>((event, emit) async {
      final mirpurTraffic = await _mirpurTrafficRepository.getMirpurTraffic();
      emit(MirpurTrafficLoadedState(mirpurTrafficModel: mirpurTraffic));
    });
  }
}
