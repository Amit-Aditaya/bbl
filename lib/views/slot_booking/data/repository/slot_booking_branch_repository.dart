import 'package:flutter_babuland_app/data/model/slot_booking/slot_booking_branch_model.dart';
import 'package:http/http.dart';

class SlotBookingBranchRepository {
  Future getSlotBookingBranch(int sbeId) async {
    final response = await get(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv3/slot_brunch'),
        headers: {'SBE_ID': sbeId.toString()});

    if (response.statusCode == 200) {
      final branches = slotBookingBranchModelFromJson(response.body);
      return branches;
    } else {
      throw Exception('SLOT BOOKING BRANCH REPO ERROR');
    }
  }
}
