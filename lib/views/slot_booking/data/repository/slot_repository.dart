import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/slot_booking/booked_slots_model.dart';
import 'package:http/http.dart';

class SlotRepository {
  static Future postSlotBooking(
      {required int slotBookingId,
      required int customerId,
      required String branch,
      required String bookingDate,
      required int sbeId,
      required String? coupon}) async {
    final response = await post(
        Uri.parse(
            'http://apps.babuland.org/bblapi/apiv2/apiv3/slot_information'),
        headers: {
          'BOOKING_SLOT_ID': slotBookingId.toString(),
          'COUSTOMER_ID': customerId.toString(),
          'BOOKING_BRUNCH': branch,
          'BOOKING_DATE': bookingDate,
          'SBE_ID': sbeId.toString(),
          'COUPON': coupon ?? '',
        });

    return response;
  }

  Future getBookedSlots() async {
    CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
    final response = await get(
        Uri.parse(
            'http://apps.babuland.org/bblapi/apiv2/apiv3/slot_information'),
        headers: {'PHONE_NUMBER': currentUser.phoneNumber!.substring(3)});

    if (response.statusCode == 200) {
      final slots = bookedSlotsModelFromJson(response.body);
      return slots;
    } else {
      throw Exception('SLOT REPOSITORY ERROR GET');
    }
  }
}
