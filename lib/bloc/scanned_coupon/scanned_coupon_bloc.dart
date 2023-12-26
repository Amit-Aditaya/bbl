import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/coupon/scanned_coupon_model.dart';
import 'package:flutter_babuland_app/data/repository/coupon/scanned_coupon_repository.dart';
import 'package:meta/meta.dart';

part 'scanned_coupon_event.dart';
part 'scanned_coupon_state.dart';

class ScannedCouponBloc extends Bloc<ScannedCouponEvent, ScannedCouponState> {
  final ScannedCouponRepository scannedCouponRepository;
  final String couponValue;
  ScannedCouponBloc(
      {required this.scannedCouponRepository, required this.couponValue})
      : super(ScannedCouponLoadingState()) {
    on<ScannedCouponEvent>((event, emit) async {
      final scannedCoupon =
          await scannedCouponRepository.getScannedTicket(couponValue);
      emit(ScannedCouponLoadedState(scannedCouponModel: scannedCoupon));
    });
  }
}
