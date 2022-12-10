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
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: false),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: emailController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
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
                            labelText: 'Mật khẩu mới',
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
                        icon: Icon(Icons.login),
                        label: Text(
                          'OTP',
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          elevation: MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed) ||
                                (states.contains(MaterialState.disabled))) {
                              return 0;
                            }
                            return 5;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              // This trailing comma makes auto-formatting nicer for build methods.
            ),
          );
          // : Container(
          //     width: 100.w,
          //     height: 12.5.h,
          //     child: Scaffold(
          //       body: Center(
          //           child: Container(
          //         color: Colors.white,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Flexible(
          //               flex: 1,
          //               child: Padding(
          //                 padding: EdgeInsets.all(5),
          //                 child: Image.asset('assets/images/logo_ALS.png',
          //                     width: 450),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.all(10),
          //               child: TextFormField(
          //                 controller: emailController,
          //                 autofocus: true,
          //                 decoration: InputDecoration(
          //                   suffixIcon: Icon(Icons.person),
          //                   border: OutlineInputBorder(),
          //                   labelText: 'Mật khẩu mới',
          //                   hintText: 'Nhập mật khẩu mới',
          //                 ),
          //                 style: TextStyle(fontSize: 25.sp),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.all(10),
          //               child: TextFormField(
          //                 keyboardType: TextInputType.numberWithOptions(
          //                     decimal: false),
          //                 controller: passwordController,
          //                 obscureText: hidePassword,
          //                 decoration: InputDecoration(
          //                   suffixIcon: IconButton(
          //                     icon: Icon(
          //                       hidePassword
          //                           ? Icons.visibility_off
          //                           : Icons.visibility,
          //                     ),
          //                     onPressed: () {
          //                       setState(() {
          //                         hidePassword = !hidePassword;
          //                       });
          //                     },
          //                     color: Colors.green,
          //                   ),
          //                   border: OutlineInputBorder(),
          //                   labelText: 'Mật khẩu',
          //                   hintText: 'Nhập lại mật khẩu',
          //                 ),
          //                 style: TextStyle(fontSize: 25.sp),
          //               ),
          //             ),
          //             ElevatedButton.icon(
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   PageRouteBuilder(
          //                     transitionsBuilder: (context, animation,
          //                         secondaryAnimation, child) {
          //                       return ScaleTransition(
          //                         alignment: Alignment.center,
          //                         scale: Tween<double>(begin: 0.1, end: 1)
          //                             .animate(
          //                           CurvedAnimation(
          //                             parent: animation,
          //                             curve: Curves.bounceIn,
          //                           ),
          //                         ),
          //                         child: child,
          //                       );
          //                     },
          //                     transitionDuration: Duration(seconds: 1),
          //                     pageBuilder: (BuildContext context,
          //                         Animation<double> animation,
          //                         Animation<double> secondaryAnimation) {
          //                       return NewFeed();
          //                     },
          //                   ),
          //                 );
          //               },
          //               icon: Icon(Icons.login),
          //               label: Text(
          //                 'Xác nhận',
          //                 style: TextStyle(
          //                     fontSize: 22.sp, fontFamily: 'GothamB'),
          //               ),
          //               style: ButtonStyle(
          //                 foregroundColor: MaterialStateProperty.all<Color>(
          //                     Colors.white),
          //                 backgroundColor: MaterialStateProperty.all<Color>(
          //                     Colors.green),
          //                 elevation:
          //                     MaterialStateProperty.resolveWith<double>(
          //                         (Set<MaterialState> states) {
          //                   if (states.contains(MaterialState.pressed) ||
          //                       (states.contains(MaterialState.disabled))) {
          //                     return 0;
          //                   }
          //                   return 5;
          //                 }),
          //               ),
          //             ),
          //           ],
          //         ),
          //       )),
          //       // This trailing comma makes auto-formatting nicer for build methods.
          //     ),
          //   );
        },
      );
    });
  }
}
