import 'dart:io';

import 'package:http/http.dart';

class PaymentRepository {
  static Future postPaymentColection(
      {required int lORderId, required double amount}) async {
    final response = await post(
        Uri.parse(
            'http://apps.babuland.org/bblapi/babuland/v2/payment_collection'),
        headers: {
          'AMOUNT': amount.toString(),
          'BUNIT_FK': Platform.isAndroid ? '6' : '7',
          'PM_FK': '9',
          'SM_FK': lORderId.toString(),
          'APP_USER': Platform.isAndroid ? 'Android' : 'IOS',
          'INSBY': Platform.isAndroid ? 'Android' : 'IOS',
        });
    return response;
  }
}
