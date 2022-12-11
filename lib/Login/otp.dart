import 'dart:async';

import 'package:capstone_ui/Bloc/user/user_bloc.dart';
import 'package:capstone_ui/Bloc/user_chat/user_chat_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Login/changePassword.dart';
import 'package:capstone_ui/Login/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen();
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with CodeAutoFill {
  String codeValue = "";
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  late bool user;
  String verificationID = "";
  Timer? _timer;
  int _start = 60;

  @override
  void codeUpdated() {
    print("Update code $code");
    setState(() {
      print("codeUpdated");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenOtp();
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isCheckedPhoneNumber) {
          Fluttertoast.showToast(
              msg: 'Số điện thoại không tồn tại trong hệ thống',
              backgroundColor: greenALS,
              fontSize: 18.0);
          context.read<UserBloc>().add(UserEvent.setStateFlaseCheckedPhone());
        }
        if (state.isCheckedSentOTP) {
          if (otpVisibility) {
            verifyOTP();
          } else {
            forgotWithPhone();
          }
          context.read<UserBloc>().add(UserEvent.setStateFlaseCheckedSentOTP());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Xác thực",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            centerTitle: true,
            backgroundColor: greenALS,
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                // TextField(
                //   controller: phoneController,
                //   decoration: InputDecoration(
                //     hintText: 'Phone Number',
                //     prefix: Padding(
                //       padding: EdgeInsets.all(4),
                //       child: Text('+84'),
                //     ),
                //   ),
                //   maxLength: 10,
                //   keyboardType: TextInputType.phone,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'Xác thực số điện thoại',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nhập số điện thoại",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 22),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Text(
                            " (+84) ",
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                              ),
                            ),
                            Text(
                              "Nhập mã 6 số OTP",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      PinFieldAutoFill(
                        controller: otpController,
                        currentCode: codeValue,
                        decoration: UnderlineDecoration(
                          bgColorBuilder:
                              FixedColorBuilder(greenALS.withOpacity(0.2)),
                          textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                          colorBuilder: FixedColorBuilder(Colors.white),
                        ),
                        codeLength: 6,
                        onCodeChanged: (code) {
                          print("onCodeChanged $code");
                          setState(() {
                            codeValue = code.toString();
                          });
                        },
                        onCodeSubmitted: (val) {
                          print("onCodeSubmitted $val");
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        '(*) Mã sẽ được tự động điền. Xin vui lòng chờ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  visible: otpVisibility,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                // MaterialButton(
                //   color: Colors.indigo[900],
                //   onPressed: () {
                //     checkPasswordExisted();
                //   },
                //   child: Text(
                //     otpVisibility ? "Xác nhận" : "Gửi mã",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    checkPasswordExisted();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: greenALS,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      otpVisibility ? "Xác nhận" : "Gửi mã",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkPasswordExisted() {
    context
        .read<UserBloc>()
        .add(UserEvent.checkPhonedExistInSystem(phoneController.text));
    if (otpVisibility) {
      verifyOTP();
    } else {
      forgotWithPhone();
    }
  }

  void forgotWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+84" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      timeout: const Duration(seconds: 60),
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);
    try {
      await auth.signInWithCredential(credential).then(
        (value) {
          setState(() {
            user = true;
          });
        },
      ).whenComplete(
        () {
          if (user) {
            Fluttertoast.showToast(
              msg: "Xác nhận số điện thoại thành công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChangePasswordScreen(
                  phone: phoneController.text,
                ),
              ),
            );
          } else {
            Fluttertoast.showToast(
              msg: "Xác thực không thành công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
      );
    } catch (e) {}
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
