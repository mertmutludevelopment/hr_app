import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        //Api ile buraya günün motivasyon sözünü ekle
        SizedBox(
          height: 75.h,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: GestureDetector(
                  onTap: () {
                    if (loginScreenViewModel.user!.department ==
                        "Human Resources") {
                      Get.toNamed(AppRoutes.MANAGER_EVENTS_SCREEN_PATH);
                    } else {
                      Get.toNamed(AppRoutes.EVENTS_SCREEN_PATH);
                    }
                  },
                  child: Card(
                      color: Colors.white38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Events",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(
                                height: 10.h,
                                child: Image.asset(
                                    "images/events_logo-removebg.png")),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.LEAVE_REQUEST_SCREEN_PATH);
                  },
                  child: Card(
                      color: Colors.white38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Leave Request",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(
                                height: 10.h,
                                child: Image.asset(
                                    "images/leave_req_logo-removebg.png")),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.DEPARTMENT_SCREEN_PATH);
                  },
                  child: Card(
                      color: Colors.white38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Departments",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(
                                height: 10.h,
                                child: Image.asset(
                                    "images/departments_logo-removebg.png")),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: GestureDetector(
                  onTap: (){
                    if (loginScreenViewModel.user!.department ==
                        "Human Resources") {
                      Get.toNamed(AppRoutes.MANAGER_ADVANCE_PAYMENT_SCREEN_PATH);
                    } else {
                    Get.toNamed(AppRoutes.ADVANCE_PAYMENT_SCREEN_PATH);
                    }
                  },
                  child: Card(
                      color: Colors.white38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Advance Payment",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(
                                height: 10.h,
                                child: Image.asset(
                                    "images/advance_payment_logo-removebg.png")),
                          ],
                        ),
                      )),
                ),
              ),
              Visibility(
                visible: loginScreenViewModel.user!.department != "Human Resources",
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.5.h),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.TASK_MANAGER_SCREEN_PATH);
                    },
                    child: Card(
                        color: Colors.white38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tasks",
                                style: TextStyle(fontSize: 15.sp), 
                              ),
                              SizedBox(
                                  height: 10.h,
                                  child: Image.asset(
                                      "images/task_icon.png")),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
