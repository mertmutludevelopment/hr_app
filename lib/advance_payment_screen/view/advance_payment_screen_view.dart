import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/advance_payment_screen/view/widgets/advance_payment_history.dart';
import 'package:hr_app/advance_payment_screen/view/widgets/advance_payment_request_area.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class AdvancePaymentScreenView extends StatefulWidget {
  const AdvancePaymentScreenView({super.key});

  @override
  State<AdvancePaymentScreenView> createState() =>
      _AdvancePaymentScreenViewState();
}

class _AdvancePaymentScreenViewState extends State<AdvancePaymentScreenView> {
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
    return AppBar(
      title: const Text(
        "Advance Payment",
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
              AdvancePaymentRequestArea(),
              AdvancePaymentHistory(),
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
}
