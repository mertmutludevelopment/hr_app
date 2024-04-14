import 'package:flutter/material.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EmailInputArea extends StatefulWidget {
  const EmailInputArea({super.key});

  @override
  State<EmailInputArea> createState() => _EmailInputAreaState();
}

class _EmailInputAreaState extends State<EmailInputArea> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 9.h,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text("Login your E-mail and Password",
              style: TextStyle(
                fontSize: 16.95.sp,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        Observer( builder: (_){
          return TextField(
            controller: loginScreenViewModel.emailTextController,
            decoration: const InputDecoration(
              labelText: "E-mail",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
            ),
          );
        },),
      ],
    );
  }
}
