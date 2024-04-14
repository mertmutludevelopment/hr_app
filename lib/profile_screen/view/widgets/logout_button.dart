
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 4.h, left: 0.9.h, right: 0.9.h),
          child: ElevatedButton(
            onPressed: () {
              //exit(0);
              Get.offNamedUntil(AppRoutes.LOGIN_SCREEN_PATH, (route) => false);
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 8.h),
                backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("LOGOUT"),
          ),
        ),
      ],
    );
  }
}
