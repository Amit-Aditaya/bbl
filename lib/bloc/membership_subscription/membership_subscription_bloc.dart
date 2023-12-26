import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/membership_subscription_model.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';

part 'membership_subscription_event.dart';
part 'membership_subscription_state.dart';

class MembershipSubscriptionBloc
    extends Bloc<MembershipSubscriptionEvent, MembershipSubscriptionState> {
  final MembershipSubscriptionRepository _membershipSubscriptionRepository;
  MembershipSubscriptionBloc(this._membershipSubscriptionRepository)
      : super(MembershipSubscriptionLoadingState()) {
    on<LoadMembershipSubscriptionApiEvent>((event, emit) async {
      final subscription =
          await _membershipSubscriptionRepository.getMembershipSubscriptions();
      emit(MembershipSubscriptionLoadedState(
          membershipSubscriptionModel: subscription));
    });
  }
}
