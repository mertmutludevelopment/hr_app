import 'package:flutter/cupertino.dart';
import 'package:hr_app/manager_notification_screen/model/apis/add_new_notification_api.dart';
import 'package:mobx/mobx.dart';
part 'manager_notification_screen_view_model.g.dart';

class ManagerNotificationScreenViewModel = _ManagerNotificationScreenViewModelBase
    with _$ManagerNotificationScreenViewModel;

abstract class _ManagerNotificationScreenViewModelBase with Store {
  final AddNewNotificationApi _addNewNotification = AddNewNotificationApi();

  @observable
  TextEditingController notificationDescriptionTextController =
      TextEditingController();

  @observable
  TextEditingController notificationUserTextController =
      TextEditingController();

  @action
  TextEditingController getNotificationUserController() {
    return notificationUserTextController;
  }

  @action
  TextEditingController getNotificationDescriptionController() {
    return notificationDescriptionTextController;
  }

  @action
  Future createNewNotification(
      String notificationDescription,
      int? notificationReceiverId,
      int notificationSenderId,
      String notificationSenderFullname,
      String notificationSenderDepartment) async {
    await _addNewNotification
        .addNewNotificationApi(
            notificationDescription,
            notificationReceiverId,
            notificationSenderId,
            notificationSenderFullname,
            notificationSenderDepartment)
        .catchError((err) {
      debugPrint(err.toString());
    });
  }
}
