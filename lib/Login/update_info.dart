import 'dart:io';

import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/profile_widget_imagenull.dart';
import 'package:capstone_ui/Feature/Newsfeed/newfeeds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../Bloc/user/user_bloc.dart';
import '../Constant/constant.dart';
import '../Feature/Chat/constants/firestore_constants.dart';

enum MediaType {
  image,
  video;
}

class RegisterInfo extends StatefulWidget {
  const RegisterInfo({super.key});

  @override
  State<RegisterInfo> createState() => _RegisterInfoState();
}

class _RegisterInfoState extends State<RegisterInfo> {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  late String? imagePath;
  MediaType _mediaType = MediaType.image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateOfBirthController.text = "";
    imagePath = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isUpdatedInformationPatient) {
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
                context.read<UserBloc>().add(UserEvent.setStateFlase());
                return NewFeed();
              },
            ),
          );
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
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundImage: imagePath == null
                                          ? AssetImage(
                                                  "assets/images/logo_Avatar.jpg")
                                              as ImageProvider
                                          : FileImage(File(imagePath!)),
                                    ),
                                    Positioned(
                                        bottom: 20.0,
                                        right: 20.0,
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                              // showBottomSheet(
                                              //     context: context,
                                              //     builder: ((builder) =>
                                              //         bottomSheet()));
                                              pickMedia(ImageSource.gallery);
                                            },
                                            icon: Icon(Icons.camera_alt),
                                            label: Text('Edit')))
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
                              TextField(
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
                              TextField(
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
                                    'Ngày sinh',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextField(
                                readOnly: true,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black54),
                                controller: dateOfBirthController,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: greenALS),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.calendar_month,
                                        size: 35.0,
                                      ),
                                      onPressed: () {
                                        DatePicker.showDatePicker(context,
                                            showTitleActions: true,
                                            minTime: DateTime(1900, 1, 1),
                                            maxTime: DateTime(2100, 1, 1),
                                            theme: DatePickerTheme(
                                                containerHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.3,
                                                cancelStyle: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18.0),
                                                headerColor: greenALS,
                                                backgroundColor: Colors.white,
                                                itemStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0),
                                                doneStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22.0)),
                                            onChanged: (date) {
                                          dateOfBirthController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date);
                                          print('TNT' +
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date)
                                                  .toString());
                                          context.read<UserBloc>().add(
                                              UserEvent.getdateOfBirth(
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(date)
                                                      .toString()));
                                        }, onConfirm: (date) {
                                          setState(() {
                                            dateOfBirthController.text =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(date);
                                          });
                                        },
                                            // currentTime: DateTime.now(),
                                            locale: LocaleType.vi);
                                      },
                                    )),
                              ),
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
                                    'Tình trạng',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextField(
                                controller: conditionController,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.black54),
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.blue),
                                ),
                                onChanged: (value) {
                                  context
                                      .read<UserBloc>()
                                      .add(UserEvent.getcondition(value));
                                },
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            uploadImage();
                            uploadToFirebase(
                                state2.userId, state.fullName, state.imageUser);
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
            );
          },
        );
      },
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Chọn ảnh',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.camera),
                  label: Text('Máy ảnh')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.image),
                  label: Text('Thư viện'))
            ],
          )
        ],
      ),
    );
  }

  Future<void> uploadImage() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    String _imagePath = imagePath ?? '';
    String imageDatabase =
        'https://firebasestorage.googleapis.com/v0/b/als-vietnam.appspot.com/o/upload-image-firebase%2F' +
            _imagePath.substring(
                _imagePath.lastIndexOf('image_picker'), _imagePath.length) +
            '?alt=media';
    await firebaseStorage
        .ref('upload-image-user')
        .child(_imagePath.substring(
            _imagePath.lastIndexOf('image_picker'), _imagePath.length))
        .putFile(File(_imagePath));
    context.read<UserBloc>().add(UserEvent.getImageUser(imageDatabase));
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
        .add(UserEvent.updateInformationPatientRequest(userId));
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
