import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class ManagerDeclinedScreen extends StatefulWidget {
  const ManagerDeclinedScreen({super.key});

  @override
  State<ManagerDeclinedScreen> createState() => _ManagerDeclinedScreenState();
}

class _ManagerDeclinedScreenState extends State<ManagerDeclinedScreen> {
  
  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();

  int? alldeclinedLeavesListOldLength;

  @override
  void initState() {
    super.initState();
    if (leaveRequestScreenViewModel.allDeclinedLeavesList.isEmpty) {
      leaveRequestScreenViewModel.getAllDeclinedLeavesList();
      alldeclinedLeavesListOldLength =
          leaveRequestScreenViewModel.allDeclinedLeavesList.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (alldeclinedLeavesListOldLength !=
        leaveRequestScreenViewModel.allDeclinedLeavesList.length) {
      setState(() {
        leaveRequestScreenViewModel.allDeclinedLeavesList.clear();
        leaveRequestScreenViewModel.getAllDeclinedLeavesList();
      });
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                SizedBox(height: 3.5.h),
        SizedBox(
          height: 60.h,
          child: Observer(builder: (_) {
            if (leaveRequestScreenViewModel.allDeclinedLeavesList.isEmpty) {
              return Center(
                child: Text(
                  'No declined leaves.',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount:
                      leaveRequestScreenViewModel.allDeclinedLeavesList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 26.h,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h),
                        child: Card(
                          elevation: 8,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), 
                              side: BorderSide(
                                color: Colors.red,
                                width: 0.05.h,
                            ),
                          ),
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
                                        .allDeclinedLeavesList[index].fullname,
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
                                    " Reason for requesting leave : ${leaveRequestScreenViewModel.allDeclinedLeavesList[index].reason} ",
                                    style: TextStyle(
                                        fontSize: 11.0.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  child: Text(
                                    "Leave dates : ${
                                      leaveRequestScreenViewModel.allDeclinedLeavesList[index].startLeaveDay}.${
                                        leaveRequestScreenViewModel.allDeclinedLeavesList[index].startLeaveMonth}.${
                                          leaveRequestScreenViewModel.allDeclinedLeavesList[index].startLeaveYear} - ${
                                            leaveRequestScreenViewModel.allDeclinedLeavesList[index].endLeaveDay}.${
                                              leaveRequestScreenViewModel.allDeclinedLeavesList[index].endLeaveMonth}.${
                                                leaveRequestScreenViewModel.allDeclinedLeavesList[index].endLeaveYear}",
                                    style: TextStyle(
                                        fontSize: 11.0.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  "Days off : ${leaveRequestScreenViewModel.allDeclinedLeavesList[index].numberOfLeaveDay} day",
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
                    );
                  });
            }
          }),
        )
      ],
    );
  }
}