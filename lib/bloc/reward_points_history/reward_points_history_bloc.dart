import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/reward_points_history_model.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_history_repository.dart';
import 'package:meta/meta.dart';

part 'reward_points_history_event.dart';
part 'reward_points_history_state.dart';

class RewardPointsHistoryBloc
    extends Bloc<RewardPointsHistoryEvent, RewardPointsHistoryState> {
  final RewardPointsHistoryRepository _rewardPointsHistoryRepository;
  RewardPointsHistoryBloc(this._rewardPointsHistoryRepository)
      : super(RewardPointsHistoryLoadingState()) {
    on<RewardPointsHistoryEvent>((event, emit) async {
      final rewardPointHistoryList =
          await _rewardPointsHistoryRepository.getRewardPointsHistory();
      emit(RewardPointsHistoryLoadedState(
          rewardPointsHistoryModel: rewardPointHistoryList));
    });
  }
}
