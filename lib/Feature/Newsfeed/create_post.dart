import 'dart:io';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Bloc/authenticate/authenticate_bloc.dart';
import '../../Bloc/create_post/create_post_bloc.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Chat/constants/color_constants.dart';
import 'newfeeds.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

enum MediaType {
  image,
  video;
}

class CreatePostNewFeed extends StatefulWidget {
  const CreatePostNewFeed({super.key});

  @override
  State<CreatePostNewFeed> createState() => _CreatePostNewFeedState();
}

class _CreatePostNewFeedState extends State<CreatePostNewFeed> {
  late String? imagePath;
  MediaType _mediaType = MediaType.image;
  TextEditingController captionController = TextEditingController();

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
              captionController.text = val.recognizedWords;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePath = null;
    _speech = stt.SpeechToText();
    captionController.text = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _speech.cancel();
    captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return BlocConsumer<CreatePostBloc, CreatePostState>(
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
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    context
                        .read<CreatePostBloc>()
                        .add(CreatePostEvent.setStateFlase());
                    return NewFeed();
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xFF6ABF4B).withOpacity(0.7),
                        Color(0xffd2fbd2).withOpacity(0.7),
                      ], begin: Alignment.topCenter)),
                    ),
                    SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NewFeed()));
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    'Tạo bài viết',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://upload.wikimedia.org/wikipedia/commons/4/48/Outdoors-man-portrait_%28cropped%29.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Card(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: TextField(
                                              controller: captionController,
                                              maxLines: 3,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Bạn đang nghĩ gì...',
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                    onPressed: () async {
                                                      PermissionStatus
                                                          microStatus =
                                                          await Permission
                                                              .microphone
                                                              .request();
                                                      if (microStatus ==
                                                          PermissionStatus
                                                              .granted) {}
                                                      if (microStatus ==
                                                          PermissionStatus
                                                              .denied) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        'Yêu cầu cấp quyền truy cập vào micro')));
                                                      }
                                                      if (microStatus ==
                                                          PermissionStatus
                                                              .permanentlyDenied) {
                                                        openAppSettings();
                                                      }

                                                      onListen();
                                                    },
                                                    icon: Icon(
                                                      _speech.isListening
                                                          ? Icons.mic
                                                          : Icons.mic_none,
                                                      color: _speech.isListening
                                                          ? greenALS
                                                          : Colors.grey,
                                                    ),
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 24.0),
                                              onChanged: (value) {
                                                _textSpeech = value;
                                                // context
                                                //     .read<CreatePostBloc>()
                                                //     .add(CreatePostEvent
                                                //         .captionChanged(_textSpeech));
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.favorite,
                                                  color: greenALS,
                                                ),
                                                Icon(
                                                  Icons.favorite,
                                                  color: greenALS,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (imagePath != null)
                                    Card(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: Image.file(
                                          File(imagePath!),
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.grey[400],
                                  padding: EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      pickMedia(ImageSource.gallery);
                                    },
                                    icon: Icon(
                                      Icons.photo_library_outlined,
                                      color: Colors.white,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  color: Colors.grey[400],
                                  padding: EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () {
                                        pickMedia(ImageSource.camera);
                                      },
                                      icon: Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.white,
                                        size: 32.0,
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                onPressed: () {
                                  uploadImage(state2.userId);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: greenALS,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'ĐĂNG BÀI',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> uploadImage(String userId) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    try {
      String _imagePath = imagePath ?? '';
      String imageDatabase =
          'https://firebasestorage.googleapis.com/v0/b/als-vietnam.appspot.com/o/upload-image-firebase%2F' +
              _imagePath.substring(
                  _imagePath.lastIndexOf('image_picker'), _imagePath.length) +
              '?alt=media';
      await firebaseStorage
          .ref('upload-image-firebase')
          .child(_imagePath.substring(
              _imagePath.lastIndexOf('image_picker'), _imagePath.length))
          .putFile(File(_imagePath));
      context
          .read<CreatePostBloc>()
          .add(CreatePostEvent.imageChanged(imageDatabase));
      context
          .read<CreatePostBloc>()
          .add(CreatePostEvent.captionChanged(_textSpeech));
      context
          .read<CreatePostBloc>()
          .add(CreatePostEvent.createPostRequest(userId));

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Tạo bài viết thành công')));
    } catch (error) {
      print('Error occured while uploading to Firebase ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured while uploading'),
        ),
      );
    } finally {}
  }

  void pickMedia(ImageSource source) async {
    XFile? file;
    if (_mediaType == MediaType.image) {
      file = await ImagePicker()
          .pickImage(source: source, maxHeight: 480, maxWidth: 640);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file.path;
      setState(() {});
    }
  }
}
