import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/department_info_edit_screen/view_model/department_info_edit_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class GetNewDepartmentScreen extends StatefulWidget {
  const GetNewDepartmentScreen({super.key});

  @override
  State<GetNewDepartmentScreen> createState() => _GetNewDepartmentScreenState();
}

class _GetNewDepartmentScreenState extends State<GetNewDepartmentScreen> {
final loginScreenViewModel = locator<LoginScreenViewModel>();
  final departmentInfoEditScreenViewModel = locator<DepartmentInfoEditScreenViewModel>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5.h),
          child: Text(
            "Type your new department",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: departmentInfoEditScreenViewModel.newDepartmentTextController,
              decoration:  InputDecoration(
                hintText: " Your old department : ${loginScreenViewModel.user!.department}",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ],
    );
  }
}