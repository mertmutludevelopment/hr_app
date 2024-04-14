import 'package:flutter/material.dart';
import 'package:hr_app/leave_request_screen/view/widgets/inside_of_date_picker_menu/reasons_area_inside_menu.dart';
import 'package:hr_app/leave_request_screen/view/widgets/inside_of_date_picker_menu/selected_date_area_inside_menu.dart';
import 'package:hr_app/leave_request_screen/view/widgets/inside_of_date_picker_menu/submit_button_inside_menu.dart';
import 'package:sizer/sizer.dart';

class DateRangePickerMenu extends StatefulWidget {
  const DateRangePickerMenu({super.key});

  @override
  State<DateRangePickerMenu> createState() => _DateRangePickerMenuState();
}

class _DateRangePickerMenuState extends State<DateRangePickerMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 2.5.h),
          const SelectedDateAreaInsideMenu(),
          const ReasonsAreaInsideMenu(),
          const SubmitButtonInsideMenu(),
        ],
      ),
    );
  }
}
