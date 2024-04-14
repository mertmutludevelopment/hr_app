// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepartmentScreenViewModel on _DepartmentScreenViewModelBase, Store {
  late final _$usedDepartmentsAtom = Atom(
      name: '_DepartmentScreenViewModelBase.usedDepartments', context: context);

  @override
  ObservableList<String> get usedDepartments {
    _$usedDepartmentsAtom.reportRead();
    return super.usedDepartments;
  }

  @override
  set usedDepartments(ObservableList<String> value) {
    _$usedDepartmentsAtom.reportWrite(value, super.usedDepartments, () {
      super.usedDepartments = value;
    });
  }

  late final _$searchedUsersListAtom = Atom(
      name: '_DepartmentScreenViewModelBase.searchedUsersList',
      context: context);

  @override
  ObservableList<Users> get searchedUsersList {
    _$searchedUsersListAtom.reportRead();
    return super.searchedUsersList;
  }

  @override
  set searchedUsersList(ObservableList<Users> value) {
    _$searchedUsersListAtom.reportWrite(value, super.searchedUsersList, () {
      super.searchedUsersList = value;
    });
  }

  late final _$userNameControllerTextAtom = Atom(
      name: '_DepartmentScreenViewModelBase.userNameControllerText',
      context: context);

  @override
  TextEditingController get userNameControllerText {
    _$userNameControllerTextAtom.reportRead();
    return super.userNameControllerText;
  }

  @override
  set userNameControllerText(TextEditingController value) {
    _$userNameControllerTextAtom
        .reportWrite(value, super.userNameControllerText, () {
      super.userNameControllerText = value;
    });
  }

  late final _$getSearchedAllUsersAsyncAction = AsyncAction(
      '_DepartmentScreenViewModelBase.getSearchedAllUsers',
      context: context);

  @override
  Future<List<Users>> getSearchedAllUsers(String userName) {
    return _$getSearchedAllUsersAsyncAction
        .run(() => super.getSearchedAllUsers(userName));
  }

  late final _$getAllUsedDepartmentsAsyncAction = AsyncAction(
      '_DepartmentScreenViewModelBase.getAllUsedDepartments',
      context: context);

  @override
  Future<void> getAllUsedDepartments() {
    return _$getAllUsedDepartmentsAsyncAction
        .run(() => super.getAllUsedDepartments());
  }

  late final _$_DepartmentScreenViewModelBaseActionController =
      ActionController(
          name: '_DepartmentScreenViewModelBase', context: context);

  @override
  TextEditingController getUserNameController() {
    final _$actionInfo =
        _$_DepartmentScreenViewModelBaseActionController.startAction(
            name: '_DepartmentScreenViewModelBase.getUserNameController');
    try {
      return super.getUserNameController();
    } finally {
      _$_DepartmentScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usedDepartments: ${usedDepartments},
searchedUsersList: ${searchedUsersList},
userNameControllerText: ${userNameControllerText}
    ''';
  }
}
