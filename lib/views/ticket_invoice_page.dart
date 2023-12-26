import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_details_card_2.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/payment_repository.dart';
import 'package:flutter_babuland_app/data/repository/ssl_commerz_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/tickets_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

class TicketInvoicePage extends StatelessWidget {
  final Set<TicketItemContainer> ticketItemList;

  late String name;
  late String phoneNumber;
  late int customerID;

  TicketInvoicePage({
    Key? key,
    required this.ticketItemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(LoadCustomerApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Ticket Invoice',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoadedState) {
              name = state.customerModel.items[0].fullname ?? '';
              phoneNumber = state.customerModel.items[0].mobileNumber;
              customerID = state.customerModel.items[0].id;
              return Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      color: const Color(0xffEBECF0),
                      child: Center(
                          child: TicketDetailsCard2(list: ticketItemList)),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'couponListPage')
                            .then((value) {
                          (context as Element).markNeedsBuild();
                        });
                      },
                      child: Text(
                        '+ Add a coupon or voucher',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        '** For Child Entry, a child must be below 122 centimeters or 4 feet in height **',
                        style: TextStyle(
                            color: AppColors.primaryRed, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        '** It is mandatory for both guardians and children to wear socks inside the premesis. Kindly bring your own, fresh pair of fresh socks or you can purchase them from our outlets **',
                        style:
                            TextStyle(color: AppColors.textGrey2, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () async {
                        var trxId = getRandomString(7);
                        await sslCommerzCall(
                                trxId: Platform.isAndroid
                                    ? 'AT$customerID$trxId'
                                    : 'IT$customerID$trxId',
                                customerId: customerID,
                                customerName: name,
                                customerMobile: phoneNumber,
                                customerAddress: '',
                                customerEmail: '',
                                price: TicketDetailsCard2.discountPct == 0
                                    ? TicketDetailsCard2.grandTotal.toDouble()
                                    : TicketDetailsCard2.grandTotal.toDouble() -
                                        (TicketDetailsCard2.grandTotal *
                                            (TicketDetailsCard2.discountPct /
                                                100)))
                            .then((value) {
                          Navigator.pushNamed(context, '/');
                          Navigator.pushNamed(context, 'ticketsPage');
                        }).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              'Ticket Purchase Successful',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: AppColors.primaryGreen,
                          ));
                        });
                      },
                      child: AppButton(height: 50, width: 275, text: 'Pay'),
                    ),
                  ],
                ),
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
          // 'SSLCommerzError Code:${result.code} Message: ${result.message} ');
          'SSLCommerz Error TICKET INVOICE PAGE');
    } else {
      SSLCTransactionInfoModel model = result;

      late int lId;

      print(model.status);

      // var transactionResponse =
      //     await SSLCommerzRepository.validateTransaction(model.valId!);

      Future.delayed(const Duration(seconds: 3), () async {
        //    if (transactionResponse.status.toLowerCase() == 'validated') {
        if (model.status == "VALID") {
          await TicketOrderRepository.postTicketOrder(
                  // await added
                  vat: TicketDetailsCard2.grandTotal * 0.075,
                  netAmount: TicketDetailsCard2.grandTotal -
                      (TicketDetailsCard2.grandTotal *
                          (TicketDetailsCard2.discountPct / 100)),
                  subtotal: TicketDetailsCard2.grandTotal -
                      (TicketDetailsCard2.grandTotal *
                          (TicketDetailsCard2.discountPct / 100)) -
                      (TicketDetailsCard2.grandTotal * 0.075),
                  customerId: customerID,
                  discountCoupon: TicketDetailsCard2.couponName ?? '',
                  coupon: '',
                  mobileNumber: phoneNumber,
                  trxId: trxId,
                  unixTimeStamp: '',
                  startDate: '',
                  discountPct: TicketDetailsCard2.discountPct,
                  discountAmount: (TicketDetailsCard2.grandTotal *
                      (TicketDetailsCard2.discountPct / 100)),
                  grandTotal: TicketDetailsCard2.grandTotal)
              .then((response) async {
            var responseData = jsonDecode(response.body);
            if (responseData['status'] == 200) {
              lId = responseData['l_order_id'];
              await PaymentRepository.postPaymentColection(
                      // await added
                      lORderId: responseData['l_order_id'],
                      amount: TicketDetailsCard2.grandTotal.toDouble())
                  .then((response) async {
                var responseData = jsonDecode(response.body);

                if (responseData['status'] == 200) {
                  for (int i = 0; i < ticketItemList.length; i++) {
                    TicketItemRepository.postTicketItems(
                        // await added
                        discount: 0,
                        itemId: ticketItemList.elementAt(i).ticketItemId,
                        itemPrice: ticketItemList.elementAt(i).price,
                        qty: ticketItemList.elementAt(i).ticketQty,
                        lOrderid: lId);
                  }
                }
              });
            } else {
              throw Exception(
                  'TICKET ORDER POST ERROR CODE:${responseData['status']}');
            }
          });
        } else {
          // print(transactionResponse);
          throw Exception('Ticekt Invoice Validation Error');
        }
      });

      // Future.delayed(const Duration(milliseconds: 3500), () async {
      //   // print(model.status);
      //   // print(model.tranId);
      //   // print(model.valId);
      //   // print(model.tranDate);

      //   var transactionResponse =
      //       await SSLCommerzRepository.validateTransaction(model.valId!);

      //   // print(transactionResponse.status.toLowerCase());
      //   // print(transactionResponse.tranId);
      //   // print(transactionResponse.valId);
      //   // print(transactionResponse.tranDate);

      //   if (transactionResponse.status.toLowerCase() == 'validated') {
      //     await TicketOrderRepository.postTicketOrder(
      //             // await added
      //             vat: TicketDetailsCard2.grandTotal * 0.075,
      //             netAmount: TicketDetailsCard2.grandTotal -
      //                 (TicketDetailsCard2.grandTotal *
      //                     (TicketDetailsCard2.discountPct / 100)),
      //             subtotal: TicketDetailsCard2.grandTotal -
      //                 (TicketDetailsCard2.grandTotal *
      //                     (TicketDetailsCard2.discountPct / 100)) -
      //                 (TicketDetailsCard2.grandTotal * 0.075),
      //             customerId: customerID,
      //             couponName: TicketDetailsCard2.couponName ?? '',
      //             mobileNumber: phoneNumber,
      //             trxId: trxId,
      //             unixTimeStamp: '',
      //             startDate: '',
      //             discountPct: TicketDetailsCard2.discountPct,
      //             discountAmount: (TicketDetailsCard2.grandTotal *
      //                 (TicketDetailsCard2.discountPct / 100)),
      //             grandTotal: TicketDetailsCard2.grandTotal)
      //         .then((response) async {
      //       var responseData = jsonDecode(response.body);
      //       if (responseData['status'] == 200) {
      //         lId = responseData['l_order_id'];
      //         await PaymentRepository.postPaymentColection(
      //                 // await added
      //                 lORderId: responseData['l_order_id'],
      //                 amount: TicketDetailsCard2.grandTotal.toDouble())
      //             .then((response) async {
      //           var responseData = jsonDecode(response.body);

      //           if (responseData['status'] == 200) {
      //             for (int i = 0; i < ticketItemList.length; i++) {
      //               TicketItemRepository.postTicketItems(
      //                   // await added
      //                   discount: 0,
      //                   itemId: ticketItemList.elementAt(i).ticketItemId,
      //                   itemPrice: ticketItemList.elementAt(i).price,
      //                   qty: ticketItemList.elementAt(i).ticketQty,
      //                   lOrderid: lId);
      //             }
      //           }
      //         });
      //       } else {
      //         throw Exception(
      //             'TICKET ORDER POST ERROR CODE:${responseData['status']}');
      //       }
      //     });
      //   } else {
      //     print(transactionResponse);
      //     throw Exception('Ticekt Invoice Validation Error');
      //   }
      // });
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
