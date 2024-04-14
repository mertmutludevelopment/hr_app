import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class SubmitButtonInsideMenu extends StatefulWidget {
  const SubmitButtonInsideMenu({super.key});

  @override
  State<SubmitButtonInsideMenu> createState() => _SubmitButtonInsideMenuState();
}

class _SubmitButtonInsideMenuState extends State<SubmitButtonInsideMenu> {
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();

  

  TextEditingController reasonController = TextEditingController();

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content: const Text("Please enter all the information correctly."),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reasonController = leaveRequestScreenViewModel.getReasonController();
  }

   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Column(
        children: [
          Observer(builder: (_) {
            return ElevatedButton(
                onPressed: () async {
                  if (reasonController.text.isNotEmpty &&
                      loginScreenViewModel.user!.leaveDay >=
                          leaveRequestScreenViewModel.numberOfLeaveDay!) {
                    await leaveRequestScreenViewModel.createNewPendingLeave(
                        reasonController.text.toString(),
                        leaveRequestScreenViewModel.startLeaveDay!,
                        leaveRequestScreenViewModel.startLeaveMonth!,
                        leaveRequestScreenViewModel.startLeaveYear!,
                        leaveRequestScreenViewModel.endLeaveDay!,
                        leaveRequestScreenViewModel.endLeaveMonth!,
                        leaveRequestScreenViewModel.endLeaveYear!,
                        leaveRequestScreenViewModel.numberOfLeaveDay!,
                        loginScreenViewModel.user!.id,
                        loginScreenViewModel.user!.fullname);

                    leaveRequestScreenViewModel.changeLeaveDay(
                        loginScreenViewModel.user!.id,
                        (loginScreenViewModel.user!.leaveDay -
                            leaveRequestScreenViewModel.numberOfLeaveDay!));

                    loginScreenViewModel.user!.leaveDay =
                        loginScreenViewModel.user!.leaveDay -
                            leaveRequestScreenViewModel.numberOfLeaveDay!;

                    reasonController.clear();

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Your leave request has been successfully created'),
                        duration: Duration(seconds: 4),
                      ),
                    );
                    
                  } else {
                    _showAlert();
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 8.h),
                    backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text("Submit"));
          }),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}
