part of 'reward_points_history_bloc.dart';

@immutable
abstract class RewardPointsHistoryState {}

class RewardPointsHistoryLoadingState extends RewardPointsHistoryState {}

class RewardPointsHistoryLoadedState extends RewardPointsHistoryState {
  final RewardPointsHistoryModel rewardPointsHistoryModel;
  RewardPointsHistoryLoadedState({
    required this.rewardPointsHistoryModel,
  });
}
