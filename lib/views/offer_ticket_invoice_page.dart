import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/bloc/ticket_items/ticket_items_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/add_a_ticket_prompt_button.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_details_card.dart';
import 'package:flutter_babuland_app/data/model/offer_item_model.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/payment_repository.dart';
import 'package:flutter_babuland_app/data/repository/ssl_commerz_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

class OfferTicketInvoicePage extends StatelessWidget {
  static List<Item> offerItemList = [];
  late int customerId;
  late String customerPhoneNumber;
  final int comboPk;
  final int comboItemId;
  final int comboItemMrp;
  final String comboTitle;
  final double grandTotal;
  final double discountAmount;
  final String comboExpireDate;
  final String offerStartDate;
  OfferTicketInvoicePage(
      {Key? key,
      required this.comboPk,
      required this.comboItemMrp,
      required this.comboTitle,
      required this.grandTotal,
      required this.discountAmount,
      required this.comboExpireDate,
      required this.offerStartDate,
      required this.comboItemId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(LoadCustomerApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            comboTitle,
            style: TextStyle(color: AppColors.primaryColor),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                offerItemList.clear();
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          iconTheme: IconThemeData(color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 35),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  color: const Color(0xffEBECF0),
                  child: Center(
                      child: TicketDetailsCard(
                    discount: discountAmount,
                    grandTotal: grandTotal,
                    comboPk: comboPk,
                  )),
                ),
                const SizedBox(height: 25),
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            '** For Child Entry, a child must be below 122 centimeters or 4 feet in height **',
                            style: TextStyle(
                                color: AppColors.primaryRed, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '** The offer will only be available for the month of purchase (the month on which the offer was purchased) **',
                          style: TextStyle(
                              color: AppColors.primaryRed, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '** This offer is only available through Babuland App **',
                          style: TextStyle(
                              color: AppColors.textGrey2, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '** The offer items cannot be availed seperately **',
                          style: TextStyle(
                              color: AppColors.textGrey2, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '** It is mandatory for both all guardians and children to wear socks inside the premesis. Kindly bring your own, fresh pair of fresh socks or you can purchase them from outlets **',
                          style: TextStyle(
                              color: AppColors.textGrey2, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 25),
                        BlocBuilder<CustomerBloc, CustomerState>(
                          builder: (context, state) {
                            if (state is CustomerLoadedState) {
                              customerPhoneNumber =
                                  state.customerModel.items[0].mobileNumber;
                              customerId = state.customerModel.items[0].id;
                              return Center(
                                child: InkWell(
                                  onTap: () async {
                                    var trxId = getRandomString(7);
                                    await sslCommerzCall(
                                      trxId: Platform.isAndroid
                                          ? 'AO$customerId$trxId'
                                          : 'IO$customerId$trxId',
                                      customerId: customerId,
                                      customerName: '',
                                      customerMobile: customerPhoneNumber,
                                      customerAddress: '',
                                      customerEmail: '',
                                      price: grandTotal,
                                    ).then((value) {
                                      Navigator.pushNamed(
                                          context, 'loadingPage');
                                      Future.delayed(Duration(seconds: 5), () {
                                        Navigator.pushNamed(context, '/');
                                        Navigator.pushNamed(
                                            context, 'ticketsPage');
                                      });
                                    }).then((value) {
                                      Future.delayed(Duration(seconds: 5), () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Text(
                                            'Offer Purchase Sucessful',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                          backgroundColor:
                                              AppColors.primaryGreen,
                                        ));
                                      });
                                    });
                                    // print(trxId);
                                    // for (int i = 0; i < offerItemList.length; i++) {
                                    //   print(offerItemList[i].qty);
                                    //   print(offerItemList[i].productName);
                                    // }
                                  },
                                  child: AppButton(
                                      height: 50,
                                      width: 275,
                                      text:
                                          ' Pay ${grandTotal.toStringAsFixed(0)}৳'),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sslCommerzCall(
      {required String trxId,
      required int customerId,
      required String? customerName,
      required String customerMobile,
      required String? customerAddress,
      required String? customerEmail,
      required double price}) async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            currency: SSLCurrencyType.BDT,
            product_category: "PAID TICKETS",
            sdkType: SSLCSdkType.LIVE,
            store_id: dotenv.env['SSL_STORE_ID']!,
            store_passwd: dotenv.env['SSL_STORE_PASS']!,
            // sdkType: SSLCSdkType.TESTBOX,
            // store_id: 'babul62dd01a4bc6b9',
            // store_passwd: 'babul62dd01a4bc6b9@ssl',
            total_amount: price,
            tran_id: trxId));

    sslcommerz.addCustomerInfoInitializer(
        customerInfoInitializer: SSLCCustomerInfoInitializer(
            customerName: customerName ?? '',
            customerEmail: customerEmail ?? '',
            customerAddress1: customerAddress ?? '',
            customerCity: '',
            customerState: '',
            customerPostCode: '',
            customerCountry: '',
            customerPhone: customerMobile));

    var result = await sslcommerz.payNow();

    if (result is PlatformException ||
        result.status!.toLowerCase() == "failed") {
      throw Exception(
          //   'SSLCommerzError Code:${result.code} Message: ${result.message} ');
          'SSLCommerz Error OFFER TICKET INVOICE PAGE');
    } else {
      SSLCTransactionInfoModel model = result;

      late int lId;

      // var transactionResponse =
      //     await SSLCommerzRepository.validateTransaction(model.valId!);

      Future.delayed(const Duration(seconds: 4), () async {
        // if (transactionResponse.status.toLowerCase() == 'validated') {
        if (model.status == "VALID") {
          await TicketOrderRepository.postTicketOrder(
                  //await added
                  vat: comboItemMrp * 0.075,
                  subtotal:
                      comboItemMrp - discountAmount - (comboItemMrp * 0.075),
                  netAmount: comboItemMrp - discountAmount,
                  discountAmount: discountAmount,
                  discountPct: 0,
                  coupon: '',
                  discountCoupon: '',
                  customerId: customerId,
                  mobileNumber: customerPhoneNumber,
                  trxId: model.tranId!,
                  unixTimeStamp: comboExpireDate,
                  startDate: offerStartDate,
                  grandTotal: comboItemMrp)
              .then((response) async {
            var responseData = jsonDecode(response.body);

            if (responseData['status'] == 200) {
              lId = responseData['l_order_id'];
              await PaymentRepository.postPaymentColection(
                      // await added
                      lORderId: responseData['l_order_id'],
                      amount: grandTotal)
                  .then((response) async {
                var responseData = jsonDecode(response.body);

                if (responseData['status'] == 200) {
                  // TicketItemRepository.postTicketItems(
                  //     discount: discountAmount,
                  //     itemId: comboItemId,
                  //     itemPrice: comboItemMrp,
                  //     qty: 1,
                  //     lOrderid: lId);

                  TicketItemRepository.postTicketItems(
                          discount: discountAmount,
                          itemId: comboItemId,
                          itemPrice:
                              (comboItemMrp.toInt() - discountAmount.toInt()),
                          qty: 1,
                          lOrderid: lId)
                      .then((value) async {
                    for (int i = 0; i < offerItemList.length; i++) {
                      TicketItemRepository.postTicketItems(
                              discount: 0,
                              itemId: offerItemList.elementAt(i).itemId,
                              itemPrice: offerItemList.elementAt(i).mrp,
                              qty: offerItemList.elementAt(i).qty,
                              lOrderid: lId)
                          .then((value) => offerItemList.clear());
                    }
                  });
                } else {
                  throw Exception(
                      'TICKET ORDER POST ERROR CODE:${responseData['status']}');
                }
              });
            }
          });
        } else {
          throw Exception('Offer Ticket Validation Error');
        }
        // } else {
        //   print(transactionResponse);
        //   throw Exception('Offer Ticket Validation Error');
        // }
      });
    }
  }

  String getRandomString(int length) {
    const characters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random random = Random();
    String randomString = String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    return randomString;
  }
}
