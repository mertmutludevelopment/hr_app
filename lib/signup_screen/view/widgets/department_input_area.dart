import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/signup_screen/view_model/signup_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class DepartmentInputArea extends StatefulWidget {
  const DepartmentInputArea({super.key});

  @override
  State<DepartmentInputArea> createState() => _DepartmentInputAreaState();
}

class _DepartmentInputAreaState extends State<DepartmentInputArea> {
  final signupScreenViewModel = locator<SignupScreenViewModel>();
   List<String> departmentList = <String>['Mobile', 'Backend', 'Database', 'Web','ML', 'Product' , 'Marketing' , 'Human Resources' ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
         Observer( builder: (_){
           return Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children:[ 
              Expanded(
                child: DropdownButton<String>(
                value: signupScreenViewModel.departmentSelectedController ,
                onChanged: (String? newValue) {
                    setState(() {
                      signupScreenViewModel.departmentSelectedController = newValue!;
                    });
                  },
                items: departmentList.map<DropdownMenuItem<String>>((String value ) => DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:  EdgeInsets.only(left : 25.w),
                    child: Text(value),
                  ),
                  ),
                  ).toList(),
                hint: Padding(
                  padding: EdgeInsets.only( left : 25.w),
                  child: const Text("Select Department"),
                ),
                         
                ),
              ),
              ]
           );
         },),
      ],
    );
  }
}
