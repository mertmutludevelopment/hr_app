import 'package:flutter/material.dart';
import 'package:hr_app/department_info_edit_screen/model/apis/update_department_api.dart';
import 'package:mobx/mobx.dart';
part 'department_info_edit_screen_view_model.g.dart';

class DepartmentInfoEditScreenViewModel = _DepartmentInfoEditScreenViewModelBase
    with _$DepartmentInfoEditScreenViewModel;

abstract class _DepartmentInfoEditScreenViewModelBase with Store {
  final UpdateDepartmentApi _updateDepartmentApi = UpdateDepartmentApi();

  @observable
  TextEditingController newDepartmentTextController = TextEditingController();

  @action
  TextEditingController getNewDepartmentcontroller() {
    return newDepartmentTextController;
  }

  @action
  Future changeDepartment(
    int id,
    String department,
  ) async {
    await _updateDepartmentApi
        .updateDepartment(id, department)
        .catchError((err) {
      debugPrint(err.toString());
    });
  }
}
