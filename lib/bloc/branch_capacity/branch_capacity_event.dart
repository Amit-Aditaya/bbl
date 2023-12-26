part of 'branch_capacity_bloc.dart';

abstract class BranchCapacityEvent extends Equatable {
  const BranchCapacityEvent();

  @override
  List<Object> get props => [];
}

class LoadBranchCapacityApiEvent extends BranchCapacityEvent {}
