import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DepartmentLogo extends StatefulWidget {
  const DepartmentLogo({super.key});

  @override
  State<DepartmentLogo> createState() => _DepartmentLogoState();
}

class _DepartmentLogoState extends State<DepartmentLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 3.h , bottom: 2.5.h),
          child: SizedBox(
            height: 20.h,
             child: Image.asset("images/department_logo.png"),
          ),
        ),
      ],
    );
  }
}