import 'package:flutter/cupertino.dart';
import 'package:hr_app/department_screen/model/apis/department_api.dart';
import 'package:hr_app/department_screen/model/apis/search_user_api.dart';
import 'package:hr_app/utils/models/users.dart';
import 'package:mobx/mobx.dart';
part 'department_screen_view_model.g.dart';

class DepartmentScreenViewModel = _DepartmentScreenViewModelBase
    with _$DepartmentScreenViewModel;

abstract class _DepartmentScreenViewModelBase with Store {
  final DepartmentApi _getDepartments = DepartmentApi();
  final SearchUserApi _getSearchedUser = SearchUserApi(); 

 
  @observable
  ObservableList<String> usedDepartments = ObservableList();

   @observable
  ObservableList<Users> searchedUsersList = ObservableList();

  @observable
  TextEditingController userNameControllerText = TextEditingController();

  @action
  TextEditingController getUserNameController() {
    return userNameControllerText;
  }

  @action
  Future<List<Users>> getSearchedAllUsers(String userName) async {
    var data;
    await _getSearchedUser
        .searchUserApi(userName)
        .then((value) => data = value)
        .catchError((err) {
      debugPrint(err.toString());
    });
    searchedUsersList.addAll(data);
    return searchedUsersList;
  }

  
  

  @action
  Future<void> getAllUsedDepartments() async {
    try {
      List<String> result = await _getDepartments.departmentApi();
      usedDepartments.addAll(result);
    } catch (error) {
      throw Exception('$error');
    }
  }
}
