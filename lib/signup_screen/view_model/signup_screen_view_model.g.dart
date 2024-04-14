// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupScreenViewModel on _SignupScreenViewModelBase, Store {
  late final _$emailTextControllerAtom = Atom(
      name: '_SignupScreenViewModelBase.emailTextController', context: context);

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

  late final _$fullnameTextControllerAtom = Atom(
      name: '_SignupScreenViewModelBase.fullnameTextController',
      context: context);

  @override
  TextEditingController get fullnameTextController {
    _$fullnameTextControllerAtom.reportRead();
    return super.fullnameTextController;
  }

  @override
  set fullnameTextController(TextEditingController value) {
    _$fullnameTextControllerAtom
        .reportWrite(value, super.fullnameTextController, () {
      super.fullnameTextController = value;
    });
  }

  late final _$departmentTextControllerAtom = Atom(
      name: '_SignupScreenViewModelBase.departmentTextController',
      context: context);

  @override
  TextEditingController get departmentTextController {
    _$departmentTextControllerAtom.reportRead();
    return super.departmentTextController;
  }

  @override
  set departmentTextController(TextEditingController value) {
    _$departmentTextControllerAtom
        .reportWrite(value, super.departmentTextController, () {
      super.departmentTextController = value;
    });
  }

  late final _$departmentSelectedControllerAtom = Atom(
      name: '_SignupScreenViewModelBase.departmentSelectedController',
      context: context);

  @override
  String? get departmentSelectedController {
    _$departmentSelectedControllerAtom.reportRead();
    return super.departmentSelectedController;
  }

  @override
  set departmentSelectedController(String? value) {
    _$departmentSelectedControllerAtom
        .reportWrite(value, super.departmentSelectedController, () {
      super.departmentSelectedController = value;
    });
  }

  late final _$phonenumberTextControllerAtom = Atom(
      name: '_SignupScreenViewModelBase.phonenumberTextController',
      context: context);

  @override
  TextEditingController get phonenumberTextController {
    _$phonenumberTextControllerAtom.reportRead();
    return super.phonenumberTextController;
  }

  @override
  set phonenumberTextController(TextEditingController value) {
    _$phonenumberTextControllerAtom
        .reportWrite(value, super.phonenumberTextController, () {
      super.phonenumberTextController = value;
    });
  }

  late final _$selectedBirthDayAtom = Atom(
      name: '_SignupScreenViewModelBase.selectedBirthDay', context: context);

  @override
  int? get selectedBirthDay {
    _$selectedBirthDayAtom.reportRead();
    return super.selectedBirthDay;
  }

  @override
  set selectedBirthDay(int? value) {
    _$selectedBirthDayAtom.reportWrite(value, super.selectedBirthDay, () {
      super.selectedBirthDay = value;
    });
  }

  late final _$selectedBirthMonthAtom = Atom(
      name: '_SignupScreenViewModelBase.selectedBirthMonth', context: context);

  @override
  int? get selectedBirthMonth {
    _$selectedBirthMonthAtom.reportRead();
    return super.selectedBirthMonth;
  }

  @override
  set selectedBirthMonth(int? value) {
    _$selectedBirthMonthAtom.reportWrite(value, super.selectedBirthMonth, () {
      super.selectedBirthMonth = value;
    });
  }

  late final _$selectedBirthYearAtom = Atom(
      name: '_SignupScreenViewModelBase.selectedBirthYear', context: context);

  @override
  int? get selectedBirthYear {
    _$selectedBirthYearAtom.reportRead();
    return super.selectedBirthYear;
  }

  @override
  set selectedBirthYear(int? value) {
    _$selectedBirthYearAtom.reportWrite(value, super.selectedBirthYear, () {
      super.selectedBirthYear = value;
    });
  }

  late final _$passwordTextControllerAtom = Atom(
      name: '_SignupScreenViewModelBase.passwordTextController',
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

  late final _$createNewUserAsyncAction =
      AsyncAction('_SignupScreenViewModelBase.createNewUser', context: context);

  @override
  Future<dynamic> createNewUser(
      String email,
      String fullname,
      String department,
      String phoneNumber,
      int birthDay,
      int birthMonth,
      int birthYear,
      String password) {
    return _$createNewUserAsyncAction.run(() => super.createNewUser(
        email,
        fullname,
        department,
        phoneNumber,
        birthDay,
        birthMonth,
        birthYear,
        password));
  }

  late final _$_SignupScreenViewModelBaseActionController =
      ActionController(name: '_SignupScreenViewModelBase', context: context);

  @override
  TextEditingController getEmailController() {
    final _$actionInfo = _$_SignupScreenViewModelBaseActionController
        .startAction(name: '_SignupScreenViewModelBase.getEmailController');
    try {
      return super.getEmailController();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getFullnameController() {
    final _$actionInfo = _$_SignupScreenViewModelBaseActionController
        .startAction(name: '_SignupScreenViewModelBase.getFullnameController');
    try {
      return super.getFullnameController();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getDepartmentController() {
    final _$actionInfo =
        _$_SignupScreenViewModelBaseActionController.startAction(
            name: '_SignupScreenViewModelBase.getDepartmentController');
    try {
      return super.getDepartmentController();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? getDepartmentControllerSelected() {
    final _$actionInfo =
        _$_SignupScreenViewModelBaseActionController.startAction(
            name: '_SignupScreenViewModelBase.getDepartmentControllerSelected');
    try {
      return super.getDepartmentControllerSelected();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getPhoneNumberController() {
    final _$actionInfo =
        _$_SignupScreenViewModelBaseActionController.startAction(
            name: '_SignupScreenViewModelBase.getPhoneNumberController');
    try {
      return super.getPhoneNumberController();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getPasswordController() {
    final _$actionInfo = _$_SignupScreenViewModelBaseActionController
        .startAction(name: '_SignupScreenViewModelBase.getPasswordController');
    try {
      return super.getPasswordController();
    } finally {
      _$_SignupScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailTextController: ${emailTextController},
fullnameTextController: ${fullnameTextController},
departmentTextController: ${departmentTextController},
departmentSelectedController: ${departmentSelectedController},
phonenumberTextController: ${phonenumberTextController},
selectedBirthDay: ${selectedBirthDay},
selectedBirthMonth: ${selectedBirthMonth},
selectedBirthYear: ${selectedBirthYear},
passwordTextController: ${passwordTextController}
    ''';
  }
}
