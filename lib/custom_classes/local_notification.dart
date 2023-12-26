import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationAPI {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channelName'),
        iOS: IOSNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ));
  }

  static Future showNotification({
    int id = 12,
    String? title,
    String? body,
    String? payload,
  }) async {
    return _notifications.show(id, title, body, await _notificationDetails(),
        payload: payload);
  }
}
