import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/manager_notification_screen/view_model/manager_notification_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class ManagerPendingScreen extends StatefulWidget {
  const ManagerPendingScreen({super.key});

  @override
  State<ManagerPendingScreen> createState() => _ManagerPendingScreenState();
}

class _ManagerPendingScreenState extends State<ManagerPendingScreen> {
  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final managerNotificationScreenViewModel =
      locator<ManagerNotificationScreenViewModel>();

  int? allPendingLeavesListOldLength;

  @override
  void initState() {
    super.initState();
    if (leaveRequestScreenViewModel.pendingLeavesList.isEmpty) {
      leaveRequestScreenViewModel.getAllPendingLeavesList();
      allPendingLeavesListOldLength =
          leaveRequestScreenViewModel.pendingLeavesList.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (allPendingLeavesListOldLength !=
        leaveRequestScreenViewModel.pendingLeavesList.length) {
      setState(() {
        leaveRequestScreenViewModel.pendingLeavesList.clear();
        leaveRequestScreenViewModel.getAllPendingLeavesList();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 3.5.h),
        SizedBox(
          height: 60.h,
          child: Observer(builder: (_) {
            if (leaveRequestScreenViewModel.pendingLeavesList.isEmpty) {
              return Center(
                child: Text(
                  'No pending requests.',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount:
                      leaveRequestScreenViewModel.pendingLeavesList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 26.h,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h),
                        child: Dismissible(
                          key: Key(leaveRequestScreenViewModel
                              .pendingLeavesList[index].id
                              .toString()),
                          onDismissed: (direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              bool isApproved =
                                  await leaveRequestScreenViewModel
                                      .createNewApprovedLeave(
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].reason,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .startLeaveDay,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .startLeaveMonth,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .startLeaveYear,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .endLeaveDay,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .endLeaveMonth,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .endLeaveYear,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .numberOfLeaveDay,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].userId,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .fullname);

                              if (isApproved) {
                                setState(() async {
                                  await managerNotificationScreenViewModel
                                      .createNewNotification(
                                          "Your leave Request is approved. Have a nice holiday!",
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].userId,
                                          loginScreenViewModel.user!.id,
                                          loginScreenViewModel.user!.fullname,
                                          loginScreenViewModel
                                              .user!.department);

                                  await leaveRequestScreenViewModel
                                      .removePendingLeave(
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].id);
                                  leaveRequestScreenViewModel.pendingLeavesList
                                      .clear();
                                  leaveRequestScreenViewModel
                                      .getAllPendingLeavesList();
                                });

                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Request is approved'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Request is not approved'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            } else if (direction ==
                                DismissDirection.endToStart) {
                              bool isDeclined =
                                  await leaveRequestScreenViewModel
                                      .createNewDeclinedLeave(
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].reason,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .startLeaveDay,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .startLeaveMonth,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .startLeaveYear,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .endLeaveDay,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .endLeaveMonth,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .endLeaveYear,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .numberOfLeaveDay,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].userId,
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index]
                                              .fullname);

                              if (isDeclined) {
                                setState(() async {
                                  await managerNotificationScreenViewModel
                                      .createNewNotification(
                                          "Your leave Request is declined!",
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].userId,
                                          loginScreenViewModel.user!.id,
                                          loginScreenViewModel.user!.fullname,
                                          loginScreenViewModel
                                              .user!.department);

                                  await leaveRequestScreenViewModel
                                      .removePendingLeave(
                                          leaveRequestScreenViewModel
                                              .pendingLeavesList[index].id);
                                  leaveRequestScreenViewModel.pendingLeavesList
                                      .clear();
                                  leaveRequestScreenViewModel
                                      .getAllPendingLeavesList();
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Request is declined'),
                                    duration: Duration(seconds: 5),
                                  ),
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Request is not declined'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            }
                          },
                          background: Container(
                            color: Colors.transparent,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Icon(
                                Icons.check,
                                size: 5.5.h,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Icon(
                                Icons.close,
                                size: 5.5.h,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.all(1.5.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.h, bottom: 1.h),
                                    child: Text(
                                      leaveRequestScreenViewModel
                                          .pendingLeavesList[index].fullname,
                                      style: TextStyle(
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.h, bottom: 1.h),
                                    child: Text(
                                      " Reason for requesting leave : ${leaveRequestScreenViewModel.pendingLeavesList[index].reason} ",
                                      style: TextStyle(
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      "Leave dates : ${leaveRequestScreenViewModel.pendingLeavesList[index].startLeaveDay}.${leaveRequestScreenViewModel.pendingLeavesList[index].startLeaveMonth}.${leaveRequestScreenViewModel.pendingLeavesList[index].startLeaveYear} - ${leaveRequestScreenViewModel.pendingLeavesList[index].endLeaveDay}.${leaveRequestScreenViewModel.pendingLeavesList[index].endLeaveMonth}.${leaveRequestScreenViewModel.pendingLeavesList[index].endLeaveYear}",
                                      style: TextStyle(
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    "Days off : ${leaveRequestScreenViewModel.pendingLeavesList[index].numberOfLeaveDay} day",
                                    style: TextStyle(
                                        fontSize: 11.0.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
        )
      ],
    );
  }
}
