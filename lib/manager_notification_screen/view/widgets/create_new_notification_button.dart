import 'package:flutter/material.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/manager_notification_screen/view_model/manager_notification_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class CreateNewNotificationButton extends StatefulWidget {
  const CreateNewNotificationButton({super.key});

  @override
  State<CreateNewNotificationButton> createState() =>
      _CreateNewNotificationButtonState();
}

class _CreateNewNotificationButtonState
    extends State<CreateNewNotificationButton> {
  final managerNotificationScreenViewModel =
      locator<ManagerNotificationScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  TextEditingController notificationDescriptionController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    notificationDescriptionController = managerNotificationScreenViewModel
        .getNotificationDescriptionController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.5.h),
          child: ElevatedButton(
            onPressed: () async {
              if (notificationDescriptionController.text.isNotEmpty &&
                  managerNotificationScreenViewModel
                      .notificationUserTextController.text.isNotEmpty) {
                await managerNotificationScreenViewModel.createNewNotification(
                    notificationDescriptionController.text,
                    int.parse(managerNotificationScreenViewModel
                        .notificationUserTextController.text),
                    loginScreenViewModel.user!.id,
                    loginScreenViewModel.user!.fullname,
                    loginScreenViewModel.user!.department);

                managerNotificationScreenViewModel
                    .notificationDescriptionTextController
                    .clear();
                managerNotificationScreenViewModel
                    .notificationUserTextController
                    .clear();
              } else if (notificationDescriptionController.text.isNotEmpty &&
                  managerNotificationScreenViewModel
                      .notificationUserTextController.text.isEmpty) {
                await managerNotificationScreenViewModel.createNewNotification(
                    notificationDescriptionController.text,
                    null,
                    loginScreenViewModel.user!.id,
                    loginScreenViewModel.user!.fullname,
                    loginScreenViewModel.user!.department);

                managerNotificationScreenViewModel
                    .notificationDescriptionTextController
                    .clear();
                managerNotificationScreenViewModel
                    .notificationUserTextController
                    .clear();
              }
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 8.h),
                backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("Send new Notification"),
          ),
        ),
      ],
    );
  }
}
