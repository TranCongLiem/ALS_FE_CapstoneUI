import 'package:capstone_ui/Bloc/authenticate/create_sos_noti/create_sos_noti_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
// ignore: unused_import
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Chat/chat_screen.dart';
import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/SaveRecord/home_view.dart';
import 'package:capstone_ui/Feature/SpeechToText/voice_to_text.dart';
import 'package:capstone_ui/services/api_User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Components/Home/category_card.dart';
import '../Feature/Chat/pages/home_page.dart';
import '../Feature/SpeechToText/SpeechToText.dart';
import '../Feature/TextToSpeech/TextToSpeech.dart';
import '../Splash/SharePreKey.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final String userId;
  UserPatientService service = UserPatientService();
  late CreateSosNotiBloc SOSBloc;
  // int index = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
    SOSBloc = CreateSosNotiBloc(service);
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId2 = prefs.getString(SharedPreferencesKey.SHARED_USER) ?? '';
    setState(() {
      userId = userId2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Sizer(builder: (context, orientation, deviceType) {
      return SizerUtil.deviceType == DeviceType.mobile
          // ignore: sized_box_for_whitespace
          ? BlocListener<CreateSosNotiBloc, SendSOSBlocState>(          
              listener: (context, state) {
                // TODO: implement listener
                if (state is SendSOSFailBlocState) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text('Lỗi'),
                            content: Text(
                                state.getPhoneByIdResponeModel.phoneNumber ??
                                    'Không thể thực hiện tính năng này'),
                          ));
                } else if (state is SendSOSSuccessBlocState) {
                  launch("tel:${state.getPhoneByIdResponeModel.phoneNumber}");
                } else {}
              },
              // builder: (context, state) {
                child: Container(
                    width: 100.w,
                    height: 20.5.h,
                    child: Scaffold(
                      bottomNavigationBar: MyBottomNavBar(
                          // ignore: unnecessary_this
                          // index: this.index,
                          ),
                      floatingActionButton: FloatingActionButton(
                        // ignore: prefer_const_constructors
                        child: Icon(Icons.notifications_active),
                        onPressed: () {
                          // BlocProvider.of<CreateSosNotiBloc>(context)
                          //     .add(SendSOSEvent(userId: userId));
                          //   SOSBloc.add(SendSOSEvent(userId: userId));
                          context
                              .read<CreateSosNotiBloc>()
                              .add(SendSOSEvent(userId: userId));
                        },
                      ),
                      body: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/anh_web.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: SafeArea(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 52,
                                        width: 52,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/images/logo_Avatar.jpg')),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 30.0),
                                      child: Text(
                                        "Xin chào!\nHôm nay bạn cần gì?",
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        childAspectRatio: .85,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        children: <Widget>[
                                          CategoryCard(
                                            title:
                                                "Chuyển văn bản thành giọng nói",
                                            svgSrc: 'assets/icons/text.svg',
                                            press: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TextToSpeech()));
                                            },
                                          ),
                                          CategoryCard(
                                            title:
                                                "Chuyển giọng nói thành văn bản",
                                            svgSrc:
                                                'assets/icons/microphone.svg',
                                            press: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SpeechSampleApp()));
                                            },
                                          ),
                                          CategoryCard(
                                            title: "Lưu giọng nói",
                                            svgSrc:
                                                "assets/icons/saverecord1.svg",
                                            press: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeViewRecord()));
                                            },
                                          ),
                                          CategoryCard(
                                            title: "Trò chuyện",
                                            svgSrc: "assets/icons/ex1.svg",
                                            press: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()));
                                            },
                                          ),
                                          BlocBuilder<CreateSosNotiBloc,
                                              SendSOSBlocState>(
                                            builder: (context, state) {
                                              if (state
                                                  is SendSOSFailBlocState) {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                          title: Text('Lỗi'),
                                                          content: Text(state
                                                                  .getPhoneByIdResponeModel
                                                                  .phoneNumber ??
                                                              'Không thể thực hiện tính năng này'),
                                                        ));
                                              } else if (state
                                                  is SendSOSSuccessBlocState) {
                                                launch(
                                                    "tel:${state.getPhoneByIdResponeModel.phoneNumber}");
                                              } else {}
                                              return Container();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  )
              //} ;
            )
          : Container(
              width: 100.w,
              height: 12.5.h,
              child: Scaffold(
                  bottomNavigationBar: MyBottomNavBar(
                      // index: this.index,
                      ),
                  floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.notifications_active),
                    onPressed: () {},
                  ),
                  body: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/anh_web.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 52,
                                    width: 52,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          image: ExactAssetImage(
                                              'assets/images/logo_Avatar.jpg')),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Text(
                                    "Xin chào!\nHôm nay bạn cần gì?",
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: .85,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    children: <Widget>[
                                      CategoryCard(
                                        title: "Chuyển văn bản thành giọng nói",
                                        svgSrc: 'assets/icons/text.svg',
                                        press: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TextToSpeech()));
                                        },
                                      ),
                                      CategoryCard(
                                        title: "Chuyển giọng nói thành văn bản",
                                        svgSrc: 'assets/icons/microphone.svg',
                                        press: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SpeechToText()));
                                        },
                                      ),
                                      CategoryCard(
                                        title: "Lưu giọng nói",
                                        svgSrc: "assets/icons/saverecord1.svg",
                                        press: () {
                                          Navigator.of(context)
                                              .pushNamed('/login');
                                        },
                                      ),
                                      CategoryCard(
                                        title: "Bài tập",
                                        svgSrc: "assets/icons/ex1.svg",
                                        press: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ListExcerise()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )));
    });
  }
}
