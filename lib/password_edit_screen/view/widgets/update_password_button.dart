import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/password_edit_screen/view_model/password_edit_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class UpdatePasswordButton extends StatefulWidget {
  const UpdatePasswordButton({super.key});

  @override
  State<UpdatePasswordButton> createState() => _UpdatePasswordButtonState();
}

class _UpdatePasswordButtonState extends State<UpdatePasswordButton> {
 final loginScreenViewModel = locator<LoginScreenViewModel>();
  final passwordEditScreenViewModel = locator<PasswordEditScreenViewModel>();

  TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    passwordController = passwordEditScreenViewModel.getNewPasswordController();

    super.didChangeDependencies();
  }

  

  void _showEmptyFieldsAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content: const Text("Password fields cannot be left blank."),
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
                    if (passwordController.text.isNotEmpty) {
                      await passwordEditScreenViewModel.changePassword(
                          loginScreenViewModel.user!.id,
                          passwordController.text.toString());

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passworrd successfully changed!'),
                          duration:  Duration(
                              seconds: 4), 
                        ),
                      );
                      passwordEditScreenViewModel.newPasswordTextController.clear();
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
                  child: const Text("Change Password"));
            },
          ),
        ),
      ],
    );
  }
}