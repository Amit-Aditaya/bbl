import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/string_to_date.dart';
import 'package:flutter_babuland_app/data/model/membership_subscription_model.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePageMembershipInformation extends StatelessWidget {
  String childName;

  Set<Item> indexChildList = Set();

  HomePageMembershipInformation({
    Key? key,
    required this.childName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembershipSubscriptionBloc(
          RepositoryProvider.of<MembershipSubscriptionRepository>(context))
        ..add(LoadMembershipSubscriptionApiEvent()),
      child: Container(
        color: Colors.transparent,
        height: 180,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 360) {
                  return Container(
                    height: 27,
                    width: 90,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff2EC2E8),
                      boxShadow: [AppShadows.buttonShadow],
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'membershipHistoryPage');
                        },
                        child: const Text(
                          'History',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                } else if (constraints.maxWidth > 320) {
                  return Container(
                    height: 27,
                    width: 80,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff2EC2E8),
                      boxShadow: [AppShadows.buttonShadow],
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'membershipHistoryPage');
                        },
                        child: const Text(
                          'History',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 27,
                    width: 70,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff2EC2E8),
                      boxShadow: [AppShadows.buttonShadow],
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'membershipHistoryPage');
                        },
                        child: const Text(
                          'History',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                }
              }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 360) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'membershipPage');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3.5),
                        height: 27,
                        width: 90,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primaryGreen,
                          boxShadow: [AppShadows.buttonShadow],
                        ),
                        child: FittedBox(
                          child: Text(
                            childName.split(' ').first,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    );
                  } else if (constraints.maxWidth > 320) {
                    return Container(
                      padding: const EdgeInsets.all(3.5),
                      height: 27,
                      width: 80,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.primaryGreen,
                        boxShadow: [AppShadows.buttonShadow],
                      ),
                      child: Center(
                        child: Text(
                          childName.split(' ').first,
                          style:
                              const TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(3.5),
                      height: 27,
                      width: 70,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.primaryGreen,
                        boxShadow: [AppShadows.buttonShadow],
                      ),
                      child: Center(
                        child: Text(
                          childName.split(' ').first,
                          style:
                              const TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [AppShadows.buttonShadow],
                ),
                child: Center(
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 7.5,
                        ),
                        BlocBuilder<MembershipSubscriptionBloc,
                            MembershipSubscriptionState>(
                          builder: (context, state) {
                            if (state is MembershipSubscriptionLoadedState) {
                              for (int i = 0;
                                  i <
                                      state.membershipSubscriptionModel.items
                                          .length;
                                  i++) {
                                String expDate = state
                                    .membershipSubscriptionModel
                                    .items[i]
                                    .expireDate;
                                DateTime randomDateTime;
                                late DateTime expDateDateTime;

                                if (state.membershipSubscriptionModel.items[i]
                                        .expireDate ==
                                    'N/A') {
                                  randomDateTime = DateTime(1900, 01, 01);
                                } else {
                                  expDateDateTime =
                                      StringToDate.convertStringToDate(expDate);
                                }

                                if (state.membershipSubscriptionModel.items[i]
                                            .chaildName ==
                                        childName &&
                                    state.membershipSubscriptionModel.items[i]
                                            .expireDate !=
                                        'N/A' &&
                                    DateTime.now().isBefore(expDateDateTime)) {
                                  indexChildList.add(state
                                      .membershipSubscriptionModel.items[i]);
                                }
                              }
                              DateTime maxDateTime = DateTime(1900, 01, 01);
                              for (int i = 0; i < indexChildList.length; i++) {
                                String indexStringDate =
                                    indexChildList.elementAt(i).expireDate;
                                DateTime indexDateTime =
                                    StringToDate.convertStringToDate(
                                        indexStringDate);
                                if (indexDateTime.isAfter(maxDateTime)) {
                                  maxDateTime = indexDateTime;
                                }
                              }

                              int dateDifference = maxDateTime
                                      .difference(DateTime.now())
                                      .inDays +
                                  1;

                              return dateDifference <= 0
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, 'membershipPage');
                                      },
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Buy',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Text(
                                            'Membership',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Icon(
                                            Icons.card_membership,
                                            color: AppColors.primaryColor,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          '${dateDifference}',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 36,
                                          ),
                                        ),
                                        const Text(
                                          'Days\n Remaining',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    );
                            } else {
                              return SpinKitHourGlass(
                                color: AppColors.primaryColor,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
