import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/department_info_edit_screen/view_model/department_info_edit_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class UpdateDepartmentButton extends StatefulWidget {
  const UpdateDepartmentButton({super.key});

  @override
  State<UpdateDepartmentButton> createState() => _UpdateDepartmentButtonState();
}

class _UpdateDepartmentButtonState extends State<UpdateDepartmentButton> {
    final loginScreenViewModel = locator<LoginScreenViewModel>();
  final departmentInfoEditScreenViewModel = locator<DepartmentInfoEditScreenViewModel>();

  TextEditingController departmentController = TextEditingController();

  @override
  void didChangeDependencies() {
    departmentController = departmentInfoEditScreenViewModel.getNewDepartmentcontroller();

    super.didChangeDependencies();
  }

  

  void _showEmptyFieldsAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content: const Text("Department field cannot be left blank."),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Observer(
            builder: (_) {
              return ElevatedButton(
                  onPressed: () async {
                    if (departmentController.text.isNotEmpty) {
                      await departmentInfoEditScreenViewModel.changeDepartment(
                          loginScreenViewModel.user!.id,
                          departmentController.text.toString());

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Department successfully changed! New Department : ${departmentController.text}'),
                          duration: const Duration(
                              seconds: 4), 
                        ),
                      );

                      Get.toNamed(AppRoutes.LOGIN_SCREEN_PATH);
                    } else {
                      _showEmptyFieldsAlert();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 8.h),
                      backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text("Change Department"));
            },
          ),
        ),
      ],
    );
  }
}