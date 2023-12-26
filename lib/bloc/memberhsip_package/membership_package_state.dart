part of 'membership_package_bloc.dart';

abstract class MembershipPackageState extends Equatable {
  const MembershipPackageState();

  @override
  List<Object> get props => [];
}

class MembershipPackageLoadingState extends MembershipPackageState {}

class MembershipPackageLoadedState extends MembershipPackageState {
  final MembershipModel membershipModel;
  const MembershipPackageLoadedState({
    required this.membershipModel,
  });

  @override
  List<Object> get props => [];
}
