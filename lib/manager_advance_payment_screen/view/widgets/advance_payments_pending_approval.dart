import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/manager_advance_payment_screen/view_model/manager_advance_payment_screen_view_model.dart';
import 'package:hr_app/manager_notification_screen/view_model/manager_notification_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class AdvancePaymentsPendingApproval extends StatefulWidget {
  const AdvancePaymentsPendingApproval({super.key});

  @override
  State<AdvancePaymentsPendingApproval> createState() =>
      _AdvancePaymentsPendingApprovalState();
}

class _AdvancePaymentsPendingApprovalState
    extends State<AdvancePaymentsPendingApproval> {
  final managerAdvancePaymentScreenViewModel =
      locator<ManagerAdvancePaymentScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final managerNotificationScreenViewModel =
      locator<ManagerNotificationScreenViewModel>();

  int? advancePaymentByUserOldLength;

  @override
  void initState() {
    super.initState();
    if (managerAdvancePaymentScreenViewModel.allAdvancePaymentList.isEmpty) {
      managerAdvancePaymentScreenViewModel.getAllAdvancePaymentsList();
      advancePaymentByUserOldLength =
          managerAdvancePaymentScreenViewModel.allAdvancePaymentList.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (advancePaymentByUserOldLength !=
        managerAdvancePaymentScreenViewModel.allAdvancePaymentList.length) {
      setState(() {
        managerAdvancePaymentScreenViewModel.allAdvancePaymentList.clear();
        managerAdvancePaymentScreenViewModel.getAllAdvancePaymentsList();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 3.5.h),
          child: Text(
            "Pending requests for approval",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 68.h,
          child: Observer(
            builder: (_) {
              if (managerAdvancePaymentScreenViewModel
                  .allAdvancePaymentList.isEmpty) {
                return Center(
                  child: Text(
                    'No advance requests awaiting approval.',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: managerAdvancePaymentScreenViewModel
                        .allAdvancePaymentList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 24.h,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 1.5.h),
                          child: Dismissible(
                            key: Key(managerAdvancePaymentScreenViewModel
                                .allAdvancePaymentList[index].id
                                .toString()),
                            onDismissed: (direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                bool isApproved =
                                    await managerAdvancePaymentScreenViewModel
                                        .createNewApprovedAdvancePayment(
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .advanceAmount,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .startDay,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .startMonth,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .startYear,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .endDay,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .endMonth,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .endYear,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .userId,
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .fullname);

                                if (isApproved) {
                                  setState(() async {
                                    await managerNotificationScreenViewModel
                                        .createNewNotification(
                                            "Your advance payment request is approved. You can get your money from accounting",
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .userId,
                                            loginScreenViewModel.user!.id,
                                            loginScreenViewModel.user!.fullname,
                                            loginScreenViewModel
                                                .user!.department);

                                    await managerAdvancePaymentScreenViewModel
                                        .removeAdvancePayment(
                                            managerAdvancePaymentScreenViewModel
                                                .allAdvancePaymentList[index]
                                                .id);

                                    managerAdvancePaymentScreenViewModel
                                        .allAdvancePaymentList
                                        .clear();
                                    managerAdvancePaymentScreenViewModel
                                        .getAllAdvancePaymentsList();
                                  });
                                }
                              } else if (direction ==
                                  DismissDirection.endToStart) {
                                setState(() async {
                                  await managerNotificationScreenViewModel
                                      .createNewNotification(
                                          "Your advance payment request is declined!",
                                          managerAdvancePaymentScreenViewModel
                                              .allAdvancePaymentList[index]
                                              .userId,
                                          loginScreenViewModel.user!.id,
                                          loginScreenViewModel.user!.fullname,
                                          loginScreenViewModel
                                              .user!.department);

                                  await managerAdvancePaymentScreenViewModel
                                      .removeAdvancePayment(
                                          managerAdvancePaymentScreenViewModel
                                              .allAdvancePaymentList[index].id);

                                  managerAdvancePaymentScreenViewModel
                                      .allAdvancePaymentList
                                      .clear();
                                  managerAdvancePaymentScreenViewModel
                                      .getAllAdvancePaymentsList();
                                });
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
                              elevation: 8,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.5.h),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 1.h),
                                      child: Text(
                                        managerAdvancePaymentScreenViewModel
                                            .allAdvancePaymentList[index]
                                            .fullname,
                                        style: TextStyle(
                                            fontSize: 11.0.sp,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 1.h),
                                      child: Text(
                                        "Last installment date : ${managerAdvancePaymentScreenViewModel.allAdvancePaymentList[index].endDay}.${managerAdvancePaymentScreenViewModel.allAdvancePaymentList[index].endMonth}.${managerAdvancePaymentScreenViewModel.allAdvancePaymentList[index].endYear}",
                                        style: TextStyle(
                                            fontSize: 11.0.sp,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 1.h),
                                      child: Text(
                                        "Advance amount : ${managerAdvancePaymentScreenViewModel.allAdvancePaymentList[index].advanceAmount} TL",
                                        style: TextStyle(
                                            fontSize: 11.0.sp,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
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
            },
          ),
        ),
      ],
    );
  }
}
