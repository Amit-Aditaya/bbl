import 'package:flutter_babuland_app/data/model/offer_model.dart';
import 'package:http/http.dart';

class OfferRepository {
  Future<OfferModel> getOffers() async {
    final response = await get(
      Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/combo_ms'),
      headers: {
        'BUNIT': '6',
      },
    );
    if (response.statusCode == 200) {
      final offers = offerModelFromJson(response.body);
      return offers;
    } else {
      throw Exception('OFFER REPOSITORY ERROR');
    }
  }
}
