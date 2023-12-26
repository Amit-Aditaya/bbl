import 'dart:io';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_model.dart';
import 'package:http/http.dart';

class TicketOrderRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<TicketOrderModel> getTicketOrder() async {
    final response = await get(
      Uri.parse('${AppLink.apiLink}babuland/v2/ticket_order'),
      headers: {'MOBILE_NUMBER': currentUser.phoneNumber!.substring(3)},
    );
    if (response.statusCode == 200) {
      final ticketOrderList = ticketOrderModelFromJson(response.body);
      return ticketOrderList;
    } else {
      throw Exception('TICKET ORDER REPOSITORY ERROR');
    }
  }

  static Future postTicketOrder(
      {required int customerId,
      required String coupon,
      required String discountCoupon,
      required String mobileNumber,
      required String trxId,
      required int discountPct,
      required double discountAmount,
      required double netAmount,
      required double vat,
      required double subtotal,
      required String? unixTimeStamp,
      required String? startDate,
      required int grandTotal}) async {
    final response = await post(
        Uri.parse('${AppLink.apiLink}babuland/v2/ticket_order'),
        headers: {
          'BUNIT_FK': Platform.isAndroid ? '6' : '7',
          'COUPON_CODE': coupon,
          'CUSTOMER_ID_FK': customerId.toString(),
          'DISCOUNT_ABLE': grandTotal.toString(),
          'DISCOUNT_AMOUNT': discountAmount.toString(),
          'DISCOUNT_COUPON': discountCoupon,
          'DISCOUNT_PCT': discountPct.toString(),
          'MOBILE_NUMBER': mobileNumber,
          'NET_AMT': netAmount.toString(),
          'PAYMENT_TYPE': '9',
          'RECEIVED_AMOUNT': netAmount.toString(),
          'RETURN_AMOUNT': '0',
          'SELL_PERSON': Platform.isAndroid ? 'Android' : 'IOS',
          'SL_TYPE': 'APP',
          'SUB_TOTAL': subtotal.toString(),
          'TOTAL': grandTotal.toString(), // mrp
          'TRN_ID': trxId,
          'UNIXTIMESTAMP': unixTimeStamp ?? 'null',
          'VAT': vat.toString(),
          'VATABLE_AMT': grandTotal.toString(),
          'START_DATE': startDate ?? 'null',
        });

    // print(customerId);
    // print(couponName);
    // print(mobileNumber);
    // print(trxId);
    // print(discountPct);
    // print(discountAmount);
    // print(netAmount);
    // print(vat);
    // print(subtotal);
    // print(unixTimeStamp);
    // print(startDate);

    return response;
  }
}
