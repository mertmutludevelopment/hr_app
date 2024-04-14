import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/leave_request_screen/view_model/leave_request_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class DeclinedScreen extends StatefulWidget {
  const DeclinedScreen({super.key});

  @override
  State<DeclinedScreen> createState() => _DeclinedScreenState();
}

class _DeclinedScreenState extends State<DeclinedScreen> {

    final leaveRequestScreenViewModel = locator<LeaveRequestScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  int? declinedLeavesListByUserOldLength;

  @override
  void initState() {
    super.initState();
    if (leaveRequestScreenViewModel.declinedLeavesListByUser.isEmpty) {
      leaveRequestScreenViewModel
          .getDeclinedListLeavesByUser(loginScreenViewModel.user!.id);
      declinedLeavesListByUserOldLength =
          leaveRequestScreenViewModel.declinedLeavesListByUser.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (declinedLeavesListByUserOldLength !=
        leaveRequestScreenViewModel.declinedLeavesListByUser.length) {
      setState(() {
        leaveRequestScreenViewModel.declinedLeavesListByUser.clear();
        leaveRequestScreenViewModel
            .getDeclinedListLeavesByUser(loginScreenViewModel.user!.id);
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
            if(leaveRequestScreenViewModel.declinedLeavesListByUser.isEmpty){
              return Center(
                child: Text(
                'No declined requests.',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              );
            }else{
             
            return ListView.builder(
                itemCount: leaveRequestScreenViewModel.declinedLeavesListByUser.length,
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
                                    .declinedLeavesListByUser[index].reason} " ,
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
                                    .declinedLeavesListByUser[index].startLeaveDay}.${
                                      leaveRequestScreenViewModel
                                    .declinedLeavesListByUser[index].startLeaveMonth}.${
                                      leaveRequestScreenViewModel
                                    .declinedLeavesListByUser[index].startLeaveYear} - ${
                                      leaveRequestScreenViewModel
                                    .declinedLeavesListByUser[index].endLeaveDay}.${
                                      leaveRequestScreenViewModel
                                    .declinedLeavesListByUser[index].endLeaveMonth}.${
                                      leaveRequestScreenViewModel
                                    .declinedLeavesListByUser[index].endLeaveYear}",
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w500),
                                ),
                              ),

                               Text(
                                  "Days off : ${
                                    leaveRequestScreenViewModel.declinedLeavesListByUser[index].numberOfLeaveDay} day",
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