part of 'notification_history_bloc.dart';

@immutable
abstract class NotificationHistoryEvent {}

class LoadNotificationHistoryApiEvent extends NotificationHistoryEvent {}
