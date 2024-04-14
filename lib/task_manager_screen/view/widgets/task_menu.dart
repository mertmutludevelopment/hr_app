import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/task_manager_screen/view_model/task_manager_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({super.key});

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  final taskManagerScreenViewModel = locator<TaskManagerScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  bool isFirstTime = true;
  @override
  void initState() {
    if (taskManagerScreenViewModel.tasksList.isEmpty) {
      taskManagerScreenViewModel.getTaskFromNotion();
      isFirstTime = false;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirstTime) {
      taskManagerScreenViewModel.tasksList.clear();
      taskManagerScreenViewModel.getTaskFromNotion();
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
            height: 64.h,
            child: Observer(builder: (_) {
              if (taskManagerScreenViewModel.tasksList.isEmpty) {
                return Center(
                  child: Text("You don't have any tasks right now",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      )),
                );
              } else {
                return ListView.builder(
                    itemCount: taskManagerScreenViewModel.tasksList.length,
                    itemBuilder: (context, index) {
                      if (taskManagerScreenViewModel
                              .tasksList[index].departments !=
                          loginScreenViewModel.user!.department) {
                        return const SizedBox.shrink();
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: .2.h,
                                  color: const Color.fromARGB(1000, 241, 0, 77),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2.5.h,
                                  ),
                                ]),
                            child: ListTile(
                              title: Padding(
                                padding:
                                    EdgeInsets.only(top: 1.5.h, bottom: 1.h),
                                child: Text(
                                  taskManagerScreenViewModel
                                      .tasksList[index].task,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13.0.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.h, bottom: 1.h),
                                    child: Text(
                                      taskManagerScreenViewModel
                                          .tasksList[index].description,
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.h, bottom: 1.5.h),
                                    child: Text(
                                      "Deadline : ${DateFormat('dd/MM/yyyy').format(taskManagerScreenViewModel.tasksList[index].deadline)}",
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }
            })),
      ],
    );
  }
}
