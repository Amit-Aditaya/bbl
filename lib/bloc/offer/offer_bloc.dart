import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/offer_model.dart';
import 'package:flutter_babuland_app/data/repository/offer_repository.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final OfferRepository _offerRepository;
  OfferBloc(this._offerRepository) : super(OfferLoadingState()) {
    on<OfferEvent>((event, emit) async {
      final offerList = await _offerRepository.getOffers();
      emit(OfferLoadedState(offerModel: offerList));
    });
  }
}
