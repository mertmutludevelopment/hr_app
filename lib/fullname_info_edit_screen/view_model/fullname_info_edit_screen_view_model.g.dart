// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullname_info_edit_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FullnameInfoEditScreenViewModel
    on _FullnameInfoEditScreenViewModelBase, Store {
  late final _$newFullnameTextControllerAtom = Atom(
      name: '_FullnameInfoEditScreenViewModelBase.newFullnameTextController',
      context: context);

  @override
  TextEditingController get newFullnameTextController {
    _$newFullnameTextControllerAtom.reportRead();
    return super.newFullnameTextController;
  }

  @override
  set newFullnameTextController(TextEditingController value) {
    _$newFullnameTextControllerAtom
        .reportWrite(value, super.newFullnameTextController, () {
      super.newFullnameTextController = value;
    });
  }

  late final _$changeFullnameAsyncAction = AsyncAction(
      '_FullnameInfoEditScreenViewModelBase.changeFullname',
      context: context);

  @override
  Future<dynamic> changeFullname(int id, String fullname) {
    return _$changeFullnameAsyncAction
        .run(() => super.changeFullname(id, fullname));
  }

  late final _$_FullnameInfoEditScreenViewModelBaseActionController =
      ActionController(
          name: '_FullnameInfoEditScreenViewModelBase', context: context);

  @override
  TextEditingController getNewFullnameController() {
    final _$actionInfo =
        _$_FullnameInfoEditScreenViewModelBaseActionController.startAction(
            name:
                '_FullnameInfoEditScreenViewModelBase.getNewFullnameController');
    try {
      return super.getNewFullnameController();
    } finally {
      _$_FullnameInfoEditScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newFullnameTextController: ${newFullnameTextController}
    ''';
  }
}
