// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_notification_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagerNotificationScreenViewModel
    on _ManagerNotificationScreenViewModelBase, Store {
  late final _$notificationDescriptionTextControllerAtom = Atom(
      name:
          '_ManagerNotificationScreenViewModelBase.notificationDescriptionTextController',
      context: context);

  @override
  TextEditingController get notificationDescriptionTextController {
    _$notificationDescriptionTextControllerAtom.reportRead();
    return super.notificationDescriptionTextController;
  }

  @override
  set notificationDescriptionTextController(TextEditingController value) {
    _$notificationDescriptionTextControllerAtom
        .reportWrite(value, super.notificationDescriptionTextController, () {
      super.notificationDescriptionTextController = value;
    });
  }

  late final _$notificationUserTextControllerAtom = Atom(
      name:
          '_ManagerNotificationScreenViewModelBase.notificationUserTextController',
      context: context);

  @override
  TextEditingController get notificationUserTextController {
    _$notificationUserTextControllerAtom.reportRead();
    return super.notificationUserTextController;
  }

  @override
  set notificationUserTextController(TextEditingController value) {
    _$notificationUserTextControllerAtom
        .reportWrite(value, super.notificationUserTextController, () {
      super.notificationUserTextController = value;
    });
  }

  late final _$createNewNotificationAsyncAction = AsyncAction(
      '_ManagerNotificationScreenViewModelBase.createNewNotification',
      context: context);

  @override
  Future<dynamic> createNewNotification(
      String notificationDescription,
      int? notificationReceiverId,
      int notificationSenderId,
      String notificationSenderFullname,
      String notificationSenderDepartment) {
    return _$createNewNotificationAsyncAction.run(() => super
        .createNewNotification(
            notificationDescription,
            notificationReceiverId,
            notificationSenderId,
            notificationSenderFullname,
            notificationSenderDepartment));
  }

  late final _$_ManagerNotificationScreenViewModelBaseActionController =
      ActionController(
          name: '_ManagerNotificationScreenViewModelBase', context: context);

  @override
  TextEditingController getNotificationUserController() {
    final _$actionInfo =
        _$_ManagerNotificationScreenViewModelBaseActionController.startAction(
            name:
                '_ManagerNotificationScreenViewModelBase.getNotificationUserController');
    try {
      return super.getNotificationUserController();
    } finally {
      _$_ManagerNotificationScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getNotificationDescriptionController() {
    final _$actionInfo =
        _$_ManagerNotificationScreenViewModelBaseActionController.startAction(
            name:
                '_ManagerNotificationScreenViewModelBase.getNotificationDescriptionController');
    try {
      return super.getNotificationDescriptionController();
    } finally {
      _$_ManagerNotificationScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notificationDescriptionTextController: ${notificationDescriptionTextController},
notificationUserTextController: ${notificationUserTextController}
    ''';
  }
}
