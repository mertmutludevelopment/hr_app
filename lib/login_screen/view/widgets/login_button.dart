import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    emailController = loginScreenViewModel.getEmailController();
    passwordController = loginScreenViewModel.getPasswordController();

    super.didChangeDependencies();
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content:
              const Text("Please enter the correct email and password."),
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
    return Padding(
      padding: EdgeInsets.only(top: 43.5.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? ",
                  style: TextStyle(fontSize: 14.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.SIGNUP_SCREEN_PATH);
                  },
                  child: Text(
                    " Sign up",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(1000, 241, 0, 77)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Observer(
              builder: (_) {
                return ElevatedButton(
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        await loginScreenViewModel
                            .getUser(emailController.text.toString(),
                                passwordController.text.toString())
                            .then((value) {});

                        Get.offNamedUntil(
                            AppRoutes.MAIN_SCREEN_PATH, (route) => false);
                      }
                      else{
                        _showAlert();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 8.h),
                        backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text("Sign in"));
              },
            ),
          )
        ],
      ),
    );
  }
}
