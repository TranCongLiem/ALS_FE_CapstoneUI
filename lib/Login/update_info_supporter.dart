import 'dart:io';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Feature/Chat/constants/firestore_constants.dart';
import 'package:capstone_ui/Feature/Supporter/Newsfeed/newfeeds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../Bloc/user/user_bloc.dart';
import '../Constant/constant.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

enum MediaType {
  image,
  video;
}

class RegisterInfoSupporter extends StatefulWidget {
  const RegisterInfoSupporter({super.key});

  @override
  State<RegisterInfoSupporter> createState() => _RegisterInfoSupporterState();
}

class _RegisterInfoSupporterState extends State<RegisterInfoSupporter> {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  late String? imagePath;
  MediaType _mediaType = MediaType.image;
  var imageUserDefault;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> usernameKey = GlobalKey();
  GlobalKey<FormFieldState> addressKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateOfBirthController.text = "";
    imagePath = null;
    imageUserDefault =
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.15752-9/287821475_1116111985634770_5760459797365277053_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=y9yeetAsLbkAX_tgPwb&_nc_ht=scontent.fsgn13-2.fna&oh=03_AdTS2V3z1huHJ0RnwERW_2QJecLOXsihyZXjKz7DAAblbA&oe=63C222D9";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isUpdatedInformationSupporter) {
          context
              .read<UserBloc>()
              .add(UserEvent.setStateFlaseInformationSupporter());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => new NewFeedSupporter()),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthenticateBloc, AuthenticateState>(
          builder: (context2, state2) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                    key: formkey,
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'HÃY CHO CHÚNG TÔI BIẾT THÊM VỀ BẠN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 2,
                                                  blurRadius: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: Offset(0, 10))
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: imagePath == null
                                                  ? NetworkImage(
                                                          imageUserDefault)
                                                      as ImageProvider
                                                  : FileImage(File(imagePath!)),
                                            )),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 4,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                              color: Colors.green,
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.edit),
                                              onPressed: () {
                                                showMaterialModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 20.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Chọn ảnh từ',
                                                          style: TextStyle(
                                                              fontSize: 20.0),
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
                                                                      ImageSource
                                                                          .gallery);
                                                                },
                                                                icon: Icon(Icons
                                                                    .image),
                                                                label: Text(
                                                                    'Thư viện'),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            greenALS)),
                                                            ElevatedButton.icon(
                                                              onPressed: () {
                                                                pickMedia(
                                                                    ImageSource
                                                                        .camera);
                                                              },
                                                              icon: Icon(
                                                                  Icons.camera),
                                                              label: Text(
                                                                  'Máy ảnh'),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          greenALS),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              color: Colors.white,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Họ tên',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600),
                                    )),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  key: usernameKey,
                                  style: TextStyle(
                                      fontSize: 24.0, color: Colors.black54),
                                  controller: fullNameController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.blue),
                                  ),
                                  onChanged: (value) {
                                    context
                                        .read<UserBloc>()
                                        .add(UserEvent.getFullName(value));
                                  },
                                  validator: (val) => validateUsername(val!),
                                )
                              ],
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Địa chỉ',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600),
                                    )),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  key: addressKey,
                                  controller: addressController,
                                  style: TextStyle(
                                      fontSize: 24.0, color: Colors.black54),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.blue),
                                  ),
                                  onChanged: (value) {
                                    context
                                        .read<UserBloc>()
                                        .add(UserEvent.getAddress(value));
                                  },
                                  validator: (val) => validateAddress(val!),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                uploadImage(state2.userId, state.fullName,
                                    state.imageUser);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: greenALS,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 10.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'BẮT ĐẦU THÔI',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> uploadImage(
      String userId, String fullName, String imageUser) async {
    if (imagePath != null) {
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = firebaseStorage
          .ref('upload-image-user')
          .child(userId)
          .child(fileName);
      UploadTask uploadTask = reference.putFile(File(imagePath!));
      TaskSnapshot snapshot = await uploadTask;
      String imageDatabase = await snapshot.ref.getDownloadURL();
      context.read<UserBloc>().add(UserEvent.getImageUser(imageDatabase));
    } else {
      context.read<UserBloc>().add(UserEvent.getImageUser(imageUserDefault));
    }

    uploadToFirebase(userId, fullName, imageUser);
  }

  Future<void> uploadToFirebase(
      String userId, String fullName, String imageUser) async {
    CollectionReference users = await FirebaseFirestore.instance
        .collection(FirestoreConstants.pathUserCollection);
    users.doc(userId).set({
      FirestoreConstants.nickname: fullName,
      FirestoreConstants.photoUrl: imageUser,
      FirestoreConstants.id: userId,
      'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      FirestoreConstants.chattingWith: null
    });
    context
        .read<UserBloc>()
        .add(UserEvent.updateInformationSupporterRequest(userId));
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

  String? validateUsername(String username) {
    if (username == null || username.isEmpty) {
      return 'Vui lòng nhập họ tên';
    } else if (username.length > 50) {
      return 'Vui lòng nhập 50 ký tự';
    }
    return null;
  }

  String? validateAddress(String address) {
    if (address == null || address.isEmpty) {
      return 'Vui lòng nhập địa chỉ';
    }
    return null;
  }
}
