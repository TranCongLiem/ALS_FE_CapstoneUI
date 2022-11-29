import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../Bloc/create_record/create_record_bloc.dart';

class FeatureButtonsView extends StatefulWidget {
  final Function onUploadComplete;
  final String titleText;

  const FeatureButtonsView({
    Key? key,
    required this.onUploadComplete,
    required this.titleText,
  }) : super(key: key);
  @override
  _FeatureButtonsViewState createState() => _FeatureButtonsViewState();
}

class _FeatureButtonsViewState extends State<FeatureButtonsView> {
  List<bool> isSelected = [false, false, false];
  late bool _isPlaying;
  late bool _isUploading;
  late bool _isRecorded;
  late bool _isRecording;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late AudioPlayer _audioPlayer;
  late String _filePath;

  late FlutterAudioRecorder2 _audioRecorder;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _isUploading = false;
    _isRecorded = false;
    _isRecording = false;
    _audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return BlocConsumer<CreateRecordBloc, CreateRecordState>(
          listener: (context, state) {
            if (state.errorMessage != '' && state.errorMessage != null) {
              context
                  .read<CreateRecordBloc>()
                  .add(CreateRecordEvent.setErrorMessageRequested());
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      buttonPadding: EdgeInsets.all(10.0),
                      contentPadding: EdgeInsets.all(30.0),
                      title: Text(
                        'Xác nhận',
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'Tên ${state.recordName} đã tồn tại',
                        style: TextStyle(fontSize: 19.0),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('HỦY'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            context.read<CreateRecordBloc>().add(
                                CreateRecordEvent.createRecordConfirmedRequest(
                                    state2.userId));
                            Navigator.pop(context);
                          },
                          child: Text(
                            'TẠO',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            if (state.isCreated) {
              _onFileUploadButtonPressed(state.userId);
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
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    context
                        .read<CreateRecordBloc>()
                        .add(CreateRecordEvent.setStateFlase());
                    return HomeViewRecord();
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formkey,
              child: Center(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.replay,
                                    size: 35.0,
                                    color: Colors.white,
                                  ),
                                  onPressed: _onRecordAgainButtonPressed,
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: greenALS.withOpacity(0.9),
                                    padding: EdgeInsets.all(20.0),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                      _isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 35.0,
                                      color: Colors.white),
                                  onPressed: _onPlayButtonPressed,
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: greenALS.withOpacity(0.9),
                                    padding: EdgeInsets.all(20.0),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.save_alt,
                                      size: 35.0, color: Colors.white),
                                  onPressed: () {
                                    // validators:
                                    // (String? value) {
                                    //   if (value!.isEmpty)
                                    //     return 'Required field';
                                    // };
                                    context.read<CreateRecordBloc>().add(
                                        CreateRecordEvent.recordNameChanged(
                                            widget.titleText));
                                    context.read<CreateRecordBloc>().add(
                                        CreateRecordEvent.createRecordRequest(
                                            state2.userId));
                                  },
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: greenALS.withOpacity(0.9),
                                    padding: EdgeInsets.all(20.0),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                    : ElevatedButton.icon(
                        icon: _isRecording
                            ? Icon(
                                Icons.pause,
                                size: 35.0,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.fiber_manual_record,
                                size: 35.0,
                                color: Colors.red,
                              ),
                        onPressed: _onRecordButtonPressed,
                        label: Text(''),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          padding: EdgeInsets.only(
                              left: 25, top: 25, right: 25, bottom: 25),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(100.0)),
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onFileUploadButtonPressed(String userId) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    setState(() {
      _isUploading = true;
    });
    try {
      await firebaseStorage
          .ref('upload-voice-firebase')
          .child(userId)
          .child(
              _filePath.substring(_filePath.lastIndexOf('/'), _filePath.length))
          .putFile(File(_filePath));
      widget.onUploadComplete();
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

  void _onRecordAgainButtonPressed() {
    setState(() {
      _isRecorded = false;
    });
  }

  Future<void> _onRecordButtonPressed() async {
    if (_isRecording) {
      _audioRecorder.stop();
      _isRecording = false;
      _isRecorded = true;
    } else {
      _isRecorded = false;
      _isRecording = true;

      await _startRecording();
    }
    setState(() {});
  }

  void _onPlayButtonPressed() {
    if (!_isPlaying) {
      _isPlaying = true;

      _audioPlayer.play(_filePath, isLocal: true);
      _audioPlayer.onPlayerCompletion.listen((duration) {
        setState(() {
          _isPlaying = false;
        });
      });
    } else {
      _audioPlayer.pause();
      _isPlaying = false;
    }
    setState(() {});
  }

  Future<void> _startRecording() async {
    final bool? hasRecordingPermission =
        await FlutterAudioRecorder2.hasPermissions;

    if (hasRecordingPermission ?? false) {
      Directory directory = await getApplicationDocumentsDirectory();
      String filepath = DateTime.now().millisecondsSinceEpoch.toString();
      String filepath2 = directory.path + '/' + filepath + '.aac';
      _audioRecorder =
          FlutterAudioRecorder2(filepath2, audioFormat: AudioFormat.AAC);
      await _audioRecorder.initialized;
      _audioRecorder.start();
      _filePath = filepath2;
      context
          .read<CreateRecordBloc>()
          .add(CreateRecordEvent.linkAudioChanged(filepath));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(child: Text('Please enable recording permission'))));
    }
  }
}
