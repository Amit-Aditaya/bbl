import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/membership_subscription_model.dart';
import 'package:http/http.dart';

class MembershipSubscriptionRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<MembershipSubscriptionModel> getMembershipSubscriptions() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/m_pkg_sales'),
        headers: {'MOBILE_NUMBER': currentUser.phoneNumber!.substring(3)});

    if (response.statusCode == 200) {
      final subscriptions = membershipSubscriptionModelFromJson(response.body);
      return subscriptions;
    } else {
      throw Exception('MEMBERSHIP SUB REPO ERROR');
    }
  }
}
