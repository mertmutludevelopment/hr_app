import 'package:flutter/material.dart';
import 'package:hr_app/login_screen/view/widgets/email_input_area.dart';
import 'package:hr_app/login_screen/view/widgets/login_button.dart';
import 'package:hr_app/login_screen/view/widgets/password_input_area.dart';
import 'package:sizer/sizer.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});


  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: buildBody(),
    );
  }


  Widget buildBody(){
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(2.h),
        child: const Column(
          children: [
            EmailInputArea(),
            PasswordInputArea(),
            LoginButton(),
          ],
      
        ),
      ),
    );
  }
}