import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/coupon_item_model.dart';
import 'package:flutter_babuland_app/data/repository/coupon_item_repository.dart';
import 'package:meta/meta.dart';

part 'coupon_item_event.dart';
part 'coupon_item_state.dart';

class CouponItemBloc extends Bloc<CouponItemEvent, CouponItemState> {
  final CouponItemRepository _couponItemRepository;
  CouponItemBloc(this._couponItemRepository) : super(CouponItemLoadingState()) {
    on<CouponItemEvent>((event, emit) async {
      final couponItems = await _couponItemRepository.getCouponItems();
      emit(CouponItemLoadedState(couponItemModel: couponItems));
    });
  }
}
