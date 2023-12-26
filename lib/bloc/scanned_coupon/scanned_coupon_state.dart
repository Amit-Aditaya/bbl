part of 'scanned_coupon_bloc.dart';

@immutable
abstract class ScannedCouponState {}

class ScannedCouponLoadingState extends ScannedCouponState {}

class ScannedCouponLoadedState extends ScannedCouponState {
  final ScannedCouponModel scannedCouponModel;

  ScannedCouponLoadedState({required this.scannedCouponModel});
}
