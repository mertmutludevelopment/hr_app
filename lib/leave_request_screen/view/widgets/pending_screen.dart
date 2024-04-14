import 'package:flutter/material.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  int? pendingLeavesListByUserOldLength;

  @override
  void initState() {
    super.initState();
    if (leaveRequestScreenViewModel.pendingLeavesListByUser.isEmpty) {
      leaveRequestScreenViewModel
          .getPendingListLeavesByUser(loginScreenViewModel.user!.id);
      pendingLeavesListByUserOldLength =
          leaveRequestScreenViewModel.pendingLeavesListByUser.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (pendingLeavesListByUserOldLength !=
        leaveRequestScreenViewModel.pendingLeavesListByUser.length) {
      setState(() {
        leaveRequestScreenViewModel.pendingLeavesListByUser.clear();
        leaveRequestScreenViewModel
            .getPendingListLeavesByUser(loginScreenViewModel.user!.id);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.5.h,
        ),
        
        SizedBox(
          height: 60.h,
          child: Observer(builder: (_) {
            if(leaveRequestScreenViewModel.pendingLeavesListByUser.isEmpty){
              return Center(
                child: Text(
                'No pending requests.',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              );
            }else{
             
            return ListView.builder(
                itemCount: leaveRequestScreenViewModel.pendingLeavesListByUser.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 1.5.h),
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding:  EdgeInsets.all(1.5.h),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top : 1.h ,bottom: 1.h),
                                child: Text(" Reason for requesting leave : ${leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].reason} " ,
                                style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(bottom: 1.h),
                                child: Text(
                                  "Leave dates : ${
                                    leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].startLeaveDay}.${
                                      leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].startLeaveMonth}.${
                                      leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].startLeaveYear} - ${
                                      leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].endLeaveDay}.${
                                      leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].endLeaveMonth}.${
                                      leaveRequestScreenViewModel
                                    .pendingLeavesListByUser[index].endLeaveYear}",
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w500),
                                ),
                              ),

                               Text(
                                  "Days off : ${
                                    leaveRequestScreenViewModel.pendingLeavesListByUser[index].numberOfLeaveDay} day",
                                style: TextStyle(
                                  fontSize: 11.0.sp,
                                  fontWeight: FontWeight.w500),
                                ),
                                
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });}
          }),
        ),
      ],
    );
  }
}
