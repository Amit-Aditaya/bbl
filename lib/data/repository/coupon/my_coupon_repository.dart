import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/coupon/my_coupon_model.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:http/http.dart';

class MyCouponRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future getMyCoupons() async {
    final respoonse = await get(
      Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/offer_coupon'),
      headers: {
        'MOBILE': currentUser.phoneNumber!.substring(3),
      },
    );
    if (respoonse.statusCode == 200) {
      final myCoupons = myCouponModelFromJson(respoonse.body);
      return myCoupons;
    } else {
      throw Exception('MY COUPON REPOSITORY ERROR');
    }
  }

  static Future updateCouponConsume(String pk) async {
    return await put(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/offer_coupon'),
        headers: {
          'PK': pk,
        }).then((response) {
      if (response.statusCode == 200) {
      } else {
        throw Exception('Coupon REPO ERROR (Update)');
      }
    });
  }
}
