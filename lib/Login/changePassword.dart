import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:capstone_ui/Login/otp.dart';
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

class ChangePasswordScreen extends StatefulWidget {
  final String phone;
  const ChangePasswordScreen({Key? key, required this.phone}) : super(key: key);
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool hidePassword = true;
  UserService _UserService = UserService();
  String mobileToken = '';
  String newPassword = '';
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

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocConsumer<AuthenticateBloc, AuthenticateState>(
        listener: (context, state) {
          if (state.isChangedPassword) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => new NewFeed()),
                (Route<dynamic> route) => false);
            context
                .read<AuthenticateBloc>()
                .add(AuthenticateEvent.setCheckFalseChangedPassword());

            SetUserInfo(state.phoneNumber, state.password, state.userId);
            UpdateDeviceMobileToken(UpdateDevicetokenMobileRequest(
                userId: state.userId, mobileToken: mobileToken));
          }
        },
        builder: (context, state) {
          return Container(
            width: 100.w,
            height: 20.5.h,
            child: Scaffold(
              body: Center(
                  child: Container(
                color: Colors.white,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "TẠO MẬT KHẨU MỚI",
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
                              TextInputType.numberWithOptions(decimal: false),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: emailController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            labelText: 'Mật khẩu mới',
                            hintText: 'Nhập mật khẩu mới',
                          ),
                          style: TextStyle(fontSize: 25.sp),
                          onChanged: (value) {
                            newPassword = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: false),
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
                            labelText: 'Nhập lại mật khẩu',
                            hintText: 'Nhập mật khẩu mới',
                          ),
                          style: TextStyle(fontSize: 25.sp),
                          onChanged: (value) {},
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<AuthenticateBloc>().add(
                              AuthenticateEvent.changePasswordRequested(
                                  widget.phone, newPassword));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: greenALS,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        icon: Icon(Icons.login),
                        label: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
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
}
