import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({super.key});

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();

  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? departmentControllerSelect;

  //int? birthDay;
  //int? birthMonth;
  //int? birthYear;

  @override
  void didChangeDependencies() {
    emailController = signupScreenViewModel.getEmailController();
    fullnameController = signupScreenViewModel.getFullnameController();
    departmentControllerSelect = signupScreenViewModel.getDepartmentControllerSelected();
    //departmentController = signupScreenViewModel.getDepartmentController();
    phoneNumberController = signupScreenViewModel.getPhoneNumberController();
    passwordController = signupScreenViewModel.getPasswordController();
    //birthDay = signupScreenViewModel.getBirthDay();
    //birthMonth = signupScreenViewModel.getBirthMonth();
    //birthYear = signupScreenViewModel.getBirthYear();

    super.didChangeDependencies();
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content: const Text("Please enter all the information correctly"),
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
      padding: EdgeInsets.only(top: 7.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 14.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.LOGIN_SCREEN_PATH);
                  },
                  child: Text(
                    " Log in",
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
                          fullnameController.text.isNotEmpty &&
                          signupScreenViewModel.departmentSelectedController!.isNotEmpty &&
                          phoneNumberController.text.isNotEmpty &&
                          signupScreenViewModel.selectedBirthDay != null  &&
                          signupScreenViewModel.selectedBirthMonth != null &&
                          signupScreenViewModel.selectedBirthYear != null &&
                          passwordController.text.isNotEmpty ) {

                            await signupScreenViewModel
                              .createNewUser(
                              emailController.text.toString(), 
                              fullnameController.text.toString(),
                              signupScreenViewModel.departmentSelectedController!, 
                              phoneNumberController.text.toString(),
                              signupScreenViewModel.selectedBirthDay! ,
                              signupScreenViewModel.selectedBirthMonth! ,
                              signupScreenViewModel.selectedBirthYear! ,
                              passwordController.text.toString()
                            );

                            Get.toNamed(AppRoutes.LOGIN_SCREEN_PATH);

                          }else{
                            _showAlert();
                          }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 8.h),
                        backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text("Sign up"));
              },
            ),
          )
        ],
      ),
    );
  }
}
