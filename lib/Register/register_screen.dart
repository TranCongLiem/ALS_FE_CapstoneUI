import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Login/update_info.dart';
import 'package:capstone_ui/services/api_login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Feature/Chat/constants/color_constants.dart';
import '../Login/login_screen.dart';
import '../Model/UpdateDeviceTokenMobile.dart';
import '../Splash/SharePreKey.dart';

class RegisterScreenPatient extends StatefulWidget {
  const RegisterScreenPatient({Key? key}) : super(key: key);

  @override
  State<RegisterScreenPatient> createState() => _RegisterScreenPatientState();
}

class _RegisterScreenPatientState extends State<RegisterScreenPatient> {
  bool hidePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserService _UserService = UserService();
  String mobileToken = '';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => mobileToken = value ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state.errorMessage != '' && state.errorMessage != null) {
            Fluttertoast.showToast(
                msg: state.errorMessage.toString(),
                backgroundColor: ColorConstants.greyColor);
            context
                .read<AuthenticateBloc>()
                .add(AuthenticateEvent.setErrorMessageRequested());
          }
          if (state.isRegisterPatient) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterInfo()));
            SetUserInfo(state.phoneNumber, state.password, state.userId);
            UpdateDeviceMobileToken(UpdateDevicetokenMobileRequest(
                userId: state.userId, mobileToken: mobileToken));
          }
        },
        builder: (context, state) {
          context
              .read<AuthenticateBloc>()
              .add(AuthenticateEvent.checkRegisterPatientRequested());
          return SizerUtil.deviceType == DeviceType.mobile
              ? Container(
                  width: 100.w,
                  height: 20.5.h,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      title: Text(
                        'Đăng ký',
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.w700),
                      ),
                      backgroundColor: greenALS,
                    ),
                    body: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30.0),
                          color: Colors.white,
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Text(
                                    "TẠO TÀI KHOẢN",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: greenALS,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(
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
                                          AuthenticateEvent
                                              .phoneNumberChangedPatient(
                                                  value));
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                              .hasMatch(value)) {
                                        return "Nhập đúng số điện thoại";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(
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
                                          AuthenticateEvent
                                              .passwordChangedPatient(value));
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Vui lòng nhập mật khẩu';
                                      } else if (value.length > 10) {
                                        return 'Chỉ nhập 10 số';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    validate();
                                    context.read<AuthenticateBloc>().add(
                                        AuthenticateEvent
                                            .registrationPatientRequested(
                                                state.phoneNumberPatient,
                                                state.passwordPatient));
                                  },
                                  child: Text(
                                    'Đăng ký',
                                    style: TextStyle(fontSize: 22.sp),
                                  ),
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(
                                            (Set<MaterialState> states) {
                                      if (states.contains(
                                              MaterialState.pressed) ||
                                          (states.contains(
                                              MaterialState.disabled))) {
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Đã có tài khoản?',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()));
                                          },
                                          child: Text('Đăng nhập',
                                              style: TextStyle(
                                                  color: greenALS,
                                                  fontSize: 18.sp,
                                                  fontFamily: 'GothamB'))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                        .hasMatch(value)) {
                                  return "Nhập đúng số điện thoại";
                                } else {
                                  return null;
                                }
                              },
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
                              'Đăng ký',
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
                                  'Đã có tài khoản?',
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
                                    child: Text('Đăng nhập',
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

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not validated');
    }
  }
}
