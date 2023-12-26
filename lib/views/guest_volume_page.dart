import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/branch_capacity/branch_capacity_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/guest_volume_slider.dart';
import 'package:flutter_babuland_app/data/repository/branch_capacity_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestVolumePage extends StatelessWidget {
  GuestVolumePage({Key? key}) : super(key: key);
  double y = 30;

  @override
  Widget build(BuildContext context) {
    double rating = y;
    return BlocProvider(
      create: (context) => BranchCapacityBloc(
          RepositoryProvider.of<BranchCapacityRepository>(context))
        ..add(LoadBranchCapacityApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Guest Volume',
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffffffff),
                  Color(0xffffd194),
                  // Color(0xffabbaab),
                  //  AppColors.primaryColor
                ]),
          ),
          child: BlocBuilder<BranchCapacityBloc, BranchCapacityState>(
            builder: (context, state) {
              if (state is BranchCapacityLoadedState) {
                return ListView.builder(
                    itemCount: state.branchCapacityModel.items.length,
                    itemBuilder: (context, index) {
                      return GuestVolumeSlider(
                          trafficId:
                              state.branchCapacityModel.items[index].trafficId,
                          branchName:
                              state.branchCapacityModel.items[index].branch,
                          branchCapacity: state
                              .branchCapacityModel.items[index].branchCapacity);
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
