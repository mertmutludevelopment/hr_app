// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenViewModel on _LoginScreenViewModelBase, Store {
  late final _$emailTextControllerAtom = Atom(
      name: '_LoginScreenViewModelBase.emailTextController', context: context);

  @override
  TextEditingController get emailTextController {
    _$emailTextControllerAtom.reportRead();
    return super.emailTextController;
  }

  @override
  set emailTextController(TextEditingController value) {
    _$emailTextControllerAtom.reportWrite(value, super.emailTextController, () {
      super.emailTextController = value;
    });
  }

  late final _$passwordTextControllerAtom = Atom(
      name: '_LoginScreenViewModelBase.passwordTextController',
      context: context);

  @override
  TextEditingController get passwordTextController {
    _$passwordTextControllerAtom.reportRead();
    return super.passwordTextController;
  }

  @override
  set passwordTextController(TextEditingController value) {
    _$passwordTextControllerAtom
        .reportWrite(value, super.passwordTextController, () {
      super.passwordTextController = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_LoginScreenViewModelBase.user', context: context);

  @override
  Users? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Users? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_LoginScreenViewModelBase.getUser', context: context);

  @override
  Future<Users?> getUser(String email, String password) {
    return _$getUserAsyncAction.run(() => super.getUser(email, password));
  }

  late final _$_LoginScreenViewModelBaseActionController =
      ActionController(name: '_LoginScreenViewModelBase', context: context);

  @override
  TextEditingController getEmailController() {
    final _$actionInfo = _$_LoginScreenViewModelBaseActionController
        .startAction(name: '_LoginScreenViewModelBase.getEmailController');
    try {
      return super.getEmailController();
    } finally {
      _$_LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getPasswordController() {
    final _$actionInfo = _$_LoginScreenViewModelBaseActionController
        .startAction(name: '_LoginScreenViewModelBase.getPasswordController');
    try {
      return super.getPasswordController();
    } finally {
      _$_LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int? getLeaveDay() {
    final _$actionInfo = _$_LoginScreenViewModelBaseActionController
        .startAction(name: '_LoginScreenViewModelBase.getLeaveDay');
    try {
      return super.getLeaveDay();
    } finally {
      _$_LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailTextController: ${emailTextController},
passwordTextController: ${passwordTextController},
user: ${user}
    ''';
  }
}
