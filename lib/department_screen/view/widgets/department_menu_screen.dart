import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/department_screen/view_model/department_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class DepartmentMenuScreen extends StatefulWidget {
  const DepartmentMenuScreen({super.key});

  @override
  State<DepartmentMenuScreen> createState() => _DepartmentMenuScreenState();
}

class _DepartmentMenuScreenState extends State<DepartmentMenuScreen> {
  final departmentScreenViewModel = locator<DepartmentScreenViewModel>();
  bool isFirstTime = true;

  @override
  void initState() {
    if (departmentScreenViewModel.usedDepartments.isEmpty) {
      departmentScreenViewModel.getAllUsedDepartments();
      isFirstTime = false;
    }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirstTime) {
      setState(() {
        departmentScreenViewModel.usedDepartments.clear();
        departmentScreenViewModel.getAllUsedDepartments();
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
        SizedBox(
          height: 66.h,
          child: Observer(builder: (_) {
            if (departmentScreenViewModel.usedDepartments.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(1000, 241, 0, 77)),
                ),
              );
            } else {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 1.h, // İki eleman arasındaki yatay boşluk
                    mainAxisSpacing: 1.h, // İki eleman arasındaki dikey boşluk
                  ),
                  itemCount: departmentScreenViewModel.usedDepartments.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.DEPARTMENT_DETAIL_SCREEN_PATH,
                            arguments: departmentScreenViewModel
                                .usedDepartments[index]);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              departmentScreenViewModel.usedDepartments[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
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
