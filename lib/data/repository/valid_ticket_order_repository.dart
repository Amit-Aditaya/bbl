import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_model.dart';
import 'package:http/http.dart';

class ValidTicketOrderRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<TicketOrderModel> getValidTicketOrder() async {
    final response = await get(
      Uri.parse('http://apps.babuland.org/bblapi/babuland/v2/valid_tickets'),
      headers: {'MOBILE_NUMBER': currentUser.phoneNumber!.substring(3)},
    );
    if (response.statusCode == 200) {
      final validTicketOrderList = ticketOrderModelFromJson(response.body);
      return validTicketOrderList;
    } else {
      throw Exception('VALID TICKET ORDER REPOSITORY ERROR');
    }
  }
}
