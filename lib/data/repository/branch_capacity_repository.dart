import 'package:flutter_babuland_app/data/model/branch_capacity_model.dart';
import 'package:http/http.dart';

class BranchCapacityRepository {
  Future getBranchCapacity() async {
    final response = await get(Uri.parse(
        'http://apps.babuland.org/bblapi/apiv2/apiv4/babuland_traffic_control'));
    if (response.statusCode == 200) {
      final branchCapacityList = branchCapacityFromJson(response.body);
      return branchCapacityList;
    } else {
      throw Exception('BRANCH CAPACITY REPO ERROR');
    }
  }
}
