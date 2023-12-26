import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/coupon_item/coupon_item_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/coupon.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_offer_stamp.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_details_card_2.dart';
import 'package:flutter_babuland_app/data/repository/coupon_item_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CouponListPage extends StatelessWidget {
  const CouponListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CouponItemBloc(RepositoryProvider.of<CouponItemRepository>(context))
            ..add(LoadCouponItemApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Coupons',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<CouponItemBloc, CouponItemState>(
          builder: (context, state) {
            if (state is CouponItemLoadedState) {
              return ListView.builder(
                  itemCount: state.couponItemModel.items.length,
                  itemBuilder: (context, index) {
                    return Coupon(
                      couponName: state.couponItemModel.items[index].coupon,
                      dicountPct: state.couponItemModel.items[index].discPct,
                    );
                  });
            } else {
              return Center(
                child: SpinKitCircle(color: AppColors.primaryColor),
              );
            }
          },
        ),
      ),
    );
  }
}
