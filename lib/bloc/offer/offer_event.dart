part of 'offer_bloc.dart';

abstract class OfferEvent extends Equatable {
  const OfferEvent();

  @override
  List<Object> get props => [];
}

class LoadOfferApiEvent extends OfferEvent {}
