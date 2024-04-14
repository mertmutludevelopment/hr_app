import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class EmailInputArea extends StatefulWidget {
  const EmailInputArea({super.key});

  @override
  State<EmailInputArea> createState() => _EmailInputAreaState();
}

class _EmailInputAreaState extends State<EmailInputArea> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        Observer(
          builder: (_) {
            return  TextField(
              controller: signupScreenViewModel.emailTextController,
              decoration: const InputDecoration(
                labelText: "E-mail",
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
