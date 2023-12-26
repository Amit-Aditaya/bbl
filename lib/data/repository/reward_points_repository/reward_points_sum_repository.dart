import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/reward_point_sum_model.dart';
import 'package:http/http.dart';

class RewardPointsSumRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<RewardPointsSumModel> getRewardPointsSum() async {
    final response = await get(
      Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/rp_sum'),
      headers: {'PHONE_NUMBER': currentUser.phoneNumber!.substring(3)},
    );

    if (response.statusCode == 200) {
      final rewardPointsSum = rewardPointsSumModelFromJson(response.body);
      return rewardPointsSum;
    } else {
      throw Exception('REWARD POINT SUM REPOSITORY ERROR');
    }
  }
}
