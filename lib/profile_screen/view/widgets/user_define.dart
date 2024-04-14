import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class UserDefine extends StatefulWidget {
  const UserDefine({super.key});

  @override
  State<UserDefine> createState() => _UserDefineState();
}

class _UserDefineState extends State<UserDefine> {
  final profileScreenViewModel = locator<LoginScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 8.5.h,
            backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8.h,
              child: const Icon(
                Icons.person,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
          child: Observer(
            builder: (_) {
              return Text(
                "${profileScreenViewModel.user!.fullname} , ${ DateTime.now().year - profileScreenViewModel.user!.birthYear}",
                style: TextStyle(fontSize: 15.sp),
              );
            },
          ),
        )
      ],
    );
  }
}
