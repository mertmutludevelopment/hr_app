import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/manager_notification_screen/view_model/manager_notification_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class DescriptionInput extends StatefulWidget {
  const DescriptionInput({super.key});

  @override
  State<DescriptionInput> createState() => _DescriptionInputState();
}

class _DescriptionInputState extends State<DescriptionInput> {
  final managerNotificationScreenViewModel = locator<ManagerNotificationScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 22.5.h,
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: managerNotificationScreenViewModel.notificationDescriptionTextController,
              decoration: const InputDecoration(
                hintText: "Notification Note",
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