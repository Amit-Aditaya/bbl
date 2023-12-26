import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/memberhsip_package/membership_package_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/membership_select_child_page_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_card.dart';
import 'package:flutter_babuland_app/data/repository/memberhsip_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MembershipPackageBloc(
              RepositoryProvider.of<MembershipRepository>(context))
            ..add(LoadMembershipPackageApiEvent()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Memberships',
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(5),
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 55,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            end: Alignment.centerLeft,
                            begin: Alignment.centerRight,
                            colors: [
                              AppColors.appGradientColor1,
                              AppColors.appGradientColor2
                            ],
                          ),
                        ),
                        child: Center(
                          child: Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, 'activeMemberhsipPage');
                              },
                              child: Container(
                                height: 45,
                                width: 135,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'membershipHistoryPage');
                        },
                        child: Container(
                          height: 55,
                          width: 145,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              end: Alignment.centerLeft,
                              begin: Alignment.centerRight,
                              colors: [
                                AppColors.appGradientColor1,
                                AppColors.appGradientColor2
                              ],
                            ),
                          ),
                          child: Center(
                            child: Container(
                              height: 45,
                              width: 135,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  'History',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: BlocBuilder<MembershipPackageBloc,
                      MembershipPackageState>(
                    builder: (context, state) {
                      if (state is MembershipPackageLoadingState) {
                        return Center(
                            child: SpinKitCircle(
                          color: AppColors.primaryColor,
                        ));
                      } else if (state is MembershipPackageLoadedState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.membershipModel.items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, 'membershipSelectChildPage',
                                    arguments:
                                        MembershipSelectChildPageArgument(
                                      membershipCard: MembershipCard(
                                        id: state
                                            .membershipModel.items[index].id,
                                        packageTitle: state.membershipModel
                                            .items[index].packageTitle!,
                                        packageName: state.membershipModel
                                            .items[index].packageName,
                                        discountPrice: state.membershipModel
                                            .items[index].packagePrice,
                                        regularPrice: state.membershipModel
                                            .items[index].regularPrice,
                                        duration: state.membershipModel
                                            .items[index].packageTime,
                                        packageDescription: state
                                            .membershipModel
                                            .items[index]
                                            .packageDescription,
                                        packageValue: state.membershipModel
                                            .items[index].packageValue,
                                        packageType: state.membershipModel
                                            .items[index].packageType,
                                      ),
                                    ));
                              },
                              child: MembershipCard(
                                id: state.membershipModel.items[index].id,
                                packageTitle: state
                                    .membershipModel.items[index].packageTitle!,
                                packageName: state
                                    .membershipModel.items[index].packageName,
                                discountPrice: state
                                    .membershipModel.items[index].packagePrice,
                                regularPrice: state
                                    .membershipModel.items[index].regularPrice,
                                duration: state
                                    .membershipModel.items[index].packageTime,
                                packageDescription: state.membershipModel
                                    .items[index].packageDescription,
                                packageValue: state
                                    .membershipModel.items[index].packageValue,
                                packageType: state
                                    .membershipModel.items[index].packageValue,
                              ),
                            );
                          },
                          physics: const NeverScrollableScrollPhysics(),
                        );
                      } else {
                        return const CircularProgressIndicator(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
