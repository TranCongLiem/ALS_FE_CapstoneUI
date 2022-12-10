import 'package:capstone_ui/Bloc/user/user_bloc.dart';
import 'package:capstone_ui/Bloc/user_chat/user_chat_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Login/changePassword.dart';
import 'package:capstone_ui/Login/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              "Phone Auth",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            backgroundColor: Colors.indigo[900],
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+84'),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                ),
                Visibility(
                  child: PinFieldAutoFill(
                    controller: otpController,
                    currentCode: codeValue,
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
                  visible: otpVisibility,
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.indigo[900],
                  onPressed: () {
                    checkPasswordExisted();
                  },
                  child: Text(
                    otpVisibility ? "Verify" : "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
              msg: "You are logged in successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
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
              msg: "your login is failed",
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
}
