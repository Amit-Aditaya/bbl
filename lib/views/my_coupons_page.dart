import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/my_coupon/my_coupon_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/my_coupon.dart';
import 'package:flutter_babuland_app/data/repository/coupon/my_coupon_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyCouponPage extends StatelessWidget {
  const MyCouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyCouponBloc(RepositoryProvider.of<MyCouponRepository>(context))
            ..add(LoadMyCouponApiEvent()),
      child: Scaffold(
          appBar: CustomAppBar(
            backgroundColor: Colors.white,
            title: 'My Coupons',
          ),
          backgroundColor: Colors.white,
          body: BlocBuilder<MyCouponBloc, MyCouponState>(
            builder: (context, state) {
              if (state is MyCouponLoadedState) {
                if (state.myCouponModel.items.isEmpty) {
                  return Center(
                    child: Text(
                      'You don\'t have any coupons',
                      style: TextStyle(color: AppColors.textGrey2),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: state.myCouponModel.items.length,
                      itemBuilder: (context, index) {
                        return MyCoupon(
                          pk: state.myCouponModel.items[index].pk,
                          couponItemId: state.myCouponModel.items[index].itemId,
                          couponCode:
                              state.myCouponModel.items[index].cuponCode,
                          ticketType:
                              state.myCouponModel.items[index].productName,
                          qty: state.myCouponModel.items[index].qty,
                          startDate: state.myCouponModel.items[index].startDate,
                          expireDate: state.myCouponModel.items[index].endDate,
                        );
                      });
                }
              } else {
                return Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          )),
    );
  }
}
