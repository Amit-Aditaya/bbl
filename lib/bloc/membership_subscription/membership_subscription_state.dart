part of 'membership_subscription_bloc.dart';

abstract class MembershipSubscriptionState extends Equatable {
  const MembershipSubscriptionState();

  @override
  List<Object> get props => [];
}

class MembershipSubscriptionLoadingState extends MembershipSubscriptionState {}

class MembershipSubscriptionLoadedState extends MembershipSubscriptionState {
  final MembershipSubscriptionModel membershipSubscriptionModel;
  const MembershipSubscriptionLoadedState({
    required this.membershipSubscriptionModel,
  });
}
