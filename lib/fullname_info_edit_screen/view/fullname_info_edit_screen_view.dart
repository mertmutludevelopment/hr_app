import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/fullname_info_edit_screen/view/widgets/fullname_logo.dart';
import 'package:hr_app/fullname_info_edit_screen/view/widgets/get_new_fullname_screen.dart';
import 'package:hr_app/fullname_info_edit_screen/view/widgets/update_fullname_button.dart';
import 'package:sizer/sizer.dart';

class FullnameInfoEditScreenView extends StatefulWidget {
  const FullnameInfoEditScreenView({super.key});

  @override
  State<FullnameInfoEditScreenView> createState() => _FullnameInfoEditScreenViewState();
}

class _FullnameInfoEditScreenViewState extends State<FullnameInfoEditScreenView> {
  
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
            FullnameLogo(),
            GetNewFullnameScreen(),
            UpdateFullnameButton(),
          ],
        ),
      ),
    );
  }
}