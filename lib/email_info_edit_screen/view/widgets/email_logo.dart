import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmailLogo extends StatefulWidget {
  const EmailLogo({super.key});

  @override
  State<EmailLogo> createState() => _EmailLogoState();
}

class _EmailLogoState extends State<EmailLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 3.h , bottom: 2.5.h),
          child: SizedBox(
            height: 20.h,
             child: Image.asset("images/email_logo.png"),
          ),
        ),
      ],
    );
  }
}
