import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Login/verify_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Feature/Supporter/Newsfeed/newfeeds.dart';
import '../Splash/SharePreKey.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state.isAuthenticated) {           
            if (state.role == 'Patient') {
              SetUserInfo(state.phoneNumber, state.password, state.userId);
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
                    return NewFeed();
                  },
                ),
              );
            } else if (state.role == 'Supporter') {
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
                    return NewFeedSupporter();
                  },
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return SizerUtil.deviceType == DeviceType.mobile
              ? Container(
                  width: 100.w,
                  height: 20.5.h,
                  child: Scaffold(
                    body: Center(
                        child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset('assets/images/logo_ALS.png',
                                  width: 450),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: emailController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                labelText: 'Số Điện Thoại',
                                hintText: 'Nhập Số Điện Thoại',
                              ),
                              style: TextStyle(fontSize: 25.sp),
                              onChanged: (value) {
                                context.read<AuthenticateBloc>().add(
                                    AuthenticateEvent.phoneNumberChanged(
                                        value));
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: passwordController,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Colors.green,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Mật khẩu',
                                hintText: 'Nhập mật khẩu',
                              ),
                              style: TextStyle(fontSize: 25.sp),
                              onChanged: (value) {
                                context.read<AuthenticateBloc>().add(
                                    AuthenticateEvent.passwordChanged(value));
                              },
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              context
                                  .read<AuthenticateBloc>()
                                  .add(AuthenticateEvent.loginRequested());
                            },
                            icon: Icon(Icons.login),
                            label: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  fontSize: 22.sp, fontFamily: 'GothamB'),
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed) ||
                                    (states.contains(MaterialState.disabled))) {
                                  return 0;
                                }
                                return 5;
                              }),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyScreen()));
                              },
                              child: Text(
                                'Quên mật khẩu',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black),
                              )),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RoleScreen()));
                            },
                            // child: Text('Chưa có tài khoản? Đăng ký'),
                            // style: ButtonStyle(
                            //   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            //
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chưa có tài khoản?',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             RoleScreen()));
                                    },
                                    child: Text('Đăng ký',
                                        style: TextStyle(
                                            color: greenALS,
                                            fontSize: 18.sp,
                                            fontFamily: 'GothamB'))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    // This trailing comma makes auto-formatting nicer for build methods.
                  ),
                )
              : Container(
                  width: 100.w,
                  height: 12.5.h,
                  child: Scaffold(
                    body: Center(
                        child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset('assets/images/logo_ALS.png',
                                  width: 450),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: emailController,
                              autofocus: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                labelText: 'Tài khoản',
                                hintText: 'Nhập tài khoản',
                              ),
                              style: TextStyle(fontSize: 25.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false),
                              controller: passwordController,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Colors.green,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Mật khẩu',
                                hintText: 'Nhập mật khẩu',
                              ),
                              style: TextStyle(fontSize: 25.sp),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return ScaleTransition(
                                      alignment: Alignment.center,
                                      scale: Tween<double>(begin: 0.1, end: 1)
                                          .animate(
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
                            },
                            icon: Icon(Icons.login),
                            label: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  fontSize: 22.sp, fontFamily: 'GothamB'),
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              elevation:
                                  MaterialStateProperty.resolveWith<double>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed) ||
                                    (states.contains(MaterialState.disabled))) {
                                  return 0;
                                }
                                return 5;
                              }),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RoleScreen()));
                            },
                            // child: Text('Chưa có tài khoản? Đăng ký'),
                            // style: ButtonStyle(
                            //   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            //
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chưa có tài khoản?',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             RoleScreen()));
                                    },
                                    child: Text('Đăng ký',
                                        style: TextStyle(
                                            color: greenALS,
                                            fontSize: 18.sp,
                                            fontFamily: 'GothamB'))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    // This trailing comma makes auto-formatting nicer for build methods.
                  ),
                );
        },
      );
    });
  }
  void SetUserInfo(String phone, String Password,String userId) async {
    //final prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKey.SHARED_LOGGED, true);
    await prefs.setString(SharedPreferencesKey.SHARED_PHONE,phone);
    await prefs.setString(SharedPreferencesKey.SHARED_PASSWORD, Password);
    await prefs.setString(SharedPreferencesKey.SHARED_USER, userId);
  }
}


