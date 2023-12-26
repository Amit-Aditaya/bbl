import 'package:flutter_babuland_app/data/model/branch_traffic_model/badda_traffic_model.dart';
import 'package:http/http.dart';

class BaddaTrafficRepository {
  Future getBaddaTraffic() async {
    final response = await get(Uri.parse(
        'http://apps.babuland.org/bblapi/apiv2/apiv4/babuland_traffic_vb'));
    if (response.statusCode == 200) {
      final baddaTrafficQty = baddaTrafficModelFromJson(response.body);
      return baddaTrafficQty;
    } else {
      throw Exception('BADDA TRAFFIC REPO ERROR');
    }
  }
}
