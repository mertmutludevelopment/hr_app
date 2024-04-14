import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/phone_info_edit_screen/view_model/phone_info_edit_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class GetNewPhoneNumberScreen extends StatefulWidget {
  const GetNewPhoneNumberScreen({super.key});

  @override
  State<GetNewPhoneNumberScreen> createState() => _GetNewPhoneNumberScreenState();
}

class _GetNewPhoneNumberScreenState extends State<GetNewPhoneNumberScreen> {
  final phoneInfoEditScreenViewModel = locator<PhoneInfoEditScreenViewModel>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5.h),
          child: Text(
            "Type your new phone number",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Observer(
          builder: (_) {
            return IntlPhoneField(
              controller: phoneInfoEditScreenViewModel.newPhoneNumberTextController,
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