import 'package:flutter_babuland_app/data/model/branch_traffic_model/wari_traffic_model.dart';
import 'package:http/http.dart';

class WariTrafficRepository {
  Future getWariTraffic() async {
    final response = await get(Uri.parse(
        'http://apps.babuland.org/bblapi/apiv2/apiv4/babuland_traffic_vw'));
    if (response.statusCode == 200) {
      final wariTrafficQty = wariTrafficModelFromJson(response.body);
      return wariTrafficQty;
    } else {
      throw Exception('WARI TRAFFIC REPO ERROR');
    }
  }
}
