import 'package:flutter_babuland_app/data/model/coupon_item_model.dart';
import 'package:http/http.dart';

class CouponItemRepository {
  Future getCouponItems() async {
    final response = await get(
        Uri.parse(
            'http://apps.babuland.org/bblapi/babuland/v1/discount_offers'),
        headers: {'BUNIT': '6'});

    if (response.statusCode == 200) {
      final couponItem = couponItemModelFromJson(response.body);
      return couponItem;
    } else {
      throw Exception('COUPON ITEM REPO ERROR');
    }
  }
}
