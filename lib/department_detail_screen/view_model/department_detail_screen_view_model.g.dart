// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_detail_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepartmentDetailScreenViewModel
    on _DepartmentDetailScreenViewModelBase, Store {
  late final _$userListAtom = Atom(
      name: '_DepartmentDetailScreenViewModelBase.userList', context: context);

  @override
  ObservableList<Users> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableList<Users> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$getAllUsersAsyncAction = AsyncAction(
      '_DepartmentDetailScreenViewModelBase.getAllUsers',
      context: context);

  @override
  Future<List<Users>> getAllUsers(String departmentName) {
    return _$getAllUsersAsyncAction
        .run(() => super.getAllUsers(departmentName));
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
