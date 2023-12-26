import 'package:bloc/bloc.dart';
import 'package:flutter_babuland_app/data/model/notification_history_model.dart';
import 'package:flutter_babuland_app/data/repository/notification_history_repository.dart';
import 'package:meta/meta.dart';

part 'notification_history_event.dart';
part 'notification_history_state.dart';

class NotificationHistoryBloc
    extends Bloc<NotificationHistoryEvent, NotificationHistoryState> {
  final NotificationHistoryRepository _notificationHistoryRepository;
  NotificationHistoryBloc(this._notificationHistoryRepository)
      : super(NotificationHistoryLoadingState()) {
    on<NotificationHistoryEvent>((event, emit) async {
      final notificationHistoryList =
          await _notificationHistoryRepository.getNotification();

      emit(NotificationHistoryLoadedState(
          notificationHistoryModel: notificationHistoryList));
    });
  }
}
