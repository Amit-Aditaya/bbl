import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/ticket_order_item_model.dart';
import 'package:http/http.dart';

class TicketOrderItemRepository {
  Future<TicketOrderItemModel> getTicketOrderItem(int pk) async {
    final response = await get(
      Uri.parse('${AppLink.apiLink}babuland/v2/ticket_order_item'),
      headers: {'ORDER_ID': pk.toString(), 'BUNIT': '7'},
    );
    if (response.statusCode == 200) {
      final ticketOrderItemList = ticketOrderItemModelFromJson(response.body);

      return ticketOrderItemList;
    } else {
      throw Exception(
          'TICKET ORDER ITEM REPOSITORY ERROR ${response.statusCode} ');
    }
  }
}
