// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_info_edit_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmailInfoEditScreenViewModel
    on _EmailInfoEditScreenViewModelBase, Store {
  late final _$newEmailTextControllerAtom = Atom(
      name: '_EmailInfoEditScreenViewModelBase.newEmailTextController',
      context: context);

  @override
  TextEditingController get newEmailTextController {
    _$newEmailTextControllerAtom.reportRead();
    return super.newEmailTextController;
  }

  @override
  set newEmailTextController(TextEditingController value) {
    _$newEmailTextControllerAtom
        .reportWrite(value, super.newEmailTextController, () {
      super.newEmailTextController = value;
    });
  }

  late final _$changeEmailAsyncAction = AsyncAction(
      '_EmailInfoEditScreenViewModelBase.changeEmail',
      context: context);

  @override
  Future<dynamic> changeEmail(int id, String email) {
    return _$changeEmailAsyncAction.run(() => super.changeEmail(id, email));
  }

  late final _$_EmailInfoEditScreenViewModelBaseActionController =
      ActionController(
          name: '_EmailInfoEditScreenViewModelBase', context: context);

  @override
  TextEditingController getNewEmailController() {
    final _$actionInfo =
        _$_EmailInfoEditScreenViewModelBaseActionController.startAction(
            name: '_EmailInfoEditScreenViewModelBase.getNewEmailController');
    try {
      return super.getNewEmailController();
    } finally {
      _$_EmailInfoEditScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newEmailTextController: ${newEmailTextController}
    ''';
  }
}
