import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/notification_screen/view_model/notification_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class NotificationMenuScreen extends StatefulWidget {
  const NotificationMenuScreen({super.key});

  @override
  State<NotificationMenuScreen> createState() => _NotificationMenuScreenState();
}

class _NotificationMenuScreenState extends State<NotificationMenuScreen> {
  final notificationScreenViewModel = locator<NotificationScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  int? notifysListOldLength;
  @override
  void initState() {
    super.initState();
    if (notificationScreenViewModel.notificationsListByUser.isEmpty) {
      notificationScreenViewModel
          .getNotificationsListByUser(loginScreenViewModel.user!.id);
      notifysListOldLength =
          notificationScreenViewModel.notificationsListByUser.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (notifysListOldLength !=
        notificationScreenViewModel.notificationsListByUser.length) {
      setState(() {
        notificationScreenViewModel.notificationsListByUser.clear();
        notificationScreenViewModel
            .getNotificationsListByUser(loginScreenViewModel.user!.id);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        SizedBox(
            height: 76.h,
            child: Observer(
              builder: (_) {
                if (notificationScreenViewModel
                    .notificationsListByUser.isEmpty) {
                  return Center(
                    child: Text(
                      'No notification',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: notificationScreenViewModel
                          .notificationsListByUser.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          height: 24.h,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.5.h),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 1.5.h, left: 2.h, right: 2.h),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: () {
                                            setState(() async {
                                              await notificationScreenViewModel
                                                  .removeNotification(
                                                      notificationScreenViewModel
                                                          .notificationsListByUser[
                                                              index]
                                                          .id);
                                              notificationScreenViewModel
                                                  .notificationsListByUser
                                                  .clear();
                                              notificationScreenViewModel
                                                  .getNotificationsListByUser(
                                                      loginScreenViewModel
                                                          .user!.id);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: Text(
                                        notificationScreenViewModel
                                            .notificationsListByUser[index]
                                            .notificationDescription,
                                        style: TextStyle(
                                            fontSize: 13.0.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.h),
                                          child: Text(
                                            "~${notificationScreenViewModel.notificationsListByUser[index].notificationSenderFullname} / ${notificationScreenViewModel.notificationsListByUser[index].notificationSenderDepartment}",
                                            style: TextStyle(
                                                fontSize: 12.0.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                }
              },
            ))
      ],
    );
  }
}
