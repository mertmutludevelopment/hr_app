import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/main_screen/view/widgets/main_menu.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
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
    );
  }

  AppBar buildAppBar() {
    String greeting = getGreeting();
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 2.5.h),
        child: Image.asset("images/app_logo.png"),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " $greeting ,",
            style: TextStyle(
                fontSize: 18.sp, color: const Color.fromARGB(1000, 241, 0, 77)),
          ),
          Observer(
            builder: (_) {
              return Text(
                " ${loginScreenViewModel.user!.fullname} ",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(1000, 241, 0, 77)),
              );
            },
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  String getGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 6 && hour < 12) {
      return 'Good Mornings ';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Days';
    } else {
      return 'Good Evenings';
    }
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: const Column(
          children: [
            MainMenu(),
          ],
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
}
