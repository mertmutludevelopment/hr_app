import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final profileScreenViewModel = locator<LoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Card(
          color: Colors.white38,
          child: ListTile(
            leading: const Icon(Icons.business_center_outlined),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                        profileScreenViewModel.user!.department);
                  },
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.DEPARTMENT_INFO_EDIT_SCREEN_PATH);
                }, icon: const Icon(Icons.edit_outlined)),
          ),
        ),
        Card(
          color: Colors.white38,
          child: ListTile(
            leading: const Icon(Icons.email_outlined),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                        profileScreenViewModel.user!.email);
                  },
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.EMAIL_INFO_EDIT_SCREEN_PATH);
                }, icon: const Icon(Icons.edit_outlined)),
          ),
        ),
        Card(
          color: Colors.white38,
          child: ListTile(
            leading: const Icon(Icons.phone_android_outlined),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                        profileScreenViewModel.user!.phoneNumber);
                  },
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.PHONE_INFO_EDIT_SCREEN_PATH);
                }, icon: const Icon(Icons.edit_outlined)),
          ),
        ),
        Card(
          color: Colors.white38,
          child: ListTile(
            leading: const Icon(Icons.location_city_outlined),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("**password**"),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.PASSWORD_EDIT_SCREEN_PATH);
                }, icon: const Icon(Icons.edit_outlined)),
          ),
        ),
        Card(
          color: Colors.white38,
          child: ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                        profileScreenViewModel.user!.fullname);
                  },
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.FULLNAME_INFO_EDIT_SCREEN_PATH);
                }, icon: const Icon(Icons.edit_outlined)),
          ),
        ),
      ],
    );
  }
}
