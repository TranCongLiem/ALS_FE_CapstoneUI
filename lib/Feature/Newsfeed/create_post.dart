import 'dart:io';

import 'package:capstone_ui/Constant/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../Bloc/authenticate/authenticate_bloc.dart';
import '../../Bloc/create_post/create_post_bloc.dart';
import 'newfeeds.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePath = null;
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => NewFeed()));
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
                              padding: const EdgeInsets.only(bottom:10.0),
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
                                                  border: InputBorder.none),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                              onChanged: (value) {
                                                context
                                                    .read<CreatePostBloc>()
                                                    .add(CreatePostEvent
                                                        .captionChanged(
                                                            value));
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
                                                Icon(Icons.favorite, color: greenALS,),
                                                Icon(Icons.favorite, color: greenALS,),
                                                
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  if(imagePath != null)
                                      Card(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.3,
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
                                icon: Icon(Icons.photo_library_outlined, color: Colors.white, size: 32.0,),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Container(
                              color: Colors.grey[400],
                             padding: EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  pickMedia(ImageSource.camera);
                                },
                                icon: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 32.0,)
                              ),
                            ),
                              ],
                            ),
                           
                            Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                onPressed: () {
                                  uploadImage();
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
                // bottomNavigationBar: Container(
                //   height: 60.0,
                //   child: Row(
                //     children: <Widget>[
                //       IconButton(onPressed: () {}, icon: Icon(Icons.camera_enhance))
                //     ],
                //   ),
                // ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> uploadImage() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    try {
      String _imagePath = imagePath ?? '';
      String imageDatabase = 'https://firebasestorage.googleapis.com/v0/b/als-vietnam.appspot.com/o/upload-image-firebase%2F' + _imagePath.substring(
              _imagePath.lastIndexOf('image_picker'), _imagePath.length) + '?alt=media';
      await firebaseStorage
          .ref('upload-image-firebase')
          .child(_imagePath.substring(
              _imagePath.lastIndexOf('image_picker'), _imagePath.length))
          .putFile(File(_imagePath));
      context.read<CreatePostBloc>().add(CreatePostEvent.imageChanged(imageDatabase));
      context.read<CreatePostBloc>().add(CreatePostEvent.createPostRequest());
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
      file = await ImagePicker().pickImage(source: source, maxHeight: 480, maxWidth: 640);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file.path;
      setState(() {});
    }
  }
}
