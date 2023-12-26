import 'package:flutter_babuland_app/data/model/branch_traffic_model/mirpur_traffic_model.dart';
import 'package:http/http.dart';

class MirpurTrafficRepository {
  Future getMirpurTraffic() async {
    final response = await get(Uri.parse(
        'http://apps.babuland.org/bblapi/apiv2/apiv4/babuland_traffic_vm'));
    if (response.statusCode == 200) {
      final mirpurTrafficQty = mirpurTrafficModelFromJson(response.body);
      return mirpurTrafficQty;
    } else {
      throw Exception('MIRPUR TRAFFIC REPO ERROR');
    }
  }
}
