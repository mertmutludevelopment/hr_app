import 'package:flutter/material.dart';
import 'package:hr_app/login_screen/model/apis/user_verification_api.dart';
import 'package:hr_app/utils/models/users.dart';
import 'package:mobx/mobx.dart';
part 'login_screen_view_model.g.dart';

class LoginScreenViewModel = _LoginScreenViewModelBase
    with _$LoginScreenViewModel;

abstract class _LoginScreenViewModelBase with Store {
  final UserVerificationApi _userVerificationApi = UserVerificationApi();

  @observable
  TextEditingController emailTextController = TextEditingController();

  @observable
  TextEditingController passwordTextController = TextEditingController();

  @observable
  Users? user;

  @action 
  TextEditingController getEmailController(){
    return emailTextController;
  }

  @action
  TextEditingController getPasswordController(){
    return passwordTextController;
  }

  @action
  int? getLeaveDay(){
    return user!.leaveDay;
  }
  

  @action
  Future<Users?> getUser(String email, String password) async {
    var data;
    await _userVerificationApi
        .userVerify(email, password)
        .then((value) => data = value)
        .catchError((err) {
      debugPrint(err.toString());
    });

    if(data.isNotEmpty){
      var userData = Users.fromJson(data as Map<String,dynamic>);
      user=userData;
      return user;
    }
    else{
      throw Exception("Veri bulunamadı.");
    }
  }
}
