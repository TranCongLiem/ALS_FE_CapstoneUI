import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone_ui/Home/home_screen.dart';
import 'package:capstone_ui/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/lottie/welcome1.json'),
        splashIconSize: 300,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        nextScreen: LoginScreen());

  }
}
