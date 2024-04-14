import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class SelectedDateAreaInsideMenu extends StatefulWidget {
  const SelectedDateAreaInsideMenu({super.key});

  @override
  State<SelectedDateAreaInsideMenu> createState() =>
      _SelectedDateAreaInsideMenuState();
}

class _SelectedDateAreaInsideMenuState
    extends State<SelectedDateAreaInsideMenu> {
  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2024, 02, 15),
    end: DateTime(2024, 02, 15),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Your remaining vacation days : ",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        (loginScreenViewModel.user!.leaveDay -
                                difference.inDays)
                            .toString(),
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Select vacation dates :",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 10.h,
                  width: 25.w,
                  child: ElevatedButton(
                    onPressed: pickDateRange,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Icon(Icons.calendar_month_outlined),
                    //Text("${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selected Dates : ${start.day}.${start.month}.${start.year} - ${end.day}.${end.month}.${end.year}",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Number of selected dates : ",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Text(
                    "${difference.inDays} ",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      // initialDateRange: dateRange,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.white, // Change primary color

            colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(1000, 241, 0, 77)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (newDateRange == null) return;

    int daysDifference = newDateRange.duration.inDays;

    setState(() {
      dateRange = newDateRange;
      leaveRequestScreenViewModel.startLeaveDay = newDateRange.start.day;
      leaveRequestScreenViewModel.startLeaveMonth = newDateRange.start.month;
      leaveRequestScreenViewModel.startLeaveYear = newDateRange.start.year;

      leaveRequestScreenViewModel.endLeaveDay = newDateRange.end.day;
      leaveRequestScreenViewModel.endLeaveMonth = newDateRange.end.month;
      leaveRequestScreenViewModel.endLeaveYear = newDateRange.end.year;

      leaveRequestScreenViewModel.numberOfLeaveDay = daysDifference;
    });
  }
}
