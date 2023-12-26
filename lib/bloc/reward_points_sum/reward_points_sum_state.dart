part of 'reward_points_sum_bloc.dart';

@immutable
abstract class RewardPointsSumState {}

class RewardPointsSumLoadingState extends RewardPointsSumState {}

class RewardPointsSumLoadedState extends RewardPointsSumState {
  final RewardPointsSumModel rewardPointsSumModel;
  RewardPointsSumLoadedState({
    required this.rewardPointsSumModel,
  });
}
