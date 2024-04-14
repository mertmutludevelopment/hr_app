import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class UsernameInputArea extends StatefulWidget {
  const UsernameInputArea({super.key});

  @override
  State<UsernameInputArea> createState() => _UsernameInputAreaState();
}

class _UsernameInputAreaState extends State<UsernameInputArea> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Observer(
          builder: (_) {
            return TextField(
              controller: signupScreenViewModel.fullnameTextController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
