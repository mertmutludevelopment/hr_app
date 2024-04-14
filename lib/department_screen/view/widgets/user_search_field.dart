import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/department_screen/view_model/department_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class UserSearchField extends StatefulWidget {
  const UserSearchField({super.key});

  @override
  State<UserSearchField> createState() => _UserSearchFieldState();
}

class _UserSearchFieldState extends State<UserSearchField> {
  final departmentScreenViewModel = locator<DepartmentScreenViewModel>();

  Future<void> _showResultDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shadowColor: const Color.fromARGB(1000, 241, 0, 77),
          title: const Text("Search Results"),
          content: Observer(
            builder: (_) {
              // ignore: sized_box_for_whitespace
              return Container(
                height: 340,
                width: 380,
                child: ListView.builder(
                  itemCount: departmentScreenViewModel.searchedUsersList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          " ${departmentScreenViewModel.searchedUsersList[index].fullname} > ${departmentScreenViewModel.searchedUsersList[index].department}"),
                    );
                  },
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: SizedBox(
        height: 10.h,
        child: Column(
          children: [
            TextField(
              controller: departmentScreenViewModel.userNameControllerText,
              decoration: InputDecoration(
                hintText: "Find User",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      departmentScreenViewModel.getSearchedAllUsers(
                          departmentScreenViewModel.userNameControllerText.text
                              .toString());
                      departmentScreenViewModel.userNameControllerText.clear();
                      _showResultDialog();
                      departmentScreenViewModel.searchedUsersList.clear();
                    },
                    child: const Icon(Icons.search)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
