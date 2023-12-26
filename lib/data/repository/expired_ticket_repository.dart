import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_model.dart';
import 'package:http/http.dart';

class ExpiredTicketRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<TicketOrderModel> getExpiredTicketOrder() async {
    final response = await get(
      Uri.parse('http://apps.babuland.org/bblapi/babuland/v2/expire_tickets'),
      headers: {'MOBILE_NUMBER': currentUser.phoneNumber!.substring(3)},
    );
    if (response.statusCode == 200) {
      final expiredTicketOrderList = ticketOrderModelFromJson(response.body);
      return expiredTicketOrderList;
    } else {
      throw Exception('EXPIRED TICKET ORDER REPOSITORY ERROR');
    }
  }
}
