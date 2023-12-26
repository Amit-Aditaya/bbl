import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/children/children_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/buy_membership_page_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_child_membership_radio_button.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_card.dart';
import 'package:flutter_babuland_app/data/repository/children_repo.dart';
import 'package:flutter_babuland_app/theme_helpers/app_border.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MembershipSelectChildPage extends StatelessWidget {
  //const MembershipSelectChildPage({Key? key}) : super(key: key);
  final MembershipCard membershipcard;
  const MembershipSelectChildPage({
    Key? key,
    required this.membershipcard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChildrenBloc(RepositoryProvider.of<ChildrenRepository>(context))
            ..add(LoadChildrenApiEvent()),
      child: Scaffold(
        body: Container(
          color: Colors.black.withOpacity(.65),
          child: Center(
              child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * .75,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: [AppShadows.buttonShadow],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AppBorder(),
                const SizedBox(height: 10),
                Text(
                  'Select Child',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
                ),
                BlocBuilder<ChildrenBloc, ChildrenState>(
                  builder: (context, state) {
                    if (state is ChildrenLoadedState) {
                      if (state.childrenModel.items.isEmpty) {
                        return Center(
                          child: Text(
                            'No child information, please add a child from profile page',
                            style: TextStyle(color: AppColors.textGrey2),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return CustomChildMembershipRadioButton(
                        childrenModel: state.childrenModel,
                      );
                    } else {
                      return SpinKitFadingGrid(
                        color: AppColors.primaryColor,
                      );
                    }
                  },
                ),
                BlocBuilder<ChildrenBloc, ChildrenState>(
                  builder: (context, state) {
                    if (state is ChildrenLoadedState) {
                      if (state.childrenModel.items.isEmpty) {
                        return TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: AppColors.primaryColor))),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '      Back      ',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: AppColors.primaryColor))),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.primaryColor)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                '      Back      ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: AppColors.primaryColor))),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.primaryColor)),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, 'buyMembershipPage',
                                    arguments: BuyMembershipPageArguments(
                                      packageId: membershipcard.id,
                                      regularPrice: membershipcard.regularPrice,
                                      offerPrice: membershipcard.discountPrice,
                                      duration: membershipcard.duration,
                                      packageValue: membershipcard.packageValue,
                                      packageName: membershipcard.packageName,
                                      packageTitle: membershipcard.packageTitle,
                                      packageType: membershipcard.packageType,
                                    ));
                              },
                              child: const Text(
                                '  Confirm  ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      }
                    } else {
                      return SpinKitWave(
                        color: AppColors.primaryColor,
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const AppBorder(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
