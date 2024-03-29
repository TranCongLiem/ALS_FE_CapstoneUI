import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Supporter/Profile/profile_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Bloc/user/user_bloc.dart';
import 'dart:io';

import '../../../Model/getProfileUser_model.dart';

enum MediaType {
  image,
  video;
}

class ProfileUpdateSupporter extends StatefulWidget {
  final String userId;
  ProfileUpdateSupporter(
      {Key? key,
      required this.getProfileUserByIdResponeModel,
      required this.userId})
      : super(key: key);
  final GetProfileUserByIdResponeModel getProfileUserByIdResponeModel;
  @override
  State<ProfileUpdateSupporter> createState() => _ProfileUpdateSupporterState();
}

class _ProfileUpdateSupporterState extends State<ProfileUpdateSupporter> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? fullName;
  String? address;
  late String? imagePath;
  MediaType _mediaType = MediaType.image;
  String? imageUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController.text =
        widget.getProfileUserByIdResponeModel.fullName.toString();
    addressController.text =
        widget.getProfileUserByIdResponeModel.address.toString();
    fullName = widget.getProfileUserByIdResponeModel.fullName.toString();
    address = widget.getProfileUserByIdResponeModel.address.toString();
    imageUser = widget.getProfileUserByIdResponeModel.imageUser.toString();
    imagePath = null;
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.isUpdatedProfileSupporter) {
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
                        .read<UserBloc>()
                        .add(UserEvent.setStateFlaseSupporter());
                    return ProfileSupporter();
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: BackButton(color: Colors.white),
                backgroundColor: greenALS,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      uploadInfo(widget.userId);
                    },
                    child: Text(
                      'Lưu',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  )
                ],
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: imagePath == null
                              ? NetworkImage(widget
                                  .getProfileUserByIdResponeModel
                                  .imageUser!) as ImageProvider
                              : FileImage(File(imagePath!)),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              pickMedia(ImageSource.gallery);
                            },
                            child: Text('Chọn ảnh'))
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Họ tên',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        maxLines: 1,
                        style: TextStyle(fontSize: 26),
                        onChanged: (value) {
                          fullName = value;
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        maxLines: 1,
                        style: TextStyle(fontSize: 26),
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                    ],
                  ),
                  //   context
                  //       .read<UserBloc>()
                  //       .add(UserEvent.getAddress(value));
                  // },
                  // ),
                ],
              ),
            );
          },
        ),
      );
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

  Future<void> uploadInfo(String userId) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    if (imagePath != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = firebaseStorage
          .ref('upload-image-user')
          .child(userId)
          .child(fileName);
      UploadTask uploadTask = reference.putFile(File(imagePath!));
      TaskSnapshot snapshot = await uploadTask;
      String imageDatabase = await snapshot.ref.getDownloadURL();
      context.read<UserBloc>().add(UserEvent.getImageUser(imageDatabase));
    }else{
      context.read<UserBloc>().add(UserEvent.getImageUser(imageUser!));
    }
    context.read<UserBloc>().add(UserEvent.getFullName(fullName!));
    context.read<UserBloc>().add(UserEvent.getAddress(address!));
    context
        .read<UserBloc>()
        .add(UserEvent.updateProfileSupporterRequest(widget.userId));
  }
}
