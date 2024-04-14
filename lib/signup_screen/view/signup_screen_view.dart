import 'package:flutter/material.dart';
import 'package:hr_app/signup_screen/view/widgets/birthday_picker.dart';
import 'package:hr_app/signup_screen/view/widgets/department_input_area.dart';
import 'package:hr_app/signup_screen/view/widgets/email_input_area.dart';
import 'package:hr_app/signup_screen/view/widgets/password_input.dart';
import 'package:hr_app/signup_screen/view/widgets/phone_number_input_area.dart';
import 'package:hr_app/signup_screen/view/widgets/signup_button.dart';
import 'package:hr_app/signup_screen/view/widgets/signup_title_area.dart';
import 'package:hr_app/signup_screen/view/widgets/username_input_area.dart';
import 'package:sizer/sizer.dart';

class SignUpScreenView extends StatefulWidget {
  const SignUpScreenView({super.key});

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody()  {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(2.h),
        child:  const Column(
          children: [
            SignupTitleArea(),
            EmailInputArea(),
            UsernameInputArea(),
            DepartmentInputArea(),
            PhoneNumberInputArea(),
            BirthdayPicker(),
            PasswordInput(),
            SignupButton(),
          ],
        ),
      ),
    );
  }
}