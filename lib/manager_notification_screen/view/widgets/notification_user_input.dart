import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/manager_notification_screen/view_model/manager_notification_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class NotificationUserInput extends StatefulWidget {
  const NotificationUserInput({super.key});

  @override
  State<NotificationUserInput> createState() => _NotificationUserInputState();
}

class _NotificationUserInputState extends State<NotificationUserInput> {
 final managerNotificationScreenViewModel = locator<ManagerNotificationScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 2.5.h,
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: managerNotificationScreenViewModel.notificationUserTextController,
              decoration: const InputDecoration(
                hintText: "Notification User",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
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