import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/branch_traffic/badda/badda_traffic/badda_traffic_bloc.dart';
import 'package:flutter_babuland_app/bloc/branch_traffic/mirpur/mirpur_traffic/mirpur_traffic_bloc.dart';
import 'package:flutter_babuland_app/bloc/branch_traffic/uttara/uttara_traffic/uttara_traffic_bloc.dart';
import 'package:flutter_babuland_app/bloc/branch_traffic/wari/wari_traffic/wari_traffic_bloc.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/badda_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/mirpur_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/uttara_traffic_repository.dart';
import 'package:flutter_babuland_app/data/repository/branch_traffic_repo/wari_traffic_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GuestVolumeSlider extends StatelessWidget {
  final String branchName;
  final int branchCapacity;
  final int trafficId;
  GuestVolumeSlider({
    Key? key,
    required this.branchName,
    required this.branchCapacity,
    required this.trafficId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MirpurTrafficBloc(
              RepositoryProvider.of<MirpurTrafficRepository>(context))
            ..add(trafficId == 1
                ? LoadMirpurTrafficApiEvent()
                : LoadMirpurTrafficNullEvent()),
        ),
        BlocProvider(
          create: (context) => UttaraTrafficBloc(
              RepositoryProvider.of<UttaraTrafficRepository>(context))
            ..add(trafficId == 2
                ? LoadUttaraTrafficApiEvent()
                : LoadUttaraTrafficNullEvent()),
        ),
        BlocProvider(
          create: (context) => BaddaTrafficBloc(
              RepositoryProvider.of<BaddaTrafficRepository>(context))
            ..add(trafficId == 4
                ? LoadBaddaTrafficApiEvent()
                : LoadBaddaTrafficNullEvent()),
        ),
        BlocProvider(
          create: (context) => WariTrafficBloc(
              RepositoryProvider.of<WariTrafficRepository>(context))
            ..add(trafficId == 3
                ? LoadWariTrafficApiEvent()
                : LoadWariTrafficNullEvent()),
        ),
      ],
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              branchName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrey,
              ),
            ),
            const SizedBox(height: 10),
            trafficId == 1
                ? BlocBuilder<MirpurTrafficBloc, MirpurTrafficState>(
                    builder: (context, state) {
                      if (state is MirpurTrafficLoadedState) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(colors: [
                                Color(0xff7ffa84),
                                Color(0xffFFF200),
                                Color(0xffe84141),
                              ])),
                          height: 40,
                          width: double.infinity,
                          child: Slider(
                            activeColor: Colors.brown.shade700,
                            inactiveColor: Colors.white,
                            value: state.mirpurTrafficModel.items[0].qty
                                    ?.toDouble() ??
                                0,
                            onChanged: (x) {},
                            min: 0,
                            max: branchCapacity.toDouble(),
                          ),
                        );
                      } else {
                        return SpinKitThreeInOut(
                          color: AppColors.primaryColor,
                          size: 25,
                        );
                      }
                    },
                  )
                : trafficId == 2
                    ? BlocBuilder<UttaraTrafficBloc, UttaraTrafficState>(
                        builder: (context, state) {
                          if (state is UttaraTrafficLoadedState) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xff7ffa84),
                                    Color(0xffFFF200),
                                    Color(0xffe84141),
                                  ])),
                              height: 40,
                              width: double.infinity,
                              child: Slider(
                                activeColor: Colors.brown.shade700,
                                inactiveColor: Colors.white,
                                value: state.uttaraTrafficModel.items[0].qty
                                        ?.toDouble() ??
                                    0,
                                onChanged: (x) {},
                                min: 0,
                                max: branchCapacity.toDouble(),
                              ),
                            );
                          } else {
                            return SpinKitThreeInOut(
                              color: AppColors.primaryColor,
                              size: 25,
                            );
                          }
                        },
                      )
                    : trafficId == 3
                        ? BlocBuilder<WariTrafficBloc, WariTrafficState>(
                            builder: (context, state) {
                              if (state is WariTrafficLoadedState) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff7ffa84),
                                        Color(0xffFFF200),
                                        Color(0xffe84141),
                                      ])),
                                  height: 40,
                                  width: double.infinity,
                                  child: Slider(
                                    activeColor: Colors.brown.shade700,
                                    inactiveColor: Colors.white,
                                    value: state.wariTrafficModel.items[0].qty
                                            ?.toDouble() ??
                                        0,
                                    onChanged: (x) {},
                                    min: 0,
                                    max: branchCapacity.toDouble(),
                                  ),
                                );
                              } else {
                                return SpinKitThreeInOut(
                                  color: AppColors.primaryColor,
                                  size: 25,
                                );
                              }
                            },
                          )
                        : BlocBuilder<BaddaTrafficBloc, BaddaTrafficState>(
                            builder: (context, state) {
                              if (state is BaddaTrafficLoadedState) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff7ffa84),
                                        Color(0xffFFF200),
                                        Color(0xffe84141),
                                      ])),
                                  height: 40,
                                  width: double.infinity,
                                  child: Slider(
                                    activeColor: Colors.brown.shade700,
                                    inactiveColor: Colors.white,
                                    value: state.baddaTrafficModel.items[0].qty
                                            ?.toDouble() ??
                                        0,
                                    onChanged: (x) {},
                                    min: 0,
                                    max: branchCapacity.toDouble(),
                                  ),
                                );
                              } else {
                                return SpinKitThreeInOut(
                                  color: AppColors.primaryColor,
                                  size: 25,
                                );
                              }
                            },
                          ),
          ]),
    );
  }
}
