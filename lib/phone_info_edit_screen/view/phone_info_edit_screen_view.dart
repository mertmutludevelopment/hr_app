import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/phone_info_edit_screen/view/widgets/get_new_phone_number_screen.dart';
import 'package:hr_app/phone_info_edit_screen/view/widgets/phone_logo.dart';
import 'package:hr_app/phone_info_edit_screen/view/widgets/update_phone_number_button.dart';
import 'package:sizer/sizer.dart';

class PhoneInfoEditScreenView extends StatefulWidget {
  const PhoneInfoEditScreenView({super.key});

  @override
  State<PhoneInfoEditScreenView> createState() => _PhoneInfoEditScreenViewState();
}

class _PhoneInfoEditScreenViewState extends State<PhoneInfoEditScreenView> {
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
            PhoneLogo(),
            GetNewPhoneNumberScreen(),
            UpdatePhoneNumberButton(),
          ],
        ),
      ),
    );
  }
  
}