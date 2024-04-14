import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/manager_events_screen/view/widgets/manager_events_menu_screen.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class ManagerEventsScreenView extends StatefulWidget {
  const ManagerEventsScreenView({super.key});

  @override
  State<ManagerEventsScreenView> createState() =>
      _ManagerEventsScreenViewState();
}

class _ManagerEventsScreenViewState extends State<ManagerEventsScreenView> {
    final loginScreenViewModel = locator<LoginScreenViewModel>();

  int _selectedBottomNaviIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomNaviIndex = index;

      switch (_selectedBottomNaviIndex) {
        case 0:
          Get.toNamed(AppRoutes.MAIN_SCREEN_PATH);
        case 1:
                   if (loginScreenViewModel.user!.department == "Human Resources") {
            Get.toNamed(AppRoutes.MANAGER_NOTIFICATON_SCREEN_PATH);
          } else {
            Get.toNamed(AppRoutes.NOTIFICATON_SCREEN_PATH);
          }
        case 2:
          Get.toNamed(AppRoutes.PROFILE_SCREEN_PATH);

          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigatonBar(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Events Managmnet",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ManagerEventsMenuScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigatonBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedBottomNaviIndex,
      selectedItemColor: const Color.fromARGB(1000, 241, 0, 77),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }

  Widget buildFloatingActionButton() {
    return SizedBox(
      height: 8.h,
      width: 8.h,
      child: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.ADD_NEW_EVENTS_SCREEN_PATH);
        },
        elevation: 1.h,
        backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
        child: const Icon(Icons.add),
      ),
    );
  }
}
