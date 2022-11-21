import 'dart:io';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/feature_buttons_view_text.dart';
import 'package:capstone_ui/Feature/SaveRecord/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
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

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: _textSpeech,
                        suffixIcon: Icon(Icons.type_specimen),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                        labelStyle: TextStyle(fontSize: 20.0)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng không bỏ trống';
                      } else if (value.length > 50) {
                        return 'Vui lòng không nhập hơn 50 ký tự';
                      } else {
                        return null;
                      }
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng không bỏ trống';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FeatureButtonsViewTextFunction(
                      onUploadComplete: _onUploadComplete,
                      speakText: textEditingController.text.toString(),
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
            child: FeatureButtonsView(
              onUploadComplete: _onUploadComplete,
              titleText: _textSpeech,
            ),
          ),
        ],
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

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not validated');
    }
  }
}
