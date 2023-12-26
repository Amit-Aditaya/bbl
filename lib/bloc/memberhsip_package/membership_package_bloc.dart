import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/membership_model.dart';
import 'package:flutter_babuland_app/data/repository/memberhsip_repository.dart';

part 'membership_package_event.dart';
part 'membership_package_state.dart';

class MembershipPackageBloc
    extends Bloc<MembershipPackageEvent, MembershipPackageState> {
  final MembershipRepository _membershipRepository;

  MembershipPackageBloc(this._membershipRepository)
      : super(MembershipPackageLoadingState()) {
    on<LoadMembershipPackageApiEvent>(
      (event, emit) async {
        final packages = await _membershipRepository.getMembershipPackages();
        emit(MembershipPackageLoadedState(membershipModel: packages));
      },
    );
  }
}
