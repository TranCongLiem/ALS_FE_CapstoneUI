import 'dart:math';

import 'package:capstone_ui/Components/Feature/Excerise/Excerise/category_ex.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Feature/Excerise/listexercise_bycategory.dart';
import 'package:capstone_ui/Feature/Excerise/session_exercise.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../Components/BottomNavBar/bottom_nav_bar.dart';
import 'DetailExcerise.dart';

class ListExcerise extends StatefulWidget {
  const ListExcerise({Key? key}) : super(key: key);

  @override
  State<ListExcerise> createState() => _ListExceriseState();
}

class _ListExceriseState extends State<ListExcerise> {
  String outputText = 'Tìm kiếm';
  final SpeechToText speech = SpeechToText();
  bool _hasSpeech = false;
  String _currentLocaleId = 'vi_VN';
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  double level = 0.0;
  int index = 3;
  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        // ignore: unnecessary_this
        index: this.index,
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: greenALS,
        title: Text(
          'Bài tập',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //search bar
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            // ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(22)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: outputText,
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w500)),
                        )),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .26,
                                    spreadRadius: level * 1.5,
                                    color: greenALS.withOpacity(.1))
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: ElevatedButton(
                            onPressed: () {
                              !_hasSpeech || speech.isListening
                                  ? null
                                  : startListening();
                            },
                            // ignore: sort_child_properties_last
                            child: Icon(Icons.mic,
                                color: speech.isListening
                                    ? Colors.red
                                    : Colors.white,
                                size: 25),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(7.0),
                              primary: greenALS, // <-- Button color
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            ButtonCreateEx(),
            WidgetEx1(),
            Container(
                padding: const EdgeInsets.only(top: 15),
                height: size.height / 4,
                width: size.width / 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )),
            WidgetEx2(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                      width: 80,
                      child: ListTile(
                        title: Text('1'),
                      ));
                },
              ),
            )
            // Container(
            //     padding: const EdgeInsets.only(top: 15),
            //     height: size.height / 3,
            //     width: size.width / 1,
            //     child: GridView.count(
            //         crossAxisCount: 1,
            //         childAspectRatio: .99,
            //         crossAxisSpacing: 15,
            //         mainAxisSpacing: 15,
            //         children: [
            //           ListView(
            //             scrollDirection: Axis.horizontal,
            //             children: [
            //               CategoryEx(
            //                   svgSrc:
            //                       "https://cdn-prod.medicalnewstoday.com/content/images/articles/324/324489/wrist-rotations.jpg",
            //                   name: "Tay",
            //                   press: () {}),
            //               SizedBox(
            //                 width: 12,
            //               ),
            //               CategoryEx(
            //                   svgSrc:
            //                       "https://hips.hearstapps.com/hmg-prod/images/mindset-is-everything-royalty-free-image-1571082203.jpg",
            //                   name: "Chân",
            //                   press: () {}),
            //               SizedBox(
            //                 width: 12,
            //               ),
            //               CategoryEx(
            //                   svgSrc:
            //                       "https://cdn-prod.medicalnewstoday.com/content/images/articles/324/324489/wrist-rotations.jpg",
            //                   name: "Tay",
            //                   press: () {}),
            //             ],
            //           ),
            //         ])),
          ],
        ),
      ),
    );
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void statusListener(String status) {
    print(status);
  }

  void errorListener(SpeechRecognitionError errorNotification) {}

  startListening() async {
    PermissionStatus microStatus = await Permission.microphone.request();
    if (microStatus == PermissionStatus.granted) {}
    if (microStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cần có quyền truy cập vào micro')));
    }
    if (microStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 4),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
  }

  void resultListener(SpeechRecognitionResult result) {
    if (result.finalResult)
      setState(() {
        outputText = result.recognizedWords;
      });
  }

  soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    setState(() {
      this.level = level;
    });
  }
}

class WidgetEx2 extends StatelessWidget {
  const WidgetEx2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Phân loại',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Xem tất cả',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetEx1 extends StatelessWidget {
  const WidgetEx1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Lịch sử luyện tập',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Xem tất cả',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCreateEx extends StatelessWidget {
  const ButtonCreateEx({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VideoScreen()));
          },
          label: Text(
            'Tạo buổi tập',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.add),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
      ),
    );
  }
}

Widget buildCardRecommend() => Expanded(
        child: Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo_ALS.png',
            width: 200,
          ),
        ],
      ),
    ));

class SpeechStatusWidget extends StatelessWidget {
  const SpeechStatusWidget({
    Key? key,
    required this.speech,
  }) : super(key: key);
  final SpeechToText speech;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Center(
            child: speech.isListening
                ? Text(
                    "Đang nghe...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white),
                  )
                : Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}
