import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class PhoneNumberInputArea extends StatefulWidget {
  const PhoneNumberInputArea({super.key});

  @override
  State<PhoneNumberInputArea> createState() => _PhoneNumberInputAreaState();
}

class _PhoneNumberInputAreaState extends State<PhoneNumberInputArea> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Observer(
          builder: (_) {
            return IntlPhoneField(
              controller: signupScreenViewModel.phonenumberTextController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
              initialCountryCode: 'TR',
            );
          },
        ),
      ],
    );
  }
}
