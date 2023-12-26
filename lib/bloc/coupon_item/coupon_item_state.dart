part of 'coupon_item_bloc.dart';

@immutable
abstract class CouponItemState {}

class CouponItemLoadingState extends CouponItemState {}

class CouponItemLoadedState extends CouponItemState {
  final CouponItemModel couponItemModel;
  CouponItemLoadedState({required this.couponItemModel});
}
