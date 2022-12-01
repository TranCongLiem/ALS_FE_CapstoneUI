import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone_ui/Login/login_screen.dart';
import 'package:capstone_ui/Login/update_info_supporter.dart';
import 'package:capstone_ui/Splash/SharePreKey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Bloc/authenticate/authenticate_bloc.dart';
import '../Feature/Newsfeed/newfeeds.dart';
import '../Feature/Supporter/Newsfeed/newfeeds.dart';
import '../Login/update_info.dart';
import '../Model/login_model.dart';
import '../services/api_User.dart';
import '../services/api_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _doLogin = false;
  UserService userService = UserService();
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 2),
    //         ()=>Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder:
    //             (context) => LoginScreen()
    //         )
    //     )
    // );
    //new Future.delayed(const Duration(seconds: 2), () => checkUserIsLogged());
    checkUserIsLogged();
  }

  void checkUserIsLogged() async {
    final prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool(SharedPreferencesKey.SHARED_LOGGED) != null) &&
        prefs.getBool(SharedPreferencesKey.SHARED_LOGGED) == true) {
      setState(() {
        _doLogin = true;
      });

      if (prefs.getString(SharedPreferencesKey.SHARED_PHONE) != null) {
        context.read<AuthenticateBloc>().add(
            AuthenticateEvent.phoneNumberChanged(
                prefs.getString(SharedPreferencesKey.SHARED_PHONE) ?? ''));
      }
      if (prefs.getString(SharedPreferencesKey.SHARED_PASSWORD) != null) {
        context.read<AuthenticateBloc>().add(AuthenticateEvent.passwordChanged(
            prefs.getString(SharedPreferencesKey.SHARED_PASSWORD) ?? ''));
      }
      if (prefs.getString(SharedPreferencesKey.SHARED_PHONE) != null &&
          prefs.getString(SharedPreferencesKey.SHARED_PASSWORD) != null) {
        context
            .read<AuthenticateBloc>()
            .add(AuthenticateEvent.loginRequested());
      }
    } else {
      Timer(
          Duration(seconds: 1),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //if (_doLogin) {

    return BlocListener<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          // if (state is AuthenticateState) {
          // TODO: implement listener
          switch (state.role) {
            case 'Patient':
              if (state.fullName.toString() != '' &&
                  state.fullName != null &&
                  !state.fullName.isEmpty) {
                print("relation: " + state.relationshipWith);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: Tween<double>(begin: 0.1, end: 1).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.bounceIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return NewFeed();
                    },
                  ),
                );
                //return NewFeed();
              } else {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: Tween<double>(begin: 0.1, end: 1).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.bounceIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return RegisterInfo();
                    },
                  ),
                );
                // return RegisterInfo();
              }
              break;

            case 'Supporter':
              if (state.fullName.toString() != '' &&
                  state.fullName != null &&
                  !state.fullName.isEmpty) {
                print("relation: " + state.relationshipWith);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: Tween<double>(begin: 0.1, end: 1).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.bounceIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return NewFeedSupporter();
                    },
                  ),
                );
                //return NewFeed();
              } else {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: Tween<double>(begin: 0.1, end: 1).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.bounceIn,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return RegisterInfoSupporter();
                    },
                  ),
                );
                // return RegisterInfo();
              }
              break;
            case '':
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: Tween<double>(begin: 0.1, end: 1).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.bounceIn,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: Duration(seconds: 1),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return LoginScreen();
                  },
                ),
              );
              break;
          }
        },
        child: Container(
          color: Colors.white,
          // child:FlutterLogo(size:MediaQuery.of(context).size.height)
          child: Image.asset(
            'assets/images/logo_ALS.png',
            height: size.height,
          ),
        )
        // builder: (context, state){
        //   if(state is AuthenticateState){
        //      return Container(
        //       color: Colors.white,
        //       // child:FlutterLogo(size:MediaQuery.of(context).size.height)
        //       child: Image.asset(
        //         'assets/images/logo_ALS.png',
        //         height: size.height,
        //       ),
        //     );
        //   }
        //   return Center();

        //   }
        );

    // } else {
    //   print("else in doLogin false");
    //   return Container();
    // }
  }

  void PushToDefaultScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewFeedSupporter()));
  }

  void PushToDefaultScreen2(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
