import 'package:flutter/cupertino.dart';
import 'package:hr_app/department_detail_screen/model/apis/get_all_users_api.dart';
import 'package:hr_app/utils/models/users.dart';
import 'package:mobx/mobx.dart';
part 'department_detail_screen_view_model.g.dart';

class DepartmentDetailScreenViewModel = _DepartmentDetailScreenViewModelBase
    with _$DepartmentDetailScreenViewModel;

abstract class _DepartmentDetailScreenViewModelBase with Store {
  final GetAllUsersApi _allUsersApi = GetAllUsersApi();

  @observable
  ObservableList<Users> userList = ObservableList();

  @action
  Future<List<Users>> getAllUsers(String departmentName) async {
    var data;
    await _allUsersApi
        .getAllUsersApi(departmentName)
        .then((value) => data = value)
        .catchError((err) {
      debugPrint(err.toString());
    });
    userList.addAll(data);
    return userList;
  }
}
