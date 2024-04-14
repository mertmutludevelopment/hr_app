import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/fullname_info_edit_screen/view_model/fullname_info_edit_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class GetNewFullnameScreen extends StatefulWidget {
  const GetNewFullnameScreen({super.key});

  @override
  State<GetNewFullnameScreen> createState() => _GetNewFullnameScreenState();
}

class _GetNewFullnameScreenState extends State<GetNewFullnameScreen> {
   final loginScreenViewModel = locator<LoginScreenViewModel>();
  final fullnameInfoEditScreenViewModel = locator<FullnameInfoEditScreenViewModel>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5.h),
          child: Text(
            "Type your new fullname",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: fullnameInfoEditScreenViewModel.newFullnameTextController,
              decoration:  InputDecoration(
                hintText: " Your old fullname : ${loginScreenViewModel.user!.fullname}",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
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