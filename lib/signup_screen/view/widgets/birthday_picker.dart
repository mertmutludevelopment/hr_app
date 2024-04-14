// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class BirthdayPicker extends StatefulWidget {
  const BirthdayPicker({super.key});

  @override
  State<BirthdayPicker> createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Observer( builder: (_){
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 8.h),
                backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () async {
              var datePicked = await DatePicker.showSimpleDatePicker(
                context,
                initialDate: DateTime(2001),
                firstDate: DateTime(1930),
                lastDate: DateTime(2025),
                dateFormat: "dd-MMMM-yyyy",
                locale: DateTimePickerLocale.en_us,
                looping: false,
        
                
              );
                signupScreenViewModel.selectedBirthDay = datePicked?.day;
                signupScreenViewModel.selectedBirthMonth = datePicked?.month;
                signupScreenViewModel.selectedBirthYear = datePicked?.year;
              
              
              if (datePicked != null) {
                setState(() {
                  _selectedDate = datePicked;
                });
              }
              
            },
            child: _selectedDate != null
                ? Text(
                    "Selected Date : ${signupScreenViewModel.selectedBirthDay}-${signupScreenViewModel.selectedBirthMonth}-${signupScreenViewModel.selectedBirthYear}")
                : const Text("Select Date of Birth"),
          );},
        ),
      ],
    );
  }
}
