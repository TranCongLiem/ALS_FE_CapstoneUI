import 'dart:math';

import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:request_permission/request_permission.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../Newsfeed/newfeeds.dart';
import 'cloud_record_list_view.dart';
import 'feature_buttons_view.dart';

class SaveRecording extends StatefulWidget {
  const SaveRecording({Key? key}) : super(key: key);

  @override
  State<SaveRecording> createState() => _SaveRecordingState();
}

class _SaveRecordingState extends State<SaveRecording> {
  TextEditingController textEditingController = TextEditingController();
  List<bool> isSelected = [true, false];
  List<Reference> references = [];
  RequestPermission requestPermission = RequestPermission.instace;

  //voice-to-text
  String outputText = 'Mô tả';
  final SpeechToText speech = SpeechToText();
  bool _hasSpeech = false;
  String _currentLocaleId = 'vi_VN';
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  double level = 0.0;
  @override
  void initState() {
    super.initState();
    isSelected = [true, false];
    _onUploadComplete();
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Tạo bản ghi'),
        backgroundColor: greenALS,
        // iconTheme: IconThemeData(color: Colors.black, size: 30.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Bạn sẽ tạo bản ghi bằng:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ToggleButtons(
                fillColor: Colors.grey,
                borderWidth: 2,
                selectedBorderColor: greenALS,
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Văn bản',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Giọng nói',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
            if (isSelected[0]) getGraphWidget(), //văn bản
            if (isSelected[1]) getGraphWidget2(), //giọng nói
          ],
        ),
      ),
    ));
  }

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    setState(() {
      references = listResult.items;
    });
  }

  Widget getGraphWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(
                    labelText: outputText,
                    suffixIcon: Icon(Icons.type_specimen),
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                    labelStyle: TextStyle(fontSize: 20.0))),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: "Nhập nội dung",
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  labelStyle: TextStyle(fontSize: 20.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text("Lưu trữ"),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                primary: greenALS,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getGraphWidget2() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: outputText,
                  suffixIcon: voice(),
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  labelStyle: TextStyle(fontSize: 20.0)),
              onChanged: (value) {
                // context
                //     .read<CreateRecordBloc>()
                //     .add(CreateRecordEvent.recordNameChanged(value));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                requestPermission.requestAndroidPermission(
                    "android.permission.RECORD_AUDIO");
              },
              style: ElevatedButton.styleFrom(
                  // backgroundColor: greenALS,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: FeatureButtonsView(
                onUploadComplete: _onUploadComplete,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget voice() {
    return ElevatedButton(
      onPressed: () {
        !_hasSpeech || speech.isListening ? null : startListening();
      },
      // ignore: sort_child_properties_last
      child: Icon(Icons.mic,
          color: speech.isListening ? Colors.red : Colors.white, size: 25),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(7.0),
        primary: greenALS, // <-- Button color
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: greenALS,
          width: 2,
        ));
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
