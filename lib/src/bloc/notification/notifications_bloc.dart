import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:temp_noti/src/models/notification.dart';
import 'package:temp_noti/src/services/api.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<GetAllNotifications>((event, emit) async {
      List<NotiList> result = await Api.getNotification();
      emit(state.copyWith(notifications: result));
    });
  }
}
