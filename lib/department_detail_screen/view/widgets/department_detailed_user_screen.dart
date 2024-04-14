import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/department_detail_screen/view_model/department_detail_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class DepartmentDetaildeUserScreen extends StatefulWidget {
  final String userDepartment;

  const DepartmentDetaildeUserScreen({super.key, required this.userDepartment});

  @override
  State<DepartmentDetaildeUserScreen> createState() =>
      _DepartmentDetaildeUserScreenState();
}

class _DepartmentDetaildeUserScreenState
    extends State<DepartmentDetaildeUserScreen> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final departmentDetailScreenViewModel =
      locator<DepartmentDetailScreenViewModel>();

  bool isFirstTime = true;

  @override
  void initState() {
    if (departmentDetailScreenViewModel.userList.isEmpty) {
      departmentDetailScreenViewModel.getAllUsers(widget.userDepartment);
      isFirstTime = false;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirstTime) {
      setState(() {
        departmentDetailScreenViewModel.userList.clear();
        departmentDetailScreenViewModel.getAllUsers(widget.userDepartment);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          height: 72.h,
          child: Observer(builder: (_) {
            if (departmentDetailScreenViewModel.userList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(1000, 241, 0, 77)),
                ),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: departmentDetailScreenViewModel.userList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                      child: ListTile(
                        title: Text(
                          departmentDetailScreenViewModel
                              .userList[index].fullname,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                                "+90 ${departmentDetailScreenViewModel.userList[index].phoneNumber}",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center),
                            Text(
                                departmentDetailScreenViewModel
                                    .userList[index].email,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
        )
      ],
    );
  }
}
