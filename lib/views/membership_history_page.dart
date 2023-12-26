import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/membership_subscription/membership_subscription_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/active_membership_card.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/membership_subscription_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MemberhsipHistoryPage extends StatelessWidget {
  const MemberhsipHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembershipSubscriptionBloc(
          RepositoryProvider.of<MembershipSubscriptionRepository>(context))
        ..add(LoadMembershipSubscriptionApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Memberhsip History',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<MembershipSubscriptionBloc,
            MembershipSubscriptionState>(
          builder: (context, state) {
            if (state is MembershipSubscriptionLoadedState) {
              if (state.membershipSubscriptionModel.items.isEmpty) {
                return Center(
                    child: Text(
                  'No Membership History',
                  style: TextStyle(color: AppColors.textGrey2),
                ));
              }
              return ListView.builder(
                  itemCount: state.membershipSubscriptionModel.items.length,
                  itemBuilder: (context, index) {
                    var expDate = state
                        .membershipSubscriptionModel.items[index].expireDate;
                    var randomDateTime;
                    var expDateDateTime;

                    if (state.membershipSubscriptionModel.items[index]
                            .expireDate ==
                        'N/A') {
                      randomDateTime = DateTime(1900, 12, 12);
                    } else {
                      String eDate = expDate.substring(0, 2);
                      int ed = int.parse(eDate);
                      String eMonth = expDate.substring(3, 5);
                      int em = int.parse(eMonth);
                      String eYear = expDate.substring(6, 10);
                      int ey = int.parse(eYear);
                      expDateDateTime = DateTime(ey, em, ed);
                    }

                    if (state.membershipSubscriptionModel.items[index]
                                .expireDate !=
                            'N/A' &&
                        !DateTime.now().isBefore(expDateDateTime)) {
                      return ActiveMembershipCard(
                        color: Colors.grey.withOpacity(.5),
                        expireDate: state.membershipSubscriptionModel
                            .items[index].expireDate,
                        purchaseDate: state.membershipSubscriptionModel
                            .items[index].createDate,
                        childName: state.membershipSubscriptionModel
                            .items[index].chaildName,
                        packageName: state
                            .membershipSubscriptionModel.items[index].pkgName,
                        packagePrice: state.membershipSubscriptionModel
                            .items[index].packagePrice,
                      );
                    } else {
                      return const SizedBox(height: 1);
                    }
                  });
            } else {
              return Center(
                child: SpinKitFadingGrid(color: AppColors.textGrey2),
              );
            }
          },
        ),
      ),
    );
  }
}
