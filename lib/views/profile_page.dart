import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/children/children_bloc.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/custom_classes/edit_profile_page_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/profile_page_card_info_tabview_container.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_babuland_app/views/add_child_page.dart';
import 'package:flutter_babuland_app/views/delete_profile_page.dart';
import 'package:flutter_babuland_app/views/new_login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  int? mobileNumber;
  int? customerId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
                ..add(LoadCustomerApiEvent()),
        ),
        BlocProvider(
          create: (context) => MembershipSubscriptionBloc(
              RepositoryProvider.of<MembershipSubscriptionRepository>(context))
            ..add(LoadMembershipSubscriptionApiEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ChildrenBloc(RepositoryProvider.of<ChildrenRepository>(context))
                ..add(LoadChildrenApiEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          title: Text(
            'Profile',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Platform.isAndroid
                ? const SizedBox(height: 1)
                : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, 'deleteProfilePage',
                            arguments: DeleteProfilePage(
                              phoneNumber: mobileNumber!,
                              customerId: customerId!,
                            ));
                      },
                      child: Icon(
                        CupertinoIcons.delete,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  )
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  color: Colors.transparent,
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, 'photoAlbumPage');
                      //   },
                      //   child: const Text(
                      //     'Photo Album',
                      //     style: TextStyle(
                      //         color: Color(0xff0645AD),
                      //         fontSize: 17,
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      // ),
                      BlocBuilder<CustomerBloc, CustomerState>(
                        builder: (context, state) {
                          if (state is CustomerLoadedState) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'editProfilePage',
                                    arguments: EditProfilePageArguments(
                                        id: state.customerModel.items[0].id,
                                        name:
                                            '${state.customerModel.items[0].fullname}',
                                        email:
                                            '${state.customerModel.items[0].emailAddress}',
                                        address:
                                            '${state.customerModel.items[0].address}',
                                        image:
                                            'http://apps.babuland.org/bblapi/apiv2/apiv1/memberimage/${state.customerModel.items[0].id}',
                                        spouseName:
                                            '${state.customerModel.items[0].spouseName}',
                                        gender:
                                            '${state.customerModel.items[0].mrMrs}',
                                        prefferedBranch:
                                            '${state.customerModel.items[0].pBranch}'));
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
                            );
                          } else {
                            return const Center(
                              child: Text(''),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [AppShadows.buttonShadow],
                  ),
                  child: BlocBuilder<CustomerBloc, CustomerState>(
                    builder: (context, state) {
                      if (state is CustomerLoadedState) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              '${AppLink.apiLink}apiv2/apiv1/memberimage/${state.customerModel.items[0].id}',
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              errorBuilder: ((context, error, stackTrace) {
                                return SvgPicture.asset(
                                  'assets/images/user.svg',
                                  height: 90,
                                  width: 90,
                                );
                              }),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: SpinKitPulse(
                            color: AppColors.textGrey2,
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is CustomerLoadedState) {
                      mobileNumber =
                          int.parse(state.customerModel.items[0].mobileNumber);
                      customerId = state.customerModel.items[0].id;
                      if (state.customerModel.items[0].fullname == null) {
                        return Text(
                          '${state.customerModel.items[0].mobileNumber}',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        );
                      }
                      return Text(
                        '${state.customerModel.items[0].fullname}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      );
                    } else {
                      return SpinKitThreeBounce(
                        size: 25,
                        color: AppColors.textGrey2,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.textGrey2,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  color: Colors.transparent,
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        width: 90,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        width: 90,
                        child: Center(
                            child: Text(
                          'Children',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        )),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        width: 90,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [AppShadows.buttonShadow],
                              color: AppColors.primaryColor,
                            ),
                            child: BlocBuilder<CustomerBloc, CustomerState>(
                              builder: (context, state) {
                                if (state is CustomerLoadedState) {
                                  return Center(
                                    child: FittedBox(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'addChildPage',
                                              arguments: AddChildPage(
                                                  guardianId: state
                                                      .customerModel
                                                      .items[0]
                                                      .id));
                                        },
                                        child: const Text(
                                          'Add Child +',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: SpinKitPianoWave(
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<ChildrenBloc, ChildrenState>(
                  builder: (context, state) {
                    if (state is ChildrenLoadedState) {
                      if (state.childrenModel.items.isEmpty) {
                        return SizedBox(
                          height: 150,
                          child: Center(
                            child: Text(
                              'No Children Information',
                              style: TextStyle(color: AppColors.textGrey2),
                            ),
                          ),
                        );
                      } else {
                        return const ProfilePageCardInfoTabViewContainer();
                      }
                    } else {
                      return const CupertinoActivityIndicator();
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
