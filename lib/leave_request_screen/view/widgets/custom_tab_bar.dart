import 'package:flutter/material.dart';
import 'package:hr_app/atomic_widgets/error_screen/error_screen.dart';
import 'package:hr_app/leave_request_screen/view/widgets/approved_screen.dart';
import 'package:hr_app/leave_request_screen/view/widgets/date_range_picker_menu.dart';
import 'package:hr_app/leave_request_screen/view/widgets/declined_screen.dart';
import 'package:hr_app/leave_request_screen/view/widgets/manager_approved_screen.dart';
import 'package:hr_app/leave_request_screen/view/widgets/manager_declined_screen.dart';
import 'package:hr_app/leave_request_screen/view/widgets/manager_pending_screen.dart';
import 'package:hr_app/leave_request_screen/view/widgets/pending_screen.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  List<String> tabBarItems = [
    "Leave Request",
    "Pending",
    "Approved",
    "Declined"
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 2.5.h),
        SizedBox(
          height: 10.h,
          width: double.infinity,
          child: Center(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: tabBarItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(.5.h),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 26.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                                color: current == index
                                    ? const Color.fromARGB(1000, 241, 0, 77)
                                    : Colors.white,
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: current == index
                                    ? null
                                    : Border.all(
                                        color: const Color.fromARGB(
                                            1000, 241, 0, 77),
                                        width: .2.w)),
                            child: Center(
                              child: Text(
                                tabBarItems[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.black
                                        : const Color.fromARGB(
                                            255, 104, 104, 104)),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: current == index,
                          child: Padding(
                            padding: EdgeInsets.only(top: .5.h),
                            child: Container(
                              width: .5.h,
                              height: .5.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(1000, 241, 0, 77)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
        SizedBox(
          height: 72.h,
          child: getPageContent(current),
        )
      ],
    );
  }

  Widget getPageContent(int index) {
    switch (index) {
      case 0:
        return const DateRangePickerMenu();
      case 1:
        if (loginScreenViewModel.user!.department == "Human Resources") {
          return const ManagerPendingScreen();
        } else {
          return const PendingScreen();
        }
      case 2:
        if (loginScreenViewModel.user!.department == "Human Resources") {
          return const ManagerApprovedScreen();
        } else {
          return const ApprovedScreen();
        }
      case 3:
        if (loginScreenViewModel.user!.department == "Human Resources") {
          return const ManagerDeclinedScreen();
        } else {
          return const DeclinedScreen();
        }
      default:
        return const ErrorScreen();
    }
  }
}
