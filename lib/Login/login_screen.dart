import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Login/update_info.dart';
import 'package:capstone_ui/Login/update_info_supporter.dart';
import 'package:capstone_ui/Model/UpdateDeviceTokenMobile.dart';
import 'package:capstone_ui/services/api_login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../Feature/Chat/constants/color_constants.dart';
import '../Feature/Supporter/Newsfeed/newfeeds.dart';
import '../Register/role_screen.dart';
import '../Splash/SharePreKey.dart';
import 'otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  UserService _UserService = UserService();
  String mobileToken = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String validated;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => mobileToken = value ?? '');
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> usernameKey = GlobalKey();
  GlobalKey<FormFieldState> passwordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          print("Authen or not: " + state.isAuthenticated.toString());
          if (state.isCheckLogin) {
            Fluttertoast.showToast(
                msg: "Tài khoản hoặc mật khẩu không chính xác",
                backgroundColor: greenALS,
                fontSize: 18.0);
            context
                .read<AuthenticateBloc>()
                .add(AuthenticateEvent.checkLoginFalseRequested());
          }
          if (state.isAuthenticated) {
            if (state.role == 'Patient') {
              if (state.fullName.toString() != '') {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => new NewFeed()),
                    (Route<dynamic> route) => false);
                Fluttertoast.showToast(
                    msg: "Đăng nhập thành công",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: greenALS,
                    textColor: Colors.white,
                    fontSize: 16.0);
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
              }

              SetUserInfo(state.phoneNumber, state.password, state.userId);
              UpdateDeviceMobileToken(UpdateDevicetokenMobileRequest(
                  userId: state.userId, mobileToken: mobileToken));

              //  Navigator.push(context, MaterialPageRoute(builder: (context) => NewFeed()));

            } else if (state.role == 'Supporter') {
              if (state.fullName.toString() != '') {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new NewFeedSupporter()),
                    (Route<dynamic> route) => false);
                Fluttertoast.showToast(
                    msg: "Đăng nhập thành công",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: greenALS,
                    textColor: Colors.white,
                    fontSize: 16.0);
                SetUserInfo(state.phoneNumber, state.password, state.userId);
                UpdateDeviceMobileToken(UpdateDevicetokenMobileRequest(
                    userId: state.userId, mobileToken: mobileToken));
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new RegisterInfoSupporter()),
                    (Route<dynamic> route) => false);
                SetUserInfo(state.phoneNumber, state.password, state.userId);
                UpdateDeviceMobileToken(UpdateDevicetokenMobileRequest(
                    userId: state.userId, mobileToken: mobileToken));
              }
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
                      child: Form(
                        key: formkey,
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
                                key: usernameKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: emailController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.person,
                                    color: greenALS,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Số Điện Thoại',
                                  hintText: 'Nhập Số Điện Thoại',
                                ),
                                validator: (val) => validateUsername(val!),
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
                                key: passwordKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                validator: (val) => validatePassword(val!),
                                style: TextStyle(fontSize: 25.sp),
                                onChanged: (value) {
                                  context.read<AuthenticateBloc>().add(
                                      AuthenticateEvent.passwordChanged(value));
                                },
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  context
                                      .read<AuthenticateBloc>()
                                      .add(AuthenticateEvent.loginRequested());
                                  // Fluttertoast.showToast(
                                  //     msg: 'Đăng nhập thành công',
                                  //     backgroundColor: greenALS,
                                  //     fontSize: 18.0);
                                }
                              },
                              icon: Icon(Icons.login),
                              label: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: greenALS,
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            TextButton(
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
                                      return OTPScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Quên mật khẩu',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Chưa có tài khoản?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.sp),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RoleScreen()));
                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(8)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ))),
                                      child: Text('Đăng ký',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                          ))),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chưa có tài khoản?',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                                TextButton(
                                    onPressed: () {},
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

  void SetUserInfo(String phone, String Password, String userId) async {
    //final prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKey.SHARED_LOGGED, true);
    await prefs.setString(SharedPreferencesKey.SHARED_PHONE, phone);
    await prefs.setString(SharedPreferencesKey.SHARED_PASSWORD, Password);
    await prefs.setString(SharedPreferencesKey.SHARED_USER, userId);
  }

  void UpdateDeviceMobileToken(
      UpdateDevicetokenMobileRequest updateDevicetokenMobileRequest) {
    var result =
        _UserService.updateDeviceTokenMobile(updateDevicetokenMobileRequest);
  }

  void checkInvalidPassword(String error) {
    if (error != '' && !error.isEmpty) {
      setState(() {
        Fluttertoast.showToast(
            msg: error, backgroundColor: greenALS, fontSize: 18.0);
      });
    }
  }

  String? validateUsername(String username) {
    if (username == null || username.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    } else if (username.length > 10) {
      return 'Vui lòng nhập 10 số';
    }
    return null;
  }

  String? validatePassword(String title) {
    if (title == null || title.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }
}
