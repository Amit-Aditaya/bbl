part of 'offer_bloc.dart';

abstract class OfferState extends Equatable {
  const OfferState();

  @override
  List<Object> get props => [];
}

class OfferLoadingState extends OfferState {}

class OfferLoadedState extends OfferState {
  final OfferModel offerModel;
  const OfferLoadedState({
    required this.offerModel,
  });
}
