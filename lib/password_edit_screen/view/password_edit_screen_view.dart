import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/password_edit_screen/view/widgets/change_password_input.dart';
import 'package:hr_app/password_edit_screen/view/widgets/password_logo.dart';
import 'package:hr_app/password_edit_screen/view/widgets/update_password_button.dart';
import 'package:sizer/sizer.dart';

class PasswordEditScreenView extends StatefulWidget {
  const PasswordEditScreenView({super.key});

  @override
  State<PasswordEditScreenView> createState() => _PasswordEditScreenViewState();
}

class _PasswordEditScreenViewState extends State<PasswordEditScreenView> {
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
        style: TextStyle(fontWeight: FontWeight.bold),
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

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            PasswordLogo(),
            ChangePasswordInput(),
            UpdatePasswordButton(),
          ],
        ),
      ),
    );
  }
}
