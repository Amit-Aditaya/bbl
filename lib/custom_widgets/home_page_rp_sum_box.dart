import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/reward_points_sum/reward_points_sum_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/babuland_coin.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_sum_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePageRewardPointSumBox extends StatelessWidget {
  const HomePageRewardPointSumBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardPointsSumBloc(
          RepositoryProvider.of<RewardPointsSumRepository>(context))
        ..add(LoadRewardPointsSumApiEvent()),
      child: SizedBox(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child:
                        BlocBuilder<RewardPointsSumBloc, RewardPointsSumState>(
                      builder: (context, state) {
                        if (state is RewardPointsSumLoadedState) {
                          return Text(
                            '${state.rewardPointsSumModel.items[0].creditSum - state.rewardPointsSumModel.items[0].debitSum}',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 16),
                          );
                        } else {
                          return SpinKitPulse(
                            color: AppColors.primaryColor,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  BabulandCoin(),
                ]),
          ),
        ),
      ),
    );
  }
}
