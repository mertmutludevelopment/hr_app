import 'package:flutter/material.dart';
import 'package:hr_app/phone_info_edit_screen/model/apis/update_phone_number_api.dart';
import 'package:mobx/mobx.dart';
part 'phone_info_edit_screen_view_model.g.dart';

class PhoneInfoEditScreenViewModel = _PhoneInfoEditScreenViewModelBase with _$PhoneInfoEditScreenViewModel;

abstract class _PhoneInfoEditScreenViewModelBase with Store {
  final UpdatePhoneNumberApi _updatePhoneNumberApi = UpdatePhoneNumberApi();

  @observable
  TextEditingController newPhoneNumberTextController = TextEditingController();


  @action
  TextEditingController getNewPhoneNumbercontroller() {
    return newPhoneNumberTextController;
  }

  @action
  Future changePhoneNumber(
    int id,
    String phoneNumber,
  ) async {
    await _updatePhoneNumberApi
        .updatePhoneNumber(id, phoneNumber)
        .catchError((err) {
      debugPrint(err.toString());
    });
  }
}