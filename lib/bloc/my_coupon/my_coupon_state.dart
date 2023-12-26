part of 'my_coupon_bloc.dart';

@immutable
abstract class MyCouponState {}

class MyCouponLoadingState extends MyCouponState {}

class MyCouponLoadedState extends MyCouponState {
  final MyCouponModel myCouponModel;
  MyCouponLoadedState({required this.myCouponModel});
}
