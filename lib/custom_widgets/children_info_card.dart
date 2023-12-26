import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/custom_classes/edit_child_profile_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/profile_page_membership_info.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChildrenInfoCard extends StatelessWidget {
  final String name;
  final int childId;
  final String dob;
  final String gender;
  final String grade;
  final String school;

  const ChildrenInfoCard({
    required this.name,
    required this.childId,
    required this.dob,
    required this.gender,
    required this.grade,
    required this.school,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembershipSubscriptionBloc(
          RepositoryProvider.of<MembershipSubscriptionRepository>(context))
        ..add(LoadMembershipSubscriptionApiEvent()),
      child: Container(
        //height: 340,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: 115,
              margin: const EdgeInsets.symmetric(vertical: 3),
              color: Colors.white,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  ListTile(
                    subtitle: Transform.translate(
                      offset: const Offset(0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Name: ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: name,
                                      style: TextStyle(
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Gender: ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: gender,
                                      style: TextStyle(
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Class: ',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: grade,
                                    style: TextStyle(
                                      color: AppColors.textGrey,
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 5),
                          FittedBox(
                            child: RichText(
                              overflow: TextOverflow.visible,
                              softWrap: false,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'School: ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: school,
                                      style: TextStyle(
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 5),
                          FittedBox(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Date Of Birth: ',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: dob,
                                      style: TextStyle(
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    tileColor: Colors.transparent,
                    leading: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70)),
                      child: Image.network(
                        '${AppLink.apiLink}apiv2/apiv1/childimage/$childId',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                        errorBuilder: ((context, error, stackTrace) {
                          return SvgPicture.asset(
                            'assets/images/user.svg',
                            height: 50,
                            width: 50,
                          );
                        }),
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'editChildProfilePage',
                          arguments: EditChildProfileArguments(
                              childId: childId,
                              childName: name,
                              childImage:
                                  'http://apps.babuland.org/bblapi/apiv2/apiv1/childimage/$childId',
                              childSchool: school,
                              childClass: grade,
                              gender: gender,
                              dob: dob),
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.primaryColor,
              thickness: 1,
              indent: 75,
              endIndent: 75,
            ),
            Text(
              'Membership Info',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            BlocBuilder<MembershipSubscriptionBloc,
                MembershipSubscriptionState>(
              builder: (context, state) {
                int numberOfMemberships = 0;

                if (state is MembershipSubscriptionLoadedState) {
                  for (int i = 0;
                      i < state.membershipSubscriptionModel.items.length;
                      i++) {
                    String expDate =
                        state.membershipSubscriptionModel.items[i].expireDate;
                    DateTime randomDateTime;
                    late DateTime expDateDateTime;

                    if (state.membershipSubscriptionModel.items[i].expireDate ==
                        'N/A') {
                      randomDateTime = DateTime(1900, 01, 01);
                    } else {
                      String eDate = expDate.substring(0, 2);
                      int ed = int.parse(eDate);
                      String eMonth = expDate.substring(3, 5);
                      int em = int.parse(eMonth);
                      String eYear = expDate.substring(6, 10);
                      int ey = int.parse(eYear);
                      expDateDateTime = DateTime(ey, em, ed);
                    }
                    if (state.membershipSubscriptionModel.items[i]
                                .chaildId ==
                            childId &&
                        state.membershipSubscriptionModel.items[i].expireDate !=
                            'N/A' &&
                        DateTime.now().isBefore(expDateDateTime)) {
                      numberOfMemberships++;
                    }
                  }
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.transparent,
                    child: ProfilePageMembershipInfo(
                      numberOfMemberships: numberOfMemberships,
                      membershipStatus: numberOfMemberships == 0
                          ? 'No Active Memberships'
                          : '$numberOfMemberships Active Memberships',
                    ),
                  );
                } else {
                  return Center(
                    child: CupertinoActivityIndicator(
                        color: AppColors.primaryColor),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
