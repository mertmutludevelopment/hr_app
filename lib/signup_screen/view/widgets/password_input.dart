import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();

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
          height: 2.85.h,
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: signupScreenViewModel.passwordTextController,
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
