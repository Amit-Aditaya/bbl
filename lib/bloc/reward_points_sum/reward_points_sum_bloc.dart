import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/reward_point_sum_model.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_sum_repository.dart';
import 'package:meta/meta.dart';

part 'reward_points_sum_event.dart';
part 'reward_points_sum_state.dart';

class RewardPointsSumBloc
    extends Bloc<RewardPointsSumEvent, RewardPointsSumState> {
  final RewardPointsSumRepository _pointsSumRepository;
  RewardPointsSumBloc(this._pointsSumRepository)
      : super(RewardPointsSumLoadingState()) {
    on<RewardPointsSumEvent>((event, emit) async {
      final rewardPointsSum = await _pointsSumRepository.getRewardPointsSum();
      emit(RewardPointsSumLoadedState(rewardPointsSumModel: rewardPointsSum));
    });
  }
}
