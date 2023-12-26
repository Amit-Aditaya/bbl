import 'package:flutter_babuland_app/data/model/slot_booking/slot_booking_time_model.dart';
import 'package:http/http.dart';

class SlotBookingTimeRepository {
  Future getSlotBookingPage(
      {required String branch,
      required String date,
      required int sbeId}) async {
    final response = await get(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv3/time_slot2'),
        headers: {
          'BRANCH': branch,
          'BOOKING_DATE': date,
          'SBE_ID': sbeId.toString(),
        });

    if (response.statusCode == 200) {
      final slots = slotBookingTimeModelFromJson(response.body);
      return slots;
    } else {
      throw Exception('SLOT BOOKING TIME REPO ERROR');
    }
  }
}
