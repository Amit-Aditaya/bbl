part of 'membership_package_bloc.dart';

abstract class MembershipPackageEvent extends Equatable {
  const MembershipPackageEvent();

  @override
  List<Object> get props => [];
}

class LoadMembershipPackageApiEvent extends MembershipPackageEvent {}

class LoadMembershipRenewalPacakgeApiEvent extends MembershipPackageEvent {}

class LoadMembershipFamilyPacakgeApiEvent extends MembershipPackageEvent {}
