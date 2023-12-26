import 'package:flutter_babuland_app/data/model/slot_booking/slot_booking_event_model.dart';
import 'package:http/http.dart';

class SlotBookingEventRepository {
  Future getSlotBookingEvent() async {
    final response = await get(Uri.parse(
        'http://apps.babuland.org/bblapi/apiv2/apiv3/slotbookin_event'));

    if (response.statusCode == 200) {
      final events = slotBookingEventModelFromJson(response.body);
      return events;
    } else {
      throw Exception('SLOT BOOKING EVENT REPO ERROR');
    }
  }
}
