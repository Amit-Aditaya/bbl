part of 'membership_subscription_bloc.dart';

abstract class MembershipSubscriptionEvent extends Equatable {
  const MembershipSubscriptionEvent();

  @override
  List<Object> get props => [];
}

class LoadMembershipSubscriptionApiEvent extends MembershipSubscriptionEvent {}
