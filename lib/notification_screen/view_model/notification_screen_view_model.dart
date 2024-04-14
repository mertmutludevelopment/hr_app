import 'package:hr_app/notification_screen/model/apis/delete_notification_api.dart';
import 'package:hr_app/notification_screen/model/apis/get_notification_by_user_api.dart';
import 'package:hr_app/utils/models/notifications.dart';
import 'package:mobx/mobx.dart';
part 'notification_screen_view_model.g.dart';

class NotificationScreenViewModel = _NotificationScreenViewModelBase
    with _$NotificationScreenViewModel;

abstract class _NotificationScreenViewModelBase with Store {
  final GetNotificationByUserApi _getNotificationByUser =
      GetNotificationByUserApi();

  final DeleteNotificationApi _deleteNotification = DeleteNotificationApi();

  @observable
  ObservableList<Notifications> notificationsListByUser = ObservableList();

  @action
  Future<List<Notifications>> getNotificationsListByUser(int userId) async {
    var data = await _getNotificationByUser.getNotificationByUserApi(userId);
    for (var item in data) {
      var notify = Notifications.fromJson(item as Map<String, dynamic>);
      notificationsListByUser.add(notify);
    }

    return notificationsListByUser;
  }

  @action
  Future<bool> removeNotification(int notificationId) async {
    try {
      await _deleteNotification.deleteNotificationApi(notificationId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
