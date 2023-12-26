import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/children/children_bloc.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/children_info_card.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePageCardInfoTabViewContainer extends StatelessWidget {
  const ProfilePageCardInfoTabViewContainer({Key? key}) : super(key: key);

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
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [AppShadows.buttonShadow],
        ),
        child: BlocBuilder<ChildrenBloc, ChildrenState>(
          builder: (context, state) {
            if (state is ChildrenLoadedState) {
              return Column(
                children: [
                  DefaultTabController(
                    length: state.childrenModel.items.length, // length of tabs
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
                          height: 300,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: TabBarView(
                              children: List.generate(
                                  state.childrenModel.items.length, (index) {
                            return ChildrenInfoCard(
                                childId: (state.childrenModel.items
                                        as dynamic)[index]
                                    .childId,
                                name:
                                    state.childrenModel.items[index].childName,
                                dob: state
                                    .childrenModel.items[index].dateOfBirth,
                                gender: state.childrenModel.items[index].gender,
                                grade:
                                    state.childrenModel.items[index].eduClass ??
                                        'N/A',
                                school:
                                    state.childrenModel.items[index].school ??
                                        'N/A');
                          })),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: SpinKitWave(
                  color: AppColors.primaryColor,
                  size: 25,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
