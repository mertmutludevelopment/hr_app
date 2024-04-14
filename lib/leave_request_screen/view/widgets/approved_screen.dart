import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class ApprovedScreen extends StatefulWidget {
  const ApprovedScreen({super.key});

  @override
  State<ApprovedScreen> createState() => _ApprovedScreenState();
}

class _ApprovedScreenState extends State<ApprovedScreen> {

  final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  int? approvedLeavesListByUserOldLength;

  @override
  void initState() {
    super.initState();
    if (leaveRequestScreenViewModel.approvedLeavesListByUser.isEmpty) {
      leaveRequestScreenViewModel
          .getApprovedListLeavesByUser(loginScreenViewModel.user!.id);
      approvedLeavesListByUserOldLength =
          leaveRequestScreenViewModel.approvedLeavesListByUser.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (approvedLeavesListByUserOldLength !=
        leaveRequestScreenViewModel.approvedLeavesListByUser.length) {
      setState(() {
        leaveRequestScreenViewModel.approvedLeavesListByUser.clear();
        leaveRequestScreenViewModel
            .getApprovedListLeavesByUser(loginScreenViewModel.user!.id);
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
            if(leaveRequestScreenViewModel.approvedLeavesListByUser.isEmpty){
              return Center(
                child: Text(
                'No approved requests.',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              );
            }else{
             
            return ListView.builder(
                itemCount: leaveRequestScreenViewModel.approvedLeavesListByUser.length,
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
                                    .approvedLeavesListByUser[index].reason} " ,
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
                                    .approvedLeavesListByUser[index].startLeaveDay}.${
                                      leaveRequestScreenViewModel
                                    .approvedLeavesListByUser[index].startLeaveMonth}.${
                                      leaveRequestScreenViewModel
                                    .approvedLeavesListByUser[index].startLeaveYear} - ${
                                      leaveRequestScreenViewModel
                                    .approvedLeavesListByUser[index].endLeaveDay}.${
                                      leaveRequestScreenViewModel
                                    .approvedLeavesListByUser[index].endLeaveMonth}.${
                                      leaveRequestScreenViewModel
                                    .approvedLeavesListByUser[index].endLeaveYear}",
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w500),
                                ),
                              ),

                               Text(
                                  "Days off : ${
                                    leaveRequestScreenViewModel.approvedLeavesListByUser[index].numberOfLeaveDay} day",
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
