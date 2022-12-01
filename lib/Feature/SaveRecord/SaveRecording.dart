import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/feature_buttons_view_text.dart';
import 'package:capstone_ui/Feature/SaveRecord/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../Bloc/create_record/create_record_bloc.dart';
import 'feature_buttons_view.dart';

class SaveRecording extends StatefulWidget {
  const SaveRecording({Key? key}) : super(key: key);

  @override
  State<SaveRecording> createState() => _SaveRecordingState();
}

class _SaveRecordingState extends State<SaveRecording> {
  late bool _isUploading;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  List<bool> isSelected = [false, true];
  List<Reference> references = [];

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _textSpeech = '';

  void onListen() async {
    bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'));

    if (!_isListening) {
      if (available) {
        setState(() {
          _isListening = false;
          _speech.listen(
            onResult: (val) => setState(() {
              _textSpeech = val.recognizedWords;
              titleController.text = val.recognizedWords;
            }),
          );
        });
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
        print("Stop Lítening");
      });
    }
  }

  void stopListen() {
    _speech.stop();
    setState(() {});
  }

  //voice-to-text
  // String outputText = 'Mô tả';
  // final SpeechToText speech = SpeechToText();
  // bool _hasSpeech = false;
  // String _currentLocaleId = 'vi_VN';
  // double minSoundLevel = 50000;
  // double maxSoundLevel = -50000;
  // double level = 0.0;
  @override
  void initState() {
    super.initState();
    isSelected = [false, true];
    _onUploadComplete();
    _isUploading = false;
    _speech = stt.SpeechToText();
    titleController.text = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _speech.cancel();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return BlocConsumer<CreateRecordBloc, CreateRecordState>(
            listener: (context, state) {
          if (state.isCreated) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.1, end: 1).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.bounceIn,
                      ),
                    ),
                    child: child,
                  );
                },
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  context
                      .read<CreateRecordBloc>()
                      .add(CreateRecordEvent.setStateFlase());
                  return HomeViewRecord();
                },
              ),
            );
          }
        }, builder: (context, state) {
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
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w500),
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
                  if (isSelected[0]) getGraphWidget(state2.userId.toString()),
                  //văn bản
                  if (isSelected[1]) getGraphWidget2(), //giọng nói
                ],
              ),
            ),
          ));
        });
      },
    );
  }

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    setState(() {
      references = listResult.items;
    });
  }

  Widget getGraphWidget(String userId) {
    return BlocConsumer<CreateRecordBloc, CreateRecordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
          child: ListView(
            children: 
              [Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: _textSpeech,
                          suffixIcon: Icon(Icons.type_specimen),
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          labelStyle: TextStyle(fontSize: 20.0)),
                      onChanged: (value) {
                        context
                            .read<CreateRecordBloc>()
                            .add(CreateRecordEvent.recordNameChanged(value));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: textEditingController,
                      maxLines: 2,
                      decoration: InputDecoration(
                          labelText: "Nhập nội dung",
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          labelStyle: TextStyle(fontSize: 20.0)),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          //  speak(textEditingController.text, userId);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 30),
                          primary: greenALS,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300),
                        ),
                        child: FeatureButtonsViewTextFunction(
                          onUploadComplete: _onUploadComplete,
                          speakText: textEditingController.text.toString(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  speak(String text, String userId) async {
    String filepath = DateTime.now().millisecondsSinceEpoch.toString();
    String filepath2 = filepath + '.aac';
    await flutterTts.setLanguage("vi-VN");
    await flutterTts.speak(text);
    setState(() {
      flutterTts.synthesizeToFile(text, filepath2);
    });
    await _onFileUploadButtonPressed(filepath2, userId);
    context
        .read<CreateRecordBloc>()
        .add(CreateRecordEvent.linkAudioChanged(filepath));
  }

  Widget getGraphWidget2() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (() {
                      onListen();
                    }),
                    icon: Icon(Icons.mic),
                  ),
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  labelStyle: TextStyle(fontSize: 20.0)),
              onChanged: (value) {
                _textSpeech = value;
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
                // requestPermission.requestAndroidPermission(
                //     "android.permission.RECORD_AUDIO");
              },
              style: ElevatedButton.styleFrom(
                  // backgroundColor: greenALS,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: FeatureButtonsView(
                onUploadComplete: _onUploadComplete,
                titleText: _textSpeech,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget voice() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       !_hasSpeech || speech.isListening ? null : startListening();
  //     },
  //     // ignore: sort_child_properties_last
  //     child: Icon(Icons.mic,
  //         color: speech.isListening ? Colors.red : Colors.white, size: 25),
  //     style: ElevatedButton.styleFrom(
  //       shape: CircleBorder(),
  //       padding: EdgeInsets.all(7.0),
  //       primary: greenALS, // <-- Button color
  //     ),
  //   );
  // }

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

  // Future<void> initSpeechState() async {
  //   bool hasSpeech = await speech.initialize(
  //       onError: errorListener, onStatus: statusListener);
  //   if (!mounted) return;
  //   setState(() {
  //     _hasSpeech = hasSpeech;
  //   });
  // }

  // void statusListener(String status) {
  //   print(status);
  // }

  // void errorListener(SpeechRecognitionError errorNotification) {}

  // startListening() async {
  //   PermissionStatus microStatus = await Permission.microphone.request();
  //   if (microStatus == PermissionStatus.granted) {}
  //   if (microStatus == PermissionStatus.denied) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Cần có quyền truy cập vào micro')));
  //   }
  //   if (microStatus == PermissionStatus.permanentlyDenied) {
  //     openAppSettings();
  //   }
  //   speech.listen(
  //       onResult: resultListener,
  //       listenFor: Duration(seconds: 4),
  //       partialResults: true,
  //       localeId: _currentLocaleId,
  //       onSoundLevelChange: soundLevelListener,
  //       cancelOnError: true,
  //       listenMode: ListenMode.confirmation);
  // }

  // void resultListener(SpeechRecognitionResult result) {
  //   if (result.finalResult)
  //     setState(() {
  //       outputText = result.recognizedWords;
  //       titleController.text = result.recognizedWords;
  //     });
  // }

  // soundLevelListener(double level) {
  //   minSoundLevel = min(minSoundLevel, level);
  //   maxSoundLevel = max(maxSoundLevel, level);
  //   setState(() {
  //     this.level = level;
  //   });
  // }

  Future<void> _onFileUploadButtonPressed(
      String filepath, String userId) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    setState(() {
      _isUploading = true;
    });
    try {
      print('TNT' + filepath.trim());
      String filepath3 =
          '/storage/emulated/0/Android/data/com.example.capstone_ui/files/' +
              '1667639447029.aac';
      await firebaseStorage
          .ref()
          .child('upload-voice-firebase')
          .child(userId)
          .child(
              filepath3.substring(filepath3.lastIndexOf('/'), filepath3.length))
          .putFile(File(filepath3));
      context
          .read<CreateRecordBloc>()
          .add(CreateRecordEvent.createRecordRequest(userId));
    } catch (error) {
      print('Error occured while uploading to Firebase ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured while uploading'),
        ),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }
}
