import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/department_info_edit_screen/view/widgets/department_logo.dart';
import 'package:hr_app/department_info_edit_screen/view/widgets/get_new_department_screen.dart';
import 'package:hr_app/department_info_edit_screen/view/widgets/update_department_button.dart';
import 'package:sizer/sizer.dart';

class DepartmentInfoEditScreenView extends StatefulWidget {
  const DepartmentInfoEditScreenView({super.key});

  @override
  State<DepartmentInfoEditScreenView> createState() => _DepartmentInfoEditScreenViewState();
}

class _DepartmentInfoEditScreenViewState extends State<DepartmentInfoEditScreenView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );

  }

   AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Edit Your Info's",
        style: TextStyle(fontWeight: FontWeight.bold ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget buildBody(){
    return Padding(
      padding:  EdgeInsets.all(2.h),
      child:  const SingleChildScrollView(
        child:  Column(
          children: [
            DepartmentLogo(),
            GetNewDepartmentScreen(),
            UpdateDepartmentButton(),
          ],
        ),
      ),
    );
  }
}