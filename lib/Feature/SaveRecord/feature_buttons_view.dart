import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../Bloc/create_record/create_record_bloc.dart';

class FeatureButtonsView extends StatefulWidget {
  final Function onUploadComplete;
  const FeatureButtonsView({
    Key? key,
    required this.onUploadComplete,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      Icons.replay,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: _onRecordAgainButtonPressed,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: Icon(
                                        _isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 35.0,
                                        color: Colors.white),
                                    onPressed: _onPlayButtonPressed,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: Icon(Icons.save_alt,
                                        size: 35.0, color: Colors.white),
                                    onPressed: () => _onFileUploadButtonPressed(state2.userId),
                                  ),
                                ),
                              ],
                              onPressed: (int newindex) {
                                setState(() {
                                  for (int i = 0; i < isSelected.length; i++) {
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
                  : IconButton(
                      icon: _isRecording
                          ? Icon(
                              Icons.pause,
                              size: 35.0,
                            )
                          : Icon(
                              Icons.fiber_manual_record,
                              size: 35.0,
                            ),
                      onPressed: _onRecordButtonPressed,
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
