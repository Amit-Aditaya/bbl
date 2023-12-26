import 'dart:io';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/ticket_item_model.dart';
import 'package:http/http.dart';

class TicketItemRepository {
  Future<TicketItemModel> getTicketItems() async {
    final response = await get(
      Uri.parse('${AppLink.apiLink}babuland/v1/itemlist'),
      headers: {'BUNIT': Platform.isAndroid ? '6' : '7'},
    );
    if (response.statusCode == 200) {
      final ticketItemsList = ticketItemModelFromJson(response.body);
      return ticketItemsList;
    } else {
      throw Exception('TICKET ITEM REPO ERROR');
    }
  }

  static Future postTicketItems({
    required double discount,
    required int itemId,
    required int itemPrice,
    required int qty,
    required int lOrderid,
  }) async {
    final response = await post(
      Uri.parse(
          'http://apps.babuland.org/bblapi/babuland/v2/ticket_order_item'),
      headers: {
        'DISCOUNT': discount.toStringAsFixed(0),
        'ITEMINFO_FK': itemId.toString(),
        'MRP': itemPrice.toString(),
        'MSMASTERID_OFFERSID': '0.0',
        'QTY': qty.toString(),
        'TP': '0',
        'VAT': '7.5',
        'BUNIT': Platform.isAndroid ? '6' : '7',
        'INSBY': Platform.isAndroid ? 'Android' : 'IOS',
        'l_order_id': lOrderid.toString(),
      },
    ).then((response) {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('TICKET ITEM REPO ERROR (While posting)');
      }
    });
  }
}
