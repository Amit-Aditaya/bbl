part of 'branch_capacity_bloc.dart';

abstract class BranchCapacityState extends Equatable {
  const BranchCapacityState();

  @override
  List<Object> get props => [];
}

class BranchCapacityLoadingState extends BranchCapacityState {}

class BranchCapacityLoadedState extends BranchCapacityState {
  final BranchCapacityModel branchCapacityModel;
  const BranchCapacityLoadedState({
    required this.branchCapacityModel,
  });
}
