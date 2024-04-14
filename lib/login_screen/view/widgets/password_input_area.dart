import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class PasswordInputArea extends StatefulWidget {
  const PasswordInputArea({super.key});

  @override
  State<PasswordInputArea> createState() => _PasswordInputAreaState();
}

class _PasswordInputAreaState extends State<PasswordInputArea> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  bool isObscured = false;
  void toggleObscurePassword() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: loginScreenViewModel.passwordTextController,
              obscureText: isObscured ? false : true,
              decoration: InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54)),
                suffixIcon: GestureDetector(
                  onTap: toggleObscurePassword,
                  child: isObscured
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
