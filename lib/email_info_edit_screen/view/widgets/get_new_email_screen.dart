import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/email_info_edit_screen/view_model/email_info_edit_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class GetNewEmailScreen extends StatefulWidget {
  const GetNewEmailScreen({super.key});

  @override
  State<GetNewEmailScreen> createState() => _GetNewEmailScreenState();
}

class _GetNewEmailScreenState extends State<GetNewEmailScreen> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final emailInfoEditScreenViewModel = locator<EmailInfoEditScreenViewModel>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5.h),
          child: Text(
            "Type your new e-mail",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: emailInfoEditScreenViewModel.newEmailTextController,
              decoration:  InputDecoration(
                hintText: " Your old email : ${loginScreenViewModel.user!.email}",
                border: const OutlineInputBorder(
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
