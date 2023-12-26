import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/children/children_bloc.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/home_page_membership_information.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePageMembershipInfoTabviewContainer extends StatelessWidget {
  const HomePageMembershipInfoTabviewContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ChildrenBloc(RepositoryProvider.of<ChildrenRepository>(context))
                ..add(LoadChildrenApiEvent()),
        ),
        BlocProvider(
          create: (context) => MembershipSubscriptionBloc(
              RepositoryProvider.of<MembershipSubscriptionRepository>(context))
            ..add(LoadMembershipSubscriptionApiEvent()),
        ),
      ],
      child: Container(
        height: 210,
        color: Colors.transparent,
        child: Column(
          children: [
            BlocBuilder<ChildrenBloc, ChildrenState>(
              builder: (context, state) {
                if (state is ChildrenLoadedState) {
                  if (state.childrenModel.items.isEmpty) {
                    return DefaultTabController(
                      length: 1,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Center(
                              child: TabPageSelector(
                                selectedColor: AppColors.primaryColor,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 180,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: TabBarView(
                                children: List.generate(1, (index) {
                              return HomePageMembershipInformation(
                                childName: 'Buy Membership',
                              );
                            })),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return DefaultTabController(
                      length: state.childrenModel.items.length,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Center(
                              child: TabPageSelector(
                                selectedColor: AppColors.primaryColor,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 180,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: TabBarView(
                                children: List.generate(
                                    state.childrenModel.items.length, (index) {
                              return HomePageMembershipInformation(
                                childName:
                                    state.childrenModel.items[index].childName,
                              );
                            })),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Center(
                      child: SpinKitWave(
                    color: AppColors.primaryColor,
                    size: 25,
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
