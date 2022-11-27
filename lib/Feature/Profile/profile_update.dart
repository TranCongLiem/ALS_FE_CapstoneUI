import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Chat/constants/firestore_constants.dart';
import 'package:capstone_ui/Feature/Chat/providers/chat_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Bloc/user/user_bloc.dart';
import '../../Model/getProfileUser_model.dart';
import 'profile_screen.dart';
import 'dart:io';

enum MediaType {
  image,
  video;
}

class ProfileUpdate extends StatefulWidget {
  final String userId;
  ProfileUpdate(
      {Key? key,
      required this.getProfileUserByIdResponeModel,
      required this.userId})
      : super(key: key);
  final GetProfileUserByIdResponeModel getProfileUserByIdResponeModel;
  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? fullName;
  String? address;
  late String? imagePath;
  late ChatProvider chatProvider;
  MediaType _mediaType = MediaType.image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatProvider = context.read<ChatProvider>();
    fullNameController.text =
        widget.getProfileUserByIdResponeModel.fullName.toString();
    addressController.text =
        widget.getProfileUserByIdResponeModel.address.toString();
    fullName = widget.getProfileUserByIdResponeModel.address.toString();
    address = widget.getProfileUserByIdResponeModel.address.toString();
    imagePath = null;
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.isUpdatedProfilePatient) {
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
                    context.read<UserBloc>().add(UserEvent.setStateFlase());
                    return Profile();
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
                      Fluttertoast.showToast(
                          msg: 'Cập nhật tài khoản thành công',
                          backgroundColor: greenALS.withOpacity(0.7));
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
    String _imagePath = imagePath ?? '';
    // await firebaseStorage
    //     .ref('upload-image-user')
    //     .child(userId)
    //     .child(_imagePath.substring(
    //         _imagePath.lastIndexOf('image_picker'), _imagePath.length))
    //     .putFile(File(_imagePath));
    Reference reference = 
        firebaseStorage.ref('upload-image-user')
        .child(userId)
        .child(_imagePath.substring(
            _imagePath.lastIndexOf('image_picker'), _imagePath.length));
    UploadTask uploadTask =  reference.putFile(File(imagePath!));
    TaskSnapshot snapshot = await uploadTask;
    String imageDatabase = await snapshot.ref.getDownloadURL();
    context.read<UserBloc>().add(UserEvent.getImageUser(imageDatabase));
    context.read<UserBloc>().add(UserEvent.getFullName(fullName!));
    context.read<AuthenticateBloc>().add(
                                      AuthenticateEvent.fullNameChanged(
                                          fullName!));
    context.read<UserBloc>().add(UserEvent.getAddress(address!));
    context
        .read<UserBloc>()
    .add(UserEvent.updateProfilePatientRequest(widget.userId));
    chatProvider.updateDataFirestore(
      FirestoreConstants.pathUserCollection,
      userId,
      {FirestoreConstants.nickname: fullName},
    );
  }
}
