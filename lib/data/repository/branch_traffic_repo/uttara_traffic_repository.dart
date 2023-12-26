import 'package:flutter_babuland_app/data/model/branch_traffic_model/uttara_traffic_model.dart';
import 'package:http/http.dart';

class UttaraTrafficRepository {
  Future getUttaraTraffic() async {
    final response = await get(Uri.parse(
        'http://apps.babuland.org/bblapi/apiv2/apiv4/babuland_traffic_vu'));
    if (response.statusCode == 200) {
      final uttaraTrafficQty = uttaraTrafficModelFromJson(response.body);
      return uttaraTrafficQty;
    } else {
      throw Exception('UTTARA TRAFFIC REPO ERROR');
    }
  }
}
