import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/memberhsip_repository.dart';
import 'package:flutter_babuland_app/data/repository/ssl_commerz_repository.dart';
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
import 'package:intl/intl.dart';

class MemberhsipInvoicePage extends StatelessWidget {
  //const MemberhsipInvoicePage({Key? key}) : super(key: key);

  late int customerId;
  String? customerName;
  late String customerMobile;
  String? customerEmail;
  String? customerAddress;
  DateTime? renwalPackMaxDateTime;
  String? renewalPackCreateDate;

  int id;
  int duration;
  int price;
  String childName;
  int childId;
  String packageTitle;
  String packageType;

  MemberhsipInvoicePage(
      {Key? key,
      required this.id,
      required this.duration,
      required this.price,
      required this.childName,
      required this.childId,
      required this.packageTitle,
      required this.packageType,
      required this.renwalPackMaxDateTime,
      required this.renewalPackCreateDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (renewalPackCreateDate != null) {}
    return BlocProvider(
      create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(LoadCustomerApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Invoice',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoadedState) {
              customerId = state.customerModel.items[0].id;
              customerName = state.customerModel.items[0].fullname;
              customerMobile = state.customerModel.items[0].mobileNumber;
              customerEmail = state.customerModel.items[0].emailAddress;
              return Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          const Text(
                            'Package Name',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            packageTitle,
                            style: TextStyle(
                                color: AppColors.textGrey2, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.5),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          const Text(
                            'Duration',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            '${(duration / 30).toStringAsFixed(0)} Months',
                            style: TextStyle(
                                color: AppColors.textGrey2, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.5),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          const Text(
                            'Child Name',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            childName,
                            style: TextStyle(
                                color: AppColors.textGrey2, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.5),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            '$price৳',
                            style: TextStyle(
                                color: AppColors.textGrey2, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () async {
                        String trxId = getRandomString(7);
                        await sslCommerzCall(
                                customerAddress: customerAddress,
                                customerEmail: customerEmail,
                                trxId: Platform.isAndroid
                                    ? 'AM$customerId$trxId'
                                    : 'IM$customerId$trxId',
                                customerId: customerId,
                                customerName: customerName,
                                customerMobile: customerMobile,
                                price: price.toDouble())
                            .then((value) {
                          Navigator.pushNamed(context, '/');
                          Navigator.pushNamed(context, 'membershipPage');

                          return ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: const Text(
                              'Membership Purchased Successfully',
                              style: TextStyle(fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: AppColors.primaryGreen,
                          ));
                        });
                      },
                      child: AppButton(height: 50, width: 250, text: 'Pay'),
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
            product_category: "MEMBERSHIP",
            sdkType: SSLCSdkType.LIVE,
            store_id: dotenv.env['SSL_STORE_ID']!,
            store_passwd: dotenv.env['SSL_STORE_PASS']!,
            // sdkType: SSLCSdkType.TESTBOX,
            // store_id: 'babul5fad05e519cde',
            // store_passwd: 'babul5fad05e519cde@ssl',
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

    if (result is PlatformException) {
      throw Exception(
          // 'SSLCommerzError Code:${result.code} Message: ${result.message} ');
          'SSLCommerz Error MEMBERSHIP INVOICE PAGE');
    } else {
      SSLCTransactionInfoModel model = result;

      String expireDate;
      if (renwalPackMaxDateTime == null) {
        DateTime dateTime = DateTime.now().add(Duration(days: duration));
        expireDate = DateFormat('MM/dd/yyyy').format(dateTime);
      } else {
        DateTime dateTime =
            renwalPackMaxDateTime!.add(Duration(days: duration));
        expireDate = DateFormat('MM/dd/yyyy').format(dateTime);
      }

      DateTime d = DateTime.now();
      String dformat = DateFormat('MM-dd-yyyy').format(d);
      String createdDate = dformat.replaceAll(('-'), '/');

      var formattedCreatedDate;

      if (renewalPackCreateDate != null) {
        List tempList = renewalPackCreateDate!.split('/');
        List reversedtempList = tempList.reversed.toList();
        formattedCreatedDate =
            '${reversedtempList[1]}/${reversedtempList[2]}/${reversedtempList[0]}';
      }

      // var transactionResponse =
      //     await SSLCommerzRepository.validateTransaction(model.valId!);

      //    if (transactionResponse.status.toLowerCase() == 'validated') {
      await MembershipRepository.postMembershipPurchase(
        // await added
        createdDate:
            renewalPackCreateDate == null ? createdDate : formattedCreatedDate,
        packageType: packageType,
        trxId: model.tranId!,
        mobileNumber: customerMobile,
        expDate: expireDate,
        customerId: customerId.toString(),
        childId: childId.toString(),
        pkgId: id,
      ).then((response) async {
        var responseData = jsonDecode(response.body);

        if (responseData['status'] == 200) {
          await MembershipRepository.postMembershipPayment(
            // await added
            totalAmount: price,
            customerId: customerId,
            childId: childId,
            membershipPackageid: id,
            mId: responseData['m_id'],
            packageId: id,
          );
        } else {
          throw Exception(
              'TICKET ORDER POST ERROR CODE:${responseData['status']}');
        }
      });
      // } else {
      //   print(transactionResponse);
      //   throw Exception('aaaaaaaaaaaa');
      // }
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
