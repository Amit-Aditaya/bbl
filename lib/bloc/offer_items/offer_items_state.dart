part of 'offer_items_bloc.dart';

abstract class OfferItemsState extends Equatable {
  const OfferItemsState();

  @override
  List<Object> get props => [];
}

class OfferItemLoadingState extends OfferItemsState {}

class OfferItemLoadedState extends OfferItemsState {
  final OfferItemModel offerItemModel;
  const OfferItemLoadedState({
    required this.offerItemModel,
  });
}
