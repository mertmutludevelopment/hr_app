import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/password_edit_screen/view_model/password_edit_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordInput extends StatefulWidget {
  const ChangePasswordInput({super.key});

  @override
  State<ChangePasswordInput> createState() => _ChangePasswordInputState();
}

class _ChangePasswordInputState extends State<ChangePasswordInput> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final passwordEditScreenViewModel = locator<PasswordEditScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5.h),
          child: Text(
            "Type your new password",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: passwordEditScreenViewModel.newPasswordTextController,
              decoration: const InputDecoration(
                hintText: "**password**",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ],
    );
  }
}
