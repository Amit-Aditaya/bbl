import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/reward_points_history/reward_points_history_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/babuland_coin.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/reward_points_repository/reward_points_history_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RewardPointsHistoryPage extends StatelessWidget {
  RewardPointsHistoryPage({Key? key}) : super(key: key);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardPointsHistoryBloc(
          RepositoryProvider.of<RewardPointsHistoryRepository>(context))
        ..add(LoadRewardPointsHistoryApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Reward Points History',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<RewardPointsHistoryBloc, RewardPointsHistoryState>(
          builder: (context, state) {
            if (state is RewardPointsHistoryLoadedState) {
              if (state.rewardPointsHistoryModel.items.isEmpty) {
                return Center(
                  child: Text(
                    'No Reward Points',
                    style: TextStyle(color: AppColors.textGrey2),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: state.rewardPointsHistoryModel.items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.primaryColor, width: 1),
                        ),
                        width: double.infinity,
                        height: 60,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.rewardPointsHistoryModel.items[index]
                                  .pkgName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              state.rewardPointsHistoryModel.items[index]
                                  .addedOn,
                              style: TextStyle(
                                  color: AppColors.textGrey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                                child: Row(
                              children: [
                                state.rewardPointsHistoryModel.items[index]
                                            .trxType ==
                                        'CREDIT'
                                    ? Text(
                                        '+ ${state.rewardPointsHistoryModel.items[index].rpQty}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.primaryGreen),
                                      )
                                    : Text(
                                        '- ${state.rewardPointsHistoryModel.items[index].rpQty}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.primaryRed),
                                      ),
                                const SizedBox(width: 5),
                                const BabulandCoin(),
                              ],
                            )),
                          ],
                        ),
                      );
                    });
              }
            } else {
              return Center(
                  child: SpinKitFadingGrid(
                color: AppColors.primaryColor,
              ));
            }
          },
        ),
      ),
    );
  }
}
