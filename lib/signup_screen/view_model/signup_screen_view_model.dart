import 'package:flutter/material.dart';
import 'package:hr_app/signup_screen/model/apis/user_signup_api.dart';
import 'package:mobx/mobx.dart';
part 'signup_screen_view_model.g.dart';

class SignupScreenViewModel = _SignupScreenViewModelBase
    with _$SignupScreenViewModel;

abstract class _SignupScreenViewModelBase with Store {
  final UserSignupApi _userSignupApi = UserSignupApi();

  @observable
  TextEditingController emailTextController = TextEditingController();

  @observable
  TextEditingController fullnameTextController = TextEditingController();

  @observable
  TextEditingController departmentTextController = TextEditingController();

  @observable
  String? departmentSelectedController;

  @observable
  TextEditingController phonenumberTextController = TextEditingController();

  @observable
  int? selectedBirthDay;

  @observable
  int? selectedBirthMonth;

  @observable
  int? selectedBirthYear;

  @observable
  TextEditingController passwordTextController = TextEditingController();

  @action
  TextEditingController getEmailController() {
    return emailTextController;
  }

  @action
  TextEditingController getFullnameController() {
    return fullnameTextController;
  }

  @action
  TextEditingController getDepartmentController() {
    return departmentTextController;
  }

    @action
  String? getDepartmentControllerSelected() {
    return departmentSelectedController;
  }

  @action
  TextEditingController getPhoneNumberController() {
    return phonenumberTextController;
  }

  @action
  TextEditingController getPasswordController() {
    return passwordTextController;
  }

  @action
  Future createNewUser(
      String email,
      String fullname,
      String department,
      String phoneNumber,
      int birthDay,
      int birthMonth,
      int birthYear,
      String password) async {
    await _userSignupApi
        .userSignup(email, fullname, department, phoneNumber, birthDay,
            birthMonth, birthYear, password)
        .catchError((err) {
      debugPrint(err.toString());
    });
  }

  
}
