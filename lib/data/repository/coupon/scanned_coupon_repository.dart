import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/coupon/scanned_coupon_model.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:http/http.dart';

class ScannedCouponRepository {
  Future getScannedTicket(String qrCodeValue) async {
    final response = await get(
        Uri.parse(
            'http://apps.babuland.org/bblapi/babuland/v1/activate_coupon'),
        headers: {
          'COUPON': qrCodeValue,
        });

    if (response.statusCode == 200) {
      final scannedTicket = scannedCouponModelFromJson(response.body);
      return scannedTicket;
    } else {
      throw Exception(' SCANNED COUPON REPOSITORY ERROR');
    }
  }

  static Future availScannedCoupon(String pk) async {
    CurrentUser currentUser = HiveBoxUtils.box.get('user_current');

    return put(
        Uri.parse(
            'http://apps.babuland.org/bblapi/babuland/v1/activate_coupon'),
        headers: {
          'PK': pk,
          'MOBILE': currentUser.phoneNumber!.substring(3),
        }).then((response) {
      if (response.statusCode == 200) {
      } else {
        throw Exception('SCANNED COUPON REPOSITORY ERROR (Update)');
      }
    });
  }
}
