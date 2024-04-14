import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhoneLogo extends StatefulWidget {
  const PhoneLogo({super.key});

  @override
  State<PhoneLogo> createState() => _PhoneLogoState();
}

class _PhoneLogoState extends State<PhoneLogo> {
  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 3.h , bottom: 2.5.h),
          child: SizedBox(
            height: 20.h,
             child: Image.asset("images/phone_number_logo.png"),
          ),
        ),
      ],
    );
  }
}