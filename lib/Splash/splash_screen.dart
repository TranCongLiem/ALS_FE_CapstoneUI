import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone_ui/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        // child:FlutterLogo(size:MediaQuery.of(context).size.height)
      child: Image.asset('assets/images/logo_ALS.png', height: size.height,),
    );
  }
}

