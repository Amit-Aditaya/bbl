import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/free_ticket_model.dart';
import 'package:http/http.dart';

class FreeTicketRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<FreeTicketModel> getFreetickets() async {
    final response = await get(
      Uri.parse('${AppLink.apiLink}apiv2/apiv3/freeticket'),
      headers: {'PHONE_NUMBER': currentUser.phoneNumber!.substring(3)},
    );
    if (response.statusCode == 200) {
      final freeTicketList = freeTicketModelFromJson(response.body);
      return freeTicketList;
    } else {
      throw Exception('FREE TICKET REPO ERROR');
    }
  }

  static Future postTicketRepository(
      {required String phoneNumber,
      required String expDateUnix,
      required String productName}) async {
    final response = await post(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv3/freeticket'),
        headers: {
          'PHONE': phoneNumber,
          'EXPIRE_DATE': expDateUnix,
          'PRODUCT_NAME': productName
        });

    return response;
  }
}
