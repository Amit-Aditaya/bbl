import 'package:flutter_babuland_app/data/model/party_booking_history_model.dart';
import 'package:http/http.dart';

class PartyBookingRepository {
  Future getPartyBookingHistory({required int customerId}) async {
    final response = await get(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv4/pb_information'),
        headers: {'CUSTOMER_ID': customerId.toString()});

    if (response.statusCode == 200) {
      final partyBookingHistoryList =
          partyBookingHistoryModelFromJson(response.body);
      return partyBookingHistoryList;
    } else {
      throw Exception('PARTY BOOKING HISTORY REPO ERROR');
    }
  }

  static Future postPartyBooking(
      {required String partyType,
      required String branch,
      required String decoration,
      required String pbStatus,
      required String customerId,
      required String partyDateTime,
      required String status}) async {
    final response = await post(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv4/pb_information'),
        headers: {
          'PARTY_TYPE': partyType,
          'BRANCH': branch,
          'DECORATION': decoration,
          'PB_STATUS': pbStatus,
          'CUSTOMER_ID': customerId,
          'PARTY_DATE_TIME': partyDateTime,
          'STATUS': status,
        });
  }
}
