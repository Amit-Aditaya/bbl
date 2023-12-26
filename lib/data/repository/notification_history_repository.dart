import 'package:flutter_babuland_app/data/model/notification_history_model.dart';
import 'package:http/http.dart';

class NotificationHistoryRepository {
  Future getNotification() async {
    final response = await get(
        Uri.parse(
            'https://onesignal.com/api/v1/notifications?app_id=29162470-12cc-41ca-869b-ba5be6450a6b&limit=10&kind=0'),
        headers: {
          'Authorization':
              'Basic NGNkNmM4NzItYTY5ZC00MTI2LTk5ZjMtZmRkZjg4MmMzYjc1',
        });

    if (response.statusCode == 200) {
      final notificationList = notificationHistoryModelFromJson(response.body);
      return notificationList;
    } else {
      throw Exception('Notification History Repository Error');
    }
  }
}
