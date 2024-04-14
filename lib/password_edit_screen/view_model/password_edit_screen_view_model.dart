import 'package:flutter/cupertino.dart';
import 'package:hr_app/password_edit_screen/model/apis/update_password_api.dart';
import 'package:mobx/mobx.dart';
part 'password_edit_screen_view_model.g.dart';

class PasswordEditScreenViewModel = _PasswordEditScreenViewModelBase
    with _$PasswordEditScreenViewModel;

abstract class _PasswordEditScreenViewModelBase with Store {
  final UpdatePasswordApi _updatePasswordApi = UpdatePasswordApi();

  @observable
  TextEditingController newPasswordTextController = TextEditingController();

  @action
  TextEditingController getNewPasswordController() {
    return newPasswordTextController;
  }

  @action
  Future changePassword(
    int id,
    String password,
  ) async {
    await _updatePasswordApi.updatePasswordApi(id, password).catchError((err) {
      debugPrint(err.toString());
    });
  }
}
