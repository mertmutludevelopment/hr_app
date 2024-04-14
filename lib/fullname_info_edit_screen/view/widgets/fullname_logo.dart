import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FullnameLogo extends StatefulWidget {
  const FullnameLogo({super.key});

  @override
  State<FullnameLogo> createState() => _FullnameLogoState();
}

class _FullnameLogoState extends State<FullnameLogo> {
  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 3.h , bottom: 2.5.h),
          child: SizedBox(
            height: 20.h,
             child: Image.asset("images/robot_face_logo.png"),
          ),
        ),
      ],
    );
  }
}