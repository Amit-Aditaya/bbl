import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/offer/offer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/offer_card.dart';
import 'package:flutter_babuland_app/data/repository/offer_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/offer_ticket_invoice_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_version/new_version.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void basicStatusCheck(NewVersion newVersion) {
      newVersion.showAlertIfNecessary(context: context);
    }

    void checkVersion() async {
      final newVersion = NewVersion();
      var versionInfo = await newVersion.getVersionStatus();
      // print(versionInfo?.storeVersion);
      // print(versionInfo?.localVersion);

      if (versionInfo?.localVersion != versionInfo?.storeVersion ||
          versionInfo!.canUpdate) {
        basicStatusCheck(newVersion);
      }
    }

    checkVersion();
    return BlocProvider(
      create: (context) =>
          OfferBloc(RepositoryProvider.of<OfferRepository>(context))
            ..add(LoadOfferApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Offers',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<OfferBloc, OfferState>(
          builder: (context, state) {
            if (state is OfferLoadedState) {
              return Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: ListView.builder(
                    itemCount: state.offerModel.items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(
                            state.offerModel.items[index].imgUrl,
                          );
                          Navigator.pushNamed(context, 'offerTicketInvoicePage',
                              arguments: OfferTicketInvoicePage(
                                  offerStartDate: state
                                      .offerModel.items[index].validityStart,
                                  comboExpireDate: state
                                      .offerModel.items[index].validityEndUnix,
                                  comboItemMrp:
                                      state.offerModel.items[index].mrp,
                                  comboItemId:
                                      state.offerModel.items[index].itemId,
                                  discountAmount:
                                      state.offerModel.items[index].discount,
                                  comboPk: state.offerModel.items[index].pk,
                                  grandTotal: state
                                          .offerModel.items[index].mrp -
                                      state.offerModel.items[index].discount,
                                  comboTitle: state
                                      .offerModel.items[index].productName));
                        },
                        child: OfferCard(
                          pk: state.offerModel.items[index].pk,
                          comboTitle: state.offerModel.items[index].productName,
                          comboMrp: state.offerModel.items[index].mrp,
                          mrpExcludingVat:
                              state.offerModel.items[index].mrpExcludingVat,
                          costPrice: state.offerModel.items[index].costPrice,
                          vatAmount: state.offerModel.items[index].vatAmount,
                          vatPercentage:
                              state.offerModel.items[index].vatAmount,
                          discount: state.offerModel.items[index].discount,
                          imageUrl: state.offerModel.items[index].imgUrl,
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: SpinKitFadingGrid(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
    // return Scaffold(
    //   appBar: CustomAppBar(
    //     backgroundColor: Colors.white,
    //     title: 'Offers',
    //   ),
    //   backgroundColor: Colors.white,
    //   body: Center(
    //       child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Icon(
    //         Icons.build_circle,
    //         color: AppColors.primaryRed,
    //         size: 50,
    //       ),
    //       Text(
    //         'Maintenance Ongoing',
    //         style: TextStyle(color: AppColors.primaryRed, fontSize: 20),
    //       ),
    //       Text(
    //         'Offers temporarily unavailable on iOS',
    //         style: TextStyle(color: AppColors.textGrey2, fontSize: 16),
    //       ),
    //     ],
    //   )),
    // );
  }
}
