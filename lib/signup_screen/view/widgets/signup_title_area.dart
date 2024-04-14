import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignupTitleArea extends StatefulWidget {
  const SignupTitleArea({super.key});

  @override
  State<SignupTitleArea> createState() => _SignupTitleAreaState();
}

class _SignupTitleAreaState extends State<SignupTitleArea> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 3.5.h,
          ),
          Text(
            "Create Account",
            style: TextStyle(
                fontSize: 15.sp,
                color: const Color.fromARGB(1000, 241, 0, 77),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
