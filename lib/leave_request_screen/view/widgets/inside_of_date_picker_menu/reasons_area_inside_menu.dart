import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class ReasonsAreaInsideMenu extends StatefulWidget {
  const ReasonsAreaInsideMenu({super.key});

  @override
  State<ReasonsAreaInsideMenu> createState() => _ReasonsAreaInsideMenuState();
}

class _ReasonsAreaInsideMenuState extends State<ReasonsAreaInsideMenu> {
  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();

  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
      child: Column(
        children: [
          Observer(builder: (_) {
            return TextField(
              controller: leaveRequestScreenViewModel.reasonTextController,
              decoration: const InputDecoration(
                hintText: " Type your Reason for leave",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
              textAlign: TextAlign.center,
            );
          }),
        ],
      ),
    );
  }
}
