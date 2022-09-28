import 'dart:math';

import 'package:capstone_ui/Components/Feature/Excerise/category_recommend.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Feature/Excerise/voice_to_text_search.dart';
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
  String outputText='Tìm kiếm';
  final SpeechToText speech= SpeechToText();
  bool _hasSpeech= false;
  String _currentLocaleId= 'vi_VN';
  double minSoundLevel= 50000;
  double maxSoundLevel= -50000;
  double level=0.0;
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Column(
          children: [
            //search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            ),
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
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: outputText,
                                border: InputBorder.none,
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Image.asset(
                                        "assets/images/logo_ALS.png",
                                        height: 20,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        IconButton(
                            icon: Icon(Icons.mic),
                            onPressed: (){
                              !_hasSpeech || speech.isListening
                                ? null
                                : startListening();
                            })
                      ],
                    ),
                    // child: _tan(outputText: 'aa',
                    //     onPressed: !_hasSpeech || speech.isListening
                    //     ? null
                    //     : startListening()),
                       ),
                  )],
              ),
            ),
            Padding(
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
              ),
            ),
            Padding(
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
            ),

            Container(
                padding: const EdgeInsets.only(top: 15),
                height: size.height / 3,
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
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )),

            Padding(
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
            ),
            Container(
                padding: const EdgeInsets.only(top: 15),
                height: size.height / 4,
                width: size.width / 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
  Future<void> initSpeechState() async {
    bool hasSpeech= await speech.initialize(
        onError: errorListener, onStatus: statusListener
    );
    if(!mounted) return;
    setState(() {
      _hasSpeech= hasSpeech;
    });
  }

  void statusListener(String status) {
    print(status);
  }
  void errorListener(SpeechRecognitionError errorNotification) {
  }

  startListening() async {
    PermissionStatus microStatus= await Permission.microphone.request();
    if(microStatus == PermissionStatus.granted){}
    if(microStatus == PermissionStatus.denied){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cần có quyền truy cập vào micro')));
    }
    if(microStatus == PermissionStatus.permanentlyDenied){
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
    if(result.finalResult)
      setState(() {
        outputText= result.recognizedWords;
      });
  }

  soundLevelListener(double level) {
    minSoundLevel= min(minSoundLevel, level);
    maxSoundLevel= max(maxSoundLevel, level);
    setState(() {
      this.level= level;
    });
  }

  // Widget _tan ({required String outputText, required VoidCallback onPressed}) =>
  //     new Row(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(left: 24),
  //           child: Icon(Icons.search),
  //         ),
  //         Expanded(
  //             child: TextField(
  //               decoration: InputDecoration(
  //                 hintText: outputText,
  //                 border: InputBorder.none,
  //                 suffixIcon: Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     InkWell(
  //                       child: Image.asset(
  //                         "assets/images/logo_ALS.png",
  //                         height: 20,
  //                         color: Colors.deepOrangeAccent,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             )),
  //         IconButton(
  //             icon: Icon(Icons.mic),
  //             onPressed:(){} )
  //       ],
  //     );
}

  Widget buildCardRecommend() => Expanded(
        child: Container(
      height: 200,
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

Widget buildCardCategory() => Expanded(
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
            'assets/images/baitap_tay.png',
            width: 300,
          ),
        ],
      ),
    ));

