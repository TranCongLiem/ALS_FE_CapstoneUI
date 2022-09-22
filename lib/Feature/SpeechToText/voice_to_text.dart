// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:capstone_ui/Constant/constant.dart';
import 'package:clipboard/clipboard.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:flutter/material.dart';

class SpeechSampleApp extends StatefulWidget {
  const SpeechSampleApp({Key? key}) : super(key: key);

  @override
  State<SpeechSampleApp> createState() => _SpeechSampleAppState();
}

class _SpeechSampleAppState extends State<SpeechSampleApp> {
  String outputText = 'Xin mời nói...';
  final SpeechToText speech = SpeechToText();
  bool _hasSpeech = false;
  // ignore: prefer_final_fields
  String _currentLocaleId = 'vi_VN';
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  double level = 0.0;

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              // Text('Đã nhận diện: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
              // ignore: prefer_const_constructors
              Text('Chuyển giọng nói thành văn bản'),
          centerTitle: true,
          backgroundColor: greenALS,
          actions: [
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () async {
                    await FlutterClipboard.copy(outputText);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Đã sao chép")),
                    );
                  },
                  icon: Icon(Icons.content_copy));
            })
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  outputText,
                  style: TextStyle(
                    fontSize: 30.sp,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: .26,
                        spreadRadius: level * 1.5,
                        color: greenALS.withOpacity(.1))
                  ], borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: ElevatedButton(
                    onPressed: () {
                      !_hasSpeech || speech.isListening
                          ? null
                          : startListening();
                    },
                    // ignore: sort_child_properties_last
                    child: Icon(Icons.mic,
                        color: speech.isListening ? Colors.red : Colors.white,
                        size: 15.w),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                      primary: greenALS, // <-- Button color
                    ),
                  ),
                ),
                // SpeechStatusWidget(speech: speech)
              ],
            ),
          ),
        ),
      );
    });
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
        listenFor: Duration(seconds: 10),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
  }

  void resultListener(SpeechRecognitionResult result) {
    if (result.finalResult)
      // ignore: curly_braces_in_flow_control_structures
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Chưa phát hiện âm thanh',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}
