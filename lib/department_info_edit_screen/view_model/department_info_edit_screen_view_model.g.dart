// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_info_edit_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepartmentInfoEditScreenViewModel
    on _DepartmentInfoEditScreenViewModelBase, Store {
  late final _$newDepartmentTextControllerAtom = Atom(
      name:
          '_DepartmentInfoEditScreenViewModelBase.newDepartmentTextController',
      context: context);

  @override
  TextEditingController get newDepartmentTextController {
    _$newDepartmentTextControllerAtom.reportRead();
    return super.newDepartmentTextController;
  }

  @override
  set newDepartmentTextController(TextEditingController value) {
    _$newDepartmentTextControllerAtom
        .reportWrite(value, super.newDepartmentTextController, () {
      super.newDepartmentTextController = value;
    });
  }

  late final _$changeDepartmentAsyncAction = AsyncAction(
      '_DepartmentInfoEditScreenViewModelBase.changeDepartment',
      context: context);

  @override
  Future<dynamic> changeDepartment(int id, String department) {
    return _$changeDepartmentAsyncAction
        .run(() => super.changeDepartment(id, department));
  }

  late final _$_DepartmentInfoEditScreenViewModelBaseActionController =
      ActionController(
          name: '_DepartmentInfoEditScreenViewModelBase', context: context);

  @override
  TextEditingController getNewDepartmentcontroller() {
    final _$actionInfo =
        _$_DepartmentInfoEditScreenViewModelBaseActionController.startAction(
            name:
                '_DepartmentInfoEditScreenViewModelBase.getNewDepartmentcontroller');
    try {
      return super.getNewDepartmentcontroller();
    } finally {
      _$_DepartmentInfoEditScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newDepartmentTextController: ${newDepartmentTextController}
    ''';
  }
}
