import 'dart:convert';
import 'dart:math';

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/data/repository/coupon/my_coupon_repository.dart';
import 'package:flutter_babuland_app/data/repository/coupon/scanned_coupon_repository.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/payment_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/tickets_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyCoupon extends StatelessWidget {
  //const ScannedCoupon({Key? key}) : super(key: key);
  final int pk;
  final String couponCode;
  final String ticketType;
  final int qty;
  final String? startDate;
  final String? expireDate;
  final int couponItemId;

  const MyCoupon(
      {Key? key,
      required this.couponCode,
      required this.ticketType,
      required this.qty,
      required this.startDate,
      required this.expireDate,
      required this.couponItemId,
      required this.pk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //expire date to timestamp

    if (expireDate != null) {
      String expDate = expireDate!;
      DateTime expireDateTime = DateFormat('dd-MMM-yyyy')
          .parse(expDate)
          .add(const Duration(hours: 22));

      var expDateTimeStamp = expireDateTime.millisecondsSinceEpoch;
    }

    ////////////////////////

    //start date format change

    if (startDate != null) {
      String couponStarDate = startDate!;
      DateTime couponStarDateTime =
          DateFormat('dd-MMM-yyyy').parse(couponStarDate);

      List<String> list = [];

      var a = couponStarDateTime.toString();
      var b = a.split(' ');
      var c = b.first;

      var d = c.split('-');

      list.add(d.last);
      list.add(d[1]);
      list.add(d.first);

      String str = '${list[1]}/${list[0]}/${list.last}';
    }

    ////////////////////////

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: CouponCard(
              height: 165,
              backgroundColor: Colors.red,
              firstChild: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color(0xff6190E8),
                      // Color(0xff6190E8),

                      Color(0xffffb347),
                      Color(0xffffb347),
                    ],
                  ),
                ),
                child: Transform.rotate(
                    angle: -3.142 / 2,
                    child: Center(
                      child: Text(
                        couponCode,
                        softWrap: false,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              secondChild: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    //   stops: [0.01, 0.5],
                    colors: [
                      Color(0xffffb347),
                      Color(0xffffcc33),
                    ],
                  ),
                ),
                child: Center(
                    child: Column(
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      'Free Coupon',
                      style: TextStyle(
                        color: Color(0xff834333),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      ticketType.toLowerCase().contains('massage') ||
                              ticketType.toLowerCase().contains('movie')
                          ? ticketType
                          : '$ticketType Entry',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                        color: Color(0xff834333),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // var trxId = getRandomString(7);
                        // showDialog(
                        //     context: context,
                        //     builder: (context) => RepositoryProvider(
                        //           create: (context) => CustomerRepository(),
                        //           child: AlertDialog(
                        //             title: const Text(
                        //               'Do you want to use this coupon ?',
                        //               style: TextStyle(fontSize: 14),
                        //             ),
                        //             content: BlocProvider(
                        //               create: (context) => CustomerBloc(
                        //                   RepositoryProvider.of<
                        //                       CustomerRepository>(context))
                        //                 ..add(LoadCustomerApiEvent()),
                        //               child: Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     ElevatedButton(
                        //                       onPressed: () {
                        //                         Navigator.pop(context);
                        //                       },
                        //                       style: ButtonStyle(
                        //                           backgroundColor:
                        //                               MaterialStateProperty
                        //                                   .all<Color>(AppColors
                        //                                       .primaryColor)),
                        //                       child: const Text('No'),
                        //                     ),
                        //                     BlocBuilder<CustomerBloc,
                        //                         CustomerState>(
                        //                       builder: (context, state) {
                        //                         if (state
                        //                             is CustomerLoadedState) {
                        //                           return ElevatedButton(
                        //                             onPressed: () async {
                        //                               late int lId;
                        //                               var trxId =
                        //                                   getRandomString(7);

                        //                               await MyCouponRepository
                        //                                       .updateCouponConsume(
                        //                                           pk.toString())
                        //                                   .then((value) async {
                        //                                 await TicketOrderRepository
                        //                                         .postTicketOrder(
                        //                                             // await added
                        //                                             vat: 0,
                        //                                             netAmount:
                        //                                                 0,
                        //                                             subtotal: 0,
                        //                                             customerId: state
                        //                                                 .customerModel
                        //                                                 .items[
                        //                                                     0]
                        //                                                 .id,
                        //                                             coupon:
                        //                                                 couponCode,
                        //                                             discountCoupon:
                        //                                                 '',
                        //                                             mobileNumber: state
                        //                                                 .customerModel
                        //                                                 .items[
                        //                                                     0]
                        //                                                 .mobileNumber,
                        //                                             trxId:
                        //                                                 'IC$trxId',
                        //                                             unixTimeStamp:
                        //                                                 expDateTimeStamp
                        //                                                     .toString(),
                        //                                             startDate:
                        //                                                 str,
                        //                                             discountPct:
                        //                                                 0,
                        //                                             discountAmount:
                        //                                                 0,
                        //                                             grandTotal:
                        //                                                 0)
                        //                                     .then(
                        //                                         (response) async {
                        //                                   var responseData =
                        //                                       jsonDecode(
                        //                                           response
                        //                                               .body);
                        //                                   if (responseData[
                        //                                           'status'] ==
                        //                                       200) {
                        //                                     lId = responseData[
                        //                                         'l_order_id'];
                        //                                     await PaymentRepository
                        //                                             .postPaymentColection(
                        //                                                 // await added
                        //                                                 lORderId:
                        //                                                     responseData[
                        //                                                         'l_order_id'],
                        //                                                 amount:
                        //                                                     0)
                        //                                         .then(
                        //                                             (response) async {
                        //                                       var responseData =
                        //                                           jsonDecode(
                        //                                               response
                        //                                                   .body);

                        //                                       if (responseData[
                        //                                               'status'] ==
                        //                                           200) {
                        //                                         TicketItemRepository.postTicketItems(
                        //                                                 // await added
                        //                                                 discount: 0,
                        //                                                 itemId: couponItemId,
                        //                                                 itemPrice: 0,
                        //                                                 qty: qty,
                        //                                                 lOrderid: lId)
                        //                                             .then((value) {
                        //                                           Navigator
                        //                                               .pushNamed(
                        //                                                   context,
                        //                                                   '/');

                        //                                           Navigator.pushNamed(
                        //                                               context,
                        //                                               'ticketsPage');

                        //                                           Navigator.pushNamed(
                        //                                               context,
                        //                                               'myTicketsPage');

                        //                                           Navigator.pushNamed(
                        //                                               context,
                        //                                               'validTicketsPage');
                        //                                         }).then((value) {
                        //                                           ScaffoldMessenger.of(
                        //                                                   context)
                        //                                               .showSnackBar(
                        //                                                   SnackBar(
                        //                                             content:
                        //                                                 const Text(
                        //                                               'Coupon Activation Success',
                        //                                               textAlign:
                        //                                                   TextAlign
                        //                                                       .center,
                        //                                               style: TextStyle(
                        //                                                   fontWeight:
                        //                                                       FontWeight.w600),
                        //                                             ),
                        //                                             backgroundColor:
                        //                                                 AppColors
                        //                                                     .primaryGreen,
                        //                                           ));
                        //                                         });
                        //                                       }
                        //                                     });
                        //                                   } else {
                        //                                     throw Exception(
                        //                                         'TICKET ORDER POST ERROR CODE:${responseData['status']}');
                        //                                   }
                        //                                 });
                        //                               });
                        //                             },
                        //                             style: ButtonStyle(
                        //                                 backgroundColor:
                        //                                     MaterialStateProperty
                        //                                         .all<Color>(
                        //                                             AppColors
                        //                                                 .primaryColor)),
                        //                             child: const Text('Yes'),
                        //                           );
                        //                         } else {
                        //                           return CircularProgressIndicator(
                        //                             color:
                        //                                 AppColors.primaryColor,
                        //                           );
                        //                         }
                        //                       },
                        //                     ),
                        //                   ]),
                        //             ),
                        //           ),
                        //         ));

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                    child: Text(
                                  'To use this free coupon, please visit one of our branches and show the coupon at the counter',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 18),
                                )),
                              );
                            });
                      },
                      child: Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                        ),
                        child: const Center(
                            child: Text(
                          'USE COUPON',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Start Date: ${startDate == null ? 'N/A' : startDate}',
                      style: const TextStyle(
                          color: Color(0xff834333),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Expire Date: ${expireDate == null ? 'N/A' : expireDate}',
                      style: const TextStyle(
                          color: Color(0xff834333),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
              ),
              curveRadius: 35,
              curvePosition: 60,
              curveAxis: Axis.vertical,
            ),
          ),
          Positioned(
            top: -15,
            right: 15,
            child: Container(
              clipBehavior: Clip.none,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.redAccent,
              ),
              child: Center(
                  child: Text(
                '$qty',
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
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
