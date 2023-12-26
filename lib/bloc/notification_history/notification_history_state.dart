part of 'notification_history_bloc.dart';

@immutable
abstract class NotificationHistoryState {}

class NotificationHistoryLoadingState extends NotificationHistoryState {}

class NotificationHistoryLoadedState extends NotificationHistoryState {
  final NotificationHistoryModel notificationHistoryModel;

  NotificationHistoryLoadedState({required this.notificationHistoryModel});
}
