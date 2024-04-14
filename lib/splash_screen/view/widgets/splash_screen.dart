import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/routes/app_routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      //Navigation with Locater
      Get.offNamedUntil(AppRoutes.LOGIN_SCREEN_PATH, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(500, 241, 0, 77),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 250, child: Image.asset('images/app_logo_new.png')),
            SizedBox(
              height: 3.5.h,
            ),
            const SpinKitThreeBounce(
              color: Colors.black54,
              size: 35.0,
            )
          ],
        ),
      ),
    );
  }
}
