import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
// ignore: unused_import
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/SpeechToText/voice_to_text.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../Components/Home/category_card.dart';
import '../Feature/SpeechToText/SpeechToText.dart';
import '../Feature/TextToSpeech/TextToSpeech.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Sizer(builder: (context, orientation, deviceType) {
      return SizerUtil.deviceType == DeviceType.mobile
          // ignore: sized_box_for_whitespace
          ? Container(
              width: 100.w,
              height: 20.5.h,
              child: Scaffold(
                bottomNavigationBar: MyBottomNavBar(
                  // ignore: unnecessary_this
                  index: this.index,
                ),
                floatingActionButton: FloatingActionButton(
                  // ignore: prefer_const_constructors
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30.0),
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
                                                    SpeechSampleApp()));
                                      },
                                    ),
                                    CategoryCard(
                                      title: "Lưu giọng nói",
                                      svgSrc: "assets/icons/saverecord1.svg",
                                      press: () {
                                        Navigator.of(context)
                                            .pushNamed('/saveRecord');
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
                ),
              ))
          : Container(
              width: 100.w,
              height: 12.5.h,
              child: Scaffold(
                  bottomNavigationBar: MyBottomNavBar(
                    index: this.index,
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
