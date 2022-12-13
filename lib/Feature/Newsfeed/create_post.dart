import 'dart:io';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Bloc/authenticate/authenticate_bloc.dart';
import '../../Bloc/create_post/create_post_bloc.dart';
import 'newfeeds.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

enum MediaType {
  image,
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
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                        child: Form(
                          key: formkey,
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
                                          // validate();
                                          if ((imagePath != null) ||
                                              !(formkey.currentState!
                                                  .validate())) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Scaffold(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  body: AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    buttonPadding:
                                                        EdgeInsets.all(10.0),
                                                    contentPadding:
                                                        EdgeInsets.all(30.0),
                                                    title: Text(
                                                      'Xác nhận',
                                                      style: TextStyle(
                                                          fontSize: 21.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                      'Bạn muốn xóa nội dung đang tạo?',
                                                      style: TextStyle(
                                                          fontSize: 19.0),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('HỦY'),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors.red),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          NewFeed()));
                                                        },
                                                        child: Text(
                                                          'XÓA',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewFeed()));
                                          }
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 35,
                                        )),
                                    Text(
                                      'Tạo nội dung',
                                      style: TextStyle(
                                          fontSize: 24.0,
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
                                                image: AssetImage(
                                                    "assets/images/logo_als2.png"),
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
                                              child: TextFormField(
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
                                                        color:
                                                            _speech.isListening
                                                                ? greenALS
                                                                : Colors.grey,
                                                        size: 35,
                                                      ),
                                                    )),
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 24.0),
                                                onChanged: (value) {
                                                  _textSpeech = value;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return null;
                                                  } else {
                                                    return '';
                                                  }
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
                                                  ElevatedButton.icon(
                                                    onPressed: () {
                                                      showMaterialModalBottomSheet(
                                                        context: context,
                                                        builder: (context) =>
                                                            Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.0,
                                                                  vertical:
                                                                      20.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                'Chọn ảnh',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        24.0),
                                                              ),
                                                              SizedBox(
                                                                height: 20.0,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  ElevatedButton.icon(
                                                                      onPressed: () {
                                                                        pickMedia(
                                                                            ImageSource.gallery);
                                                                      },
                                                                      icon: Icon(Icons.image),
                                                                      label: Text('Thư viện', style: TextStyle(fontSize: 24)),
                                                                      style: ElevatedButton.styleFrom(backgroundColor: greenALS, padding: EdgeInsets.all(10))),
                                                                  ElevatedButton
                                                                      .icon(
                                                                    onPressed:
                                                                        () {
                                                                      pickMedia(
                                                                          ImageSource
                                                                              .camera);
                                                                    },
                                                                    icon: Icon(Icons
                                                                        .camera),
                                                                    label: Text(
                                                                      'Máy ảnh',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              24),
                                                                    ),
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            greenALS,
                                                                        padding:
                                                                            EdgeInsets.all(10)),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    label: Text(
                                                      'Thêm ảnh',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    ),
                                                    icon: Icon(Icons
                                                        .add_a_photo_rounded),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                greenALS,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10)),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      if (imagePath != null) {
        Reference reference = firebaseStorage
            .ref('upload-image-firebase')
            .child(userId)
            .child(fileName);
        UploadTask uploadTask = reference.putFile(File(imagePath!));
        TaskSnapshot snapshot = await uploadTask;
        String imageDatabase = await snapshot.ref.getDownloadURL();
        context
            .read<CreatePostBloc>()
            .add(CreatePostEvent.imageChanged(imageDatabase));
      } else {
        context.read<CreatePostBloc>().add(CreatePostEvent.imageChanged(''));
      }
      context
          .read<CreatePostBloc>()
          .add(CreatePostEvent.captionChanged(_textSpeech));
      context
          .read<CreatePostBloc>()
          .add(CreatePostEvent.createPostRequest(userId));

      Fluttertoast.showToast(msg: 'Tạo nội dung thành công');
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

  void validate() {
    if (formkey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewFeed()));
    } else {
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
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
              content: Text(
                'Bạn muốn xóa nội dung đang tạo?',
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewFeed()));
                  },
                  child: Text(
                    'XÓA',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
