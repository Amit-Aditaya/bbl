import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/branch_capacity_model.dart';
import 'package:flutter_babuland_app/data/repository/branch_capacity_repository.dart';

part 'branch_capacity_event.dart';
part 'branch_capacity_state.dart';

class BranchCapacityBloc
    extends Bloc<BranchCapacityEvent, BranchCapacityState> {
  final BranchCapacityRepository _branchCapacityRepository;
  BranchCapacityBloc(this._branchCapacityRepository)
      : super(BranchCapacityLoadingState()) {
    on<BranchCapacityEvent>((event, emit) async {
      final branchCapacity =
          await _branchCapacityRepository.getBranchCapacity();
      emit(BranchCapacityLoadedState(branchCapacityModel: branchCapacity));
    });
  }
}
