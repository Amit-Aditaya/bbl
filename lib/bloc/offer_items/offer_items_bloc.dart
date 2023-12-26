import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_babuland_app/data/model/offer_item_model.dart';
import 'package:flutter_babuland_app/data/repository/offer_item_repository.dart';

part 'offer_items_event.dart';
part 'offer_items_state.dart';

class OfferItemsBloc extends Bloc<OfferItemsEvent, OfferItemsState> {
  final OfferItemRepository _offerItemRepository;
  final int pk;
  OfferItemsBloc(this._offerItemRepository, this.pk)
      : super(OfferItemLoadingState()) {
    on<OfferItemsEvent>((event, emit) async {
      final offerItems = await _offerItemRepository.getOfferItems(pk: pk);
      emit(OfferItemLoadedState(offerItemModel: offerItems));
    });
  }
}
