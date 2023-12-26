import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/coupon/my_coupon_model.dart';
import 'package:flutter_babuland_app/data/repository/coupon/my_coupon_repository.dart';
import 'package:meta/meta.dart';

part 'my_coupon_event.dart';
part 'my_coupon_state.dart';

class MyCouponBloc extends Bloc<MyCouponEvent, MyCouponState> {
  final MyCouponRepository _myCouponRepository;

  MyCouponBloc(this._myCouponRepository) : super(MyCouponLoadingState()) {
    on<MyCouponEvent>((event, emit) async {
      final myCoupons = await _myCouponRepository.getMyCoupons();
      emit(MyCouponLoadedState(myCouponModel: myCoupons));
    });
  }
}
