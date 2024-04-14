import 'package:flutter/material.dart';
import 'package:hr_app/email_info_edit_screen/model/apis/update_email_api.dart';
import 'package:mobx/mobx.dart';
part 'email_info_edit_screen_view_model.g.dart';

class EmailInfoEditScreenViewModel = _EmailInfoEditScreenViewModelBase
    with _$EmailInfoEditScreenViewModel;

abstract class _EmailInfoEditScreenViewModelBase with Store {
  final UpdateEmailApi _updateEmailApi = UpdateEmailApi();

  @observable
  TextEditingController newEmailTextController = TextEditingController();

  @action
  TextEditingController getNewEmailController() {
    return newEmailTextController;
  }

  @action
  Future changeEmail(
    int id,
    String email,
  ) async {
    await _updateEmailApi.updateEmail(id, email).catchError((err) {
      debugPrint(err.toString());
    });
  }
}
