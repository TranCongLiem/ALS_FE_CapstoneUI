import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Components/Home/category_card.dart';
import '../Feature/SpeechToText/SpeechToText.dart';
import '../Feature/TextToSpeech/TextToSpeech.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
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
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: greenALS,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw1.png"),
              ),
            ),
          ),
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
                          image: new DecorationImage(image: ExactAssetImage('assets/images/logo_Avatar.jpg')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
                                      builder: (context) => TextToSpeech()));
                            },
                          ),
                          CategoryCard(
                            title: "Chuyển giọng nói thành văn bản",
                            svgSrc: 'assets/icons/microphone.svg',
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SpeechToText()));
                            },
                          ),
                          CategoryCard(
                            title: "Lưu giọng nói",
                            svgSrc: "assets/icons/saverecord1.svg",
                            press: () {
                                Navigator.of(context).pushNamed('/saveRecord');
                            },
                          ),
                          CategoryCard(
                            title: "Bài tập",
                            svgSrc: "assets/icons/ex1.svg",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListExcerise()));
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
    );
  }
}
