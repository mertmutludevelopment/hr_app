import 'package:flutter/material.dart';
import 'package:hr_app/fullname_info_edit_screen/model/apis/update_fullname_api.dart';
import 'package:mobx/mobx.dart';
part 'fullname_info_edit_screen_view_model.g.dart';

class FullnameInfoEditScreenViewModel = _FullnameInfoEditScreenViewModelBase
    with _$FullnameInfoEditScreenViewModel;

abstract class _FullnameInfoEditScreenViewModelBase with Store {
  final UpdateFullnameApi _updateFullnameApi = UpdateFullnameApi();

  @observable
  TextEditingController newFullnameTextController = TextEditingController();

  @action
  TextEditingController getNewFullnameController() {
    return newFullnameTextController;
  }

  @action
  Future changeFullname(
    int id,
    String fullname,
  ) async {
    await _updateFullnameApi
      .updateFullname(id, fullname).catchError((err) {
        debugPrint(err.toString());
      });
  }
}
