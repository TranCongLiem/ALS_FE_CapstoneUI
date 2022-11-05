import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';

import '../../Bloc/create_record/create_record_bloc.dart';

class FeatureButtonsViewTextFunction extends StatefulWidget {
  final Function onUploadComplete;
  final String speakText;
  const FeatureButtonsViewTextFunction({
    Key? key,
    required this.onUploadComplete,required this.speakText,
  }) : super(key: key);
  @override
  _FeatureButtonsViewTextFunctionState createState() =>
      _FeatureButtonsViewTextFunctionState();
}

class _FeatureButtonsViewTextFunctionState
    extends State<FeatureButtonsViewTextFunction> {
  List<bool> isSelected = [false, false];
  late bool _isPlaying;
  late bool _isUploading;
  late bool _isRecorded;
  late bool _isRecording;
  final FlutterTts flutterTts = FlutterTts();

  late AudioPlayer _audioPlayer;
  late String _filePath;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _isUploading = false;
    _isRecorded = false;
    _isRecording = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return BlocConsumer<CreateRecordBloc, CreateRecordState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
                child: _isRecorded
                    ? _isUploading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: LinearProgressIndicator()),
                              Text('Đang lưu trữ...'),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ToggleButtons(
                                fillColor: Colors.grey,
                                borderWidth: 1,
                                selectedBorderColor: greenALS,
                                selectedColor: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                borderColor: Colors.white,
                                // ignore: sort_child_properties_last
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Icon(
                                          _isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          size: 35.0,
                                          color: Colors.white),
                                      onPressed:(){
                                         speak(widget.speakText);
                                      }
                                         
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Icon(Icons.save_alt,
                                          size: 35.0, color: Colors.white),
                                      onPressed: () =>
                                          _onFileUploadButtonPressed(
                                              state2.userId),
                                    ),
                                  ),
                                ],
                                onPressed: (int newindex) {
                                  setState(() {
                                    for (int i = 0;
                                        i < isSelected.length;
                                        i++) {
                                      if (i == newindex)
                                        isSelected[i] = !isSelected[i];
                                      else {
                                        isSelected[i] = false;
                                      }
                                    }
                                  });
                                },
                                isSelected: isSelected,
                              ),
                            ],
                          )
                    : ElevatedButton(
                        onPressed: () {
                          _onRecordButtonPressed(widget.speakText);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: greenALS,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300),
                        ),
                        child: Text('Phat'),
                      ));
          },
        );
      },
    );
  }

  Future<void> _onRecordButtonPressed(String text) async {
    if (!_isRecording) {
      _isRecorded = true;
      _isRecording = true;
      await speak(text);
      setState(() {});
    }
  }

  speak(String text1) async {
    String filepath = DateTime.now().millisecondsSinceEpoch.toString();
    String filepath2 = filepath + '.aac';
    await flutterTts.setLanguage("vi-VN");
    await flutterTts.speak(text1);
    await flutterTts.synthesizeToFile(text1, filepath2);
    _filePath = filepath2;
    context
        .read<CreateRecordBloc>()
        .add(CreateRecordEvent.linkAudioChanged(filepath));
  }

  Future<void> _onFileUploadButtonPressed(String userId) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    setState(() {
      _isUploading = true;
    });
    try {
      String filepath = '/storage/emulated/0/Android/data/com.example.capstone_ui/files/' + _filePath;
      await firebaseStorage
          .ref('upload-voice-firebase')
          .child(userId)
          .child(
              filepath.substring(filepath.lastIndexOf('/'), filepath.length))
          .putFile(File(filepath));
      widget.onUploadComplete();
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

  void _onSpeakAgainButtonPressed() {
    setState(() {
      speak(widget.speakText);
    });
  }
}
