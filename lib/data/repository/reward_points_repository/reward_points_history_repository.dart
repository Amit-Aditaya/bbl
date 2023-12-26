import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/reward_points_history_model.dart';
import 'package:http/http.dart';

class RewardPointsHistoryRepository {
  Future<RewardPointsHistoryModel> getRewardPointsHistory() async {
    CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
    final response = await get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v2/rp_history'),
        headers: {'PHONE_NUMBER': currentUser.phoneNumber!.substring(3)});
    if (response.statusCode == 200) {
      final rpHistoryList = rewardPointsHistoryModelFromJson(response.body);
      return rpHistoryList;
    } else {
      throw Exception('REWARD POINT HISTORY REPOSITORY ERROR');
    }
  }
}
