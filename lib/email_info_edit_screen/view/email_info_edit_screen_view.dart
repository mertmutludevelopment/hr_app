import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/email_info_edit_screen/view/widgets/get_new_email_screen.dart';
import 'package:hr_app/email_info_edit_screen/view/widgets/email_logo.dart';
import 'package:hr_app/email_info_edit_screen/view/widgets/update_email_button.dart';
import 'package:sizer/sizer.dart';

class EmailInfoEditScreenView extends StatefulWidget {
  const EmailInfoEditScreenView({super.key});

  @override
  State<EmailInfoEditScreenView> createState() => _EmailInfoEditScreenViewState();
}

class _EmailInfoEditScreenViewState extends State<EmailInfoEditScreenView> {
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
            EmailLogo(),
            GetNewEmailScreen(),
            UpdateEmailButton(),
          ],
        ),
      ),
    );
  }
}