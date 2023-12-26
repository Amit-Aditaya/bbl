import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/membership_invoice_arguments.dart';
import 'package:flutter_babuland_app/custom_classes/string_to_date.dart';
import 'package:flutter_babuland_app/custom_classes/temp_child_name_holder.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/membership_card.dart';
import 'package:flutter_babuland_app/data/model/membership_subscription_model.dart'
    as membershipSubModelItem;
import 'package:flutter_babuland_app/data/repository/memberhsip_repository.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class BuyMembershipPage extends StatelessWidget {
  final int regularPrice;
  final int offerPrice;
  final int duration;
  final int packageId;
  final String packageValue;
  final String packageName;
  final String packageTitle;
  final String packageType;

  BuyMembershipPage({
    Key? key,
    required this.regularPrice,
    required this.offerPrice,
    required this.duration,
    required this.packageId,
    required this.packageValue,
    required this.packageName,
    required this.packageTitle,
    required this.packageType,
  }) : super(key: key);

  List<membershipSubModelItem.Item> tempList = [];
  List<membershipSubModelItem.Item> tempList2 = [];

  DateTime maxDateTime = DateTime(1900, 1, 1);
  DateTime maxDateTime2 = DateTime(1901, 1, 1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembershipSubscriptionBloc(
          RepositoryProvider.of<MembershipSubscriptionRepository>(context))
        ..add(LoadMembershipSubscriptionApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Buy Membership',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<MembershipSubscriptionBloc,
            MembershipSubscriptionState>(
          builder: (context, state) {
            if (state is MembershipSubscriptionLoadedState) {
              for (int i = 0;
                  i < state.membershipSubscriptionModel.items.length;
                  i++) {
                if (TempChildNameHolder.childName ==
                        state.membershipSubscriptionModel.items[i].chaildName &&
                    state.membershipSubscriptionModel.items[i].expireDate !=
                        'N/A') {
                  tempList.add(state.membershipSubscriptionModel.items[i]);
                } else if (state
                        .membershipSubscriptionModel.items[i].expireDate !=
                    'N/A') {
                  tempList2.add(state.membershipSubscriptionModel.items[i]);
                }
              }

              for (int i = 0; i < tempList.length; i++) {
                var expDate =
                    StringToDate.convertStringToDate(tempList[i].expireDate);
                if (expDate.isAfter(maxDateTime)) {
                  maxDateTime = expDate;
                }
              }

              for (int i = 0; i < tempList2.length; i++) {
                var expDate =
                    StringToDate.convertStringToDate(tempList2[i].expireDate);
                if (expDate.isAfter(maxDateTime)) {
                  maxDateTime2 = expDate;
                }
              }

              if (maxDateTime.isAfter(DateTime.now())) {
                //////////// create date ////////////////

                var maxDateTimeObjCreatedDate;

                String dateformat =
                    DateFormat('dd/MM/yyyy').format(maxDateTime);

                for (int i = 0; i < tempList.length; i++) {
                  if (dateformat == tempList[i].expireDate) {
                    maxDateTimeObjCreatedDate = tempList[i].createDate;
                  }
                }

                //////////// create date ////////////////
                return FutureBuilder(
                    future: MembershipRepository.getRenewalMembershipPackages(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        for (int i = 0;
                            i < (snapshot.data as dynamic).items.length;
                            i++) {
                          if (duration ==
                              (snapshot.data as dynamic).items[i].packageTime) {
                            return Column(
                              children: [
                                MembershipCard(
                                  id: (snapshot.data as dynamic).items[i].id,
                                  packageName: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageName,
                                  packageTitle: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageTitle,
                                  discountPrice: (snapshot.data as dynamic)
                                      .items[i]
                                      .packagePrice,
                                  regularPrice: (snapshot.data as dynamic)
                                      .items[i]
                                      .regularPrice,
                                  duration: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageTime,
                                  packageValue: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageValue,
                                  packageDescription: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageDescription,
                                  packageType: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageDescription,
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Selected Child',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                                Text(
                                  TempChildNameHolder.childName.toString(),
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Benefits',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                                const SizedBox(height: 10),
                                (snapshot.data as dynamic)
                                                .items[i]
                                                .regularPrice -
                                            (snapshot.data as dynamic)
                                                .items[i]
                                                .packagePrice ==
                                        0
                                    ? const SizedBox(height: 0)
                                    : Text(
                                        'Save ${(snapshot.data as dynamic).items[i].regularPrice - (snapshot.data as dynamic).items[i].packagePrice}৳',
                                        style: TextStyle(
                                            color: AppColors.textGrey2),
                                      ),
                                Text(
                                  'Pay with bKash or Credit Card',
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                                Text(
                                  'Unlimited Time and Visit for ${(snapshot.data as dynamic).items[i].packageTime} days',
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                                const SizedBox(height: 30),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'membershipInvoicePage',
                                        arguments: MembershipInvoiceArguments(
                                          renewalPackageCreateDate:
                                              maxDateTimeObjCreatedDate,
                                          renewalPackMaxDateTime: maxDateTime,
                                          id: (snapshot.data as dynamic)
                                              .items[i]
                                              .id,
                                          duration: (snapshot.data as dynamic)
                                              .items[i]
                                              .packageTime,
                                          price: (snapshot.data as dynamic)
                                              .items[i]
                                              .packagePrice,
                                          childName: TempChildNameHolder
                                              .childName
                                              .toString(),
                                          packageTitle:
                                              (snapshot.data as dynamic)
                                                  .items[i]
                                                  .packageTitle,
                                          childId: TempChildNameHolder.childId,
                                          packageType:
                                              (snapshot.data as dynamic)
                                                  .items[i]
                                                  .packageType,
                                        ));
                                  },
                                  child: AppButton(
                                      height: 50, width: 250, text: 'Checkout'),
                                ),
                              ],
                            );
                          }
                        }
                      }
                      return Center(
                        child: SpinKitFadingGrid(color: AppColors.primaryColor),
                      );
                    });
              } else if (maxDateTime2.isAfter(DateTime.now())) {
                return FutureBuilder(
                    future: MembershipRepository.getFamilyMembershipPackages(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // return Text(
                        //     (snapshot.data as dynamic).items[0].packageName);
                        for (int i = 0;
                            i < (snapshot.data as dynamic).items.length;
                            i++) {
                          if (duration ==
                              (snapshot.data as dynamic).items[i].packageTime) {
                            return Column(
                              children: [
                                MembershipCard(
                                  id: (snapshot.data as dynamic).items[i].id,
                                  packageName: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageName,
                                  packageTitle: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageTitle,
                                  discountPrice: (snapshot.data as dynamic)
                                      .items[i]
                                      .packagePrice,
                                  regularPrice: (snapshot.data as dynamic)
                                      .items[i]
                                      .regularPrice,
                                  duration: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageTime,
                                  packageValue: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageValue,
                                  packageDescription: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageDescription,
                                  packageType: (snapshot.data as dynamic)
                                      .items[i]
                                      .packageDescription,
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Selected Child',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                                Text(
                                  TempChildNameHolder.childName.toString(),
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Benefits',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                                const SizedBox(height: 10),
                                (snapshot.data as dynamic)
                                                .items[i]
                                                .regularPrice -
                                            (snapshot.data as dynamic)
                                                .items[i]
                                                .packagePrice ==
                                        0
                                    ? const SizedBox(height: 0)
                                    : Text(
                                        'Save ${(snapshot.data as dynamic).items[i].regularPrice - (snapshot.data as dynamic).items[i].packagePrice}৳',
                                        style: TextStyle(
                                            color: AppColors.textGrey2),
                                      ),
                                Text(
                                  'Pay with bKash or Credit Card',
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                                Text(
                                  'Unlimited Time and Visit for ${(snapshot.data as dynamic).items[i].packageTime} days',
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                                const SizedBox(height: 30),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'membershipInvoicePage',
                                        arguments: MembershipInvoiceArguments(
                                          renewalPackageCreateDate: null,
                                          renewalPackMaxDateTime: null,
                                          id: (snapshot.data as dynamic)
                                              .items[i]
                                              .id,
                                          duration: (snapshot.data as dynamic)
                                              .items[i]
                                              .packageTime,
                                          price: (snapshot.data as dynamic)
                                              .items[i]
                                              .packagePrice,
                                          childName: TempChildNameHolder
                                              .childName
                                              .toString(),
                                          packageTitle:
                                              (snapshot.data as dynamic)
                                                  .items[i]
                                                  .packageTitle,
                                          childId: TempChildNameHolder.childId,
                                          packageType:
                                              (snapshot.data as dynamic)
                                                  .items[i]
                                                  .packageType,
                                        ));
                                  },
                                  child: AppButton(
                                      height: 50, width: 250, text: 'Checkout'),
                                ),
                              ],
                            );
                          }
                        }
                      }
                      return Center(
                        child: SpinKitFadingGrid(color: AppColors.primaryColor),
                      );
                    });
              }
              return FutureBuilder(
                  future: MembershipRepository.getNormalMembershipPackages(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // return Text(
                      //     (snapshot.data as dynamic).items[0].packageName);
                      for (int i = 0;
                          i < (snapshot.data as dynamic).items.length;
                          i++) {
                        if (duration ==
                            (snapshot.data as dynamic).items[i].packageTime) {
                          return Column(
                            children: [
                              MembershipCard(
                                id: (snapshot.data as dynamic).items[i].id,
                                packageName: (snapshot.data as dynamic)
                                    .items[i]
                                    .packageName,
                                packageTitle: (snapshot.data as dynamic)
                                    .items[i]
                                    .packageTitle,
                                discountPrice: (snapshot.data as dynamic)
                                    .items[i]
                                    .packagePrice,
                                regularPrice: (snapshot.data as dynamic)
                                    .items[i]
                                    .regularPrice,
                                duration: (snapshot.data as dynamic)
                                    .items[i]
                                    .packageTime,
                                packageValue: (snapshot.data as dynamic)
                                    .items[i]
                                    .packageValue,
                                packageDescription: (snapshot.data as dynamic)
                                    .items[i]
                                    .packageDescription,
                                packageType: (snapshot.data as dynamic)
                                    .items[i]
                                    .packageDescription,
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Selected Child',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                              Text(
                                TempChildNameHolder.childName.toString(),
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Benefits',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                              const SizedBox(height: 10),
                              (snapshot.data as dynamic).items[i].regularPrice -
                                          (snapshot.data as dynamic)
                                              .items[i]
                                              .packagePrice ==
                                      0
                                  ? const SizedBox(height: 0)
                                  : Text(
                                      'Save ${(snapshot.data as dynamic).items[i].regularPrice - (snapshot.data as dynamic).items[i].packagePrice}৳',
                                      style:
                                          TextStyle(color: AppColors.textGrey2),
                                    ),
                              Text(
                                'Pay with bKash or Credit Card',
                                style: TextStyle(color: AppColors.textGrey2),
                              ),
                              Text(
                                'Unlimited Time and Visit for ${(snapshot.data as dynamic).items[i].packageTime} days',
                                style: TextStyle(color: AppColors.textGrey2),
                              ),
                              const SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'membershipInvoicePage',
                                      arguments: MembershipInvoiceArguments(
                                        renewalPackageCreateDate: null,
                                        renewalPackMaxDateTime: null,
                                        id: (snapshot.data as dynamic)
                                            .items[i]
                                            .id,
                                        duration: (snapshot.data as dynamic)
                                            .items[i]
                                            .packageTime,
                                        price: (snapshot.data as dynamic)
                                            .items[i]
                                            .packagePrice,
                                        childName: TempChildNameHolder.childName
                                            .toString(),
                                        packageTitle: (snapshot.data as dynamic)
                                            .items[i]
                                            .packageTitle,
                                        childId: TempChildNameHolder.childId,
                                        packageType: (snapshot.data as dynamic)
                                            .items[i]
                                            .packageType,
                                      ));
                                },
                                child: AppButton(
                                    height: 50, width: 250, text: 'Checkout'),
                              ),
                            ],
                          );
                        }
                      }
                    }
                    return Center(
                      child: SpinKitFadingGrid(color: AppColors.primaryColor),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
