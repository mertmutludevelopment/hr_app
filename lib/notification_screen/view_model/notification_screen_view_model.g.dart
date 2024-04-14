// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationScreenViewModel on _NotificationScreenViewModelBase, Store {
  late final _$notificationsListByUserAtom = Atom(
      name: '_NotificationScreenViewModelBase.notificationsListByUser',
      context: context);

  @override
  ObservableList<Notifications> get notificationsListByUser {
    _$notificationsListByUserAtom.reportRead();
    return super.notificationsListByUser;
  }

  @override
  set notificationsListByUser(ObservableList<Notifications> value) {
    _$notificationsListByUserAtom
        .reportWrite(value, super.notificationsListByUser, () {
      super.notificationsListByUser = value;
    });
  }

  late final _$getNotificationsListByUserAsyncAction = AsyncAction(
      '_NotificationScreenViewModelBase.getNotificationsListByUser',
      context: context);

  @override
  Future<List<Notifications>> getNotificationsListByUser(int userId) {
    return _$getNotificationsListByUserAsyncAction
        .run(() => super.getNotificationsListByUser(userId));
  }

  late final _$removeNotificationAsyncAction = AsyncAction(
      '_NotificationScreenViewModelBase.removeNotification',
      context: context);

  @override
  Future<bool> removeNotification(int notificationId) {
    return _$removeNotificationAsyncAction
        .run(() => super.removeNotification(notificationId));
  }

  @override
  String toString() {
    return '''
notificationsListByUser: ${notificationsListByUser}
    ''';
  }
}
