import 'package:flutter_babuland_app/data/model/offer_item_model.dart';
import 'package:http/http.dart';

class OfferItemRepository {
  Future getOfferItems({required int pk}) async {
    final response = await get(
      Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/combo_dt'),
      headers: {
        'CMBO_PK': pk.toString(),
        'BUNIT': '6',
      },
    );
    if (response.statusCode == 200) {
      final offerItems = offerItemModelFromJson(response.body);
      return offerItems;
    } else {
      throw Exception('OFFER ITEM REPOSITORY ERROR');
    }
  }
}
