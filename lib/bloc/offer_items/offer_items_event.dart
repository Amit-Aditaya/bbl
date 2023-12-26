part of 'offer_items_bloc.dart';

abstract class OfferItemsEvent extends Equatable {
  const OfferItemsEvent();

  @override
  List<Object> get props => [];
}

class LoadOfferItemApiEvent extends OfferItemsEvent {}
