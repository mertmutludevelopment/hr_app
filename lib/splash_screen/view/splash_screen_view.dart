import 'package:flutter/material.dart';
import 'package:hr_app/splash_screen/view/widgets/splash_screen.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}