// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_info_edit_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhoneInfoEditScreenViewModel
    on _PhoneInfoEditScreenViewModelBase, Store {
  late final _$newPhoneNumberTextControllerAtom = Atom(
      name: '_PhoneInfoEditScreenViewModelBase.newPhoneNumberTextController',
      context: context);

  @override
  TextEditingController get newPhoneNumberTextController {
    _$newPhoneNumberTextControllerAtom.reportRead();
    return super.newPhoneNumberTextController;
  }

  @override
  set newPhoneNumberTextController(TextEditingController value) {
    _$newPhoneNumberTextControllerAtom
        .reportWrite(value, super.newPhoneNumberTextController, () {
      super.newPhoneNumberTextController = value;
    });
  }

  late final _$changePhoneNumberAsyncAction = AsyncAction(
      '_PhoneInfoEditScreenViewModelBase.changePhoneNumber',
      context: context);

  @override
  Future<dynamic> changePhoneNumber(int id, String phoneNumber) {
    return _$changePhoneNumberAsyncAction
        .run(() => super.changePhoneNumber(id, phoneNumber));
  }

  late final _$_PhoneInfoEditScreenViewModelBaseActionController =
      ActionController(
          name: '_PhoneInfoEditScreenViewModelBase', context: context);

  @override
  TextEditingController getNewPhoneNumbercontroller() {
    final _$actionInfo =
        _$_PhoneInfoEditScreenViewModelBaseActionController.startAction(
            name:
                '_PhoneInfoEditScreenViewModelBase.getNewPhoneNumbercontroller');
    try {
      return super.getNewPhoneNumbercontroller();
    } finally {
      _$_PhoneInfoEditScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newPhoneNumberTextController: ${newPhoneNumberTextController}
    ''';
  }
}
