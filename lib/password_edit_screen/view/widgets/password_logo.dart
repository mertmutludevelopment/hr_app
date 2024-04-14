import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PasswordLogo extends StatefulWidget {
  const PasswordLogo({super.key});

  @override
  State<PasswordLogo> createState() => _PasswordLogoState();
}

class _PasswordLogoState extends State<PasswordLogo> {
  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 3.h , bottom: 2.5.h),
          child: SizedBox(
            height: 20.h,
             child: Image.asset("images/password_logo.png"),
          ),
        ),
      ],
    );
  }
}