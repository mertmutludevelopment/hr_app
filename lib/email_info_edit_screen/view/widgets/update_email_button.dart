import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/email_info_edit_screen/view_model/email_info_edit_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';


class UpdateEmailButton extends StatefulWidget {
  const UpdateEmailButton({super.key});

  @override
  State<UpdateEmailButton> createState() => _UpdateEmailButtonState();
}

class _UpdateEmailButtonState extends State<UpdateEmailButton> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final emailInfoEditScreenViewModel = locator<EmailInfoEditScreenViewModel>();

  TextEditingController emailController = TextEditingController();

  @override
  void didChangeDependencies() {
    emailController = emailInfoEditScreenViewModel.getNewEmailController();

    super.didChangeDependencies();
  }

  

  void _showEmptyFieldsAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content: const Text("Email fields cannot be left blank."),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Observer(
            builder: (_) {
              return ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isNotEmpty) {
                      await emailInfoEditScreenViewModel.changeEmail(
                          loginScreenViewModel.user!.id,
                          emailController.text.toString());

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email successfully changed! New Email : ${emailController.text}'),
                          duration: const Duration(
                              seconds: 4), 
                        ),
                      );

                      Get.toNamed(AppRoutes.LOGIN_SCREEN_PATH);
                    } else {
                      _showEmptyFieldsAlert();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 8.h),
                      backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text("Change E-mail"));
            },
          ),
        ),
      ],
    );
  }
}
