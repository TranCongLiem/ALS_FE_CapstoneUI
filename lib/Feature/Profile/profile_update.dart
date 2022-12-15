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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  var imageUser;
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
    imageUser = widget.getProfileUserByIdResponeModel.imageUser.toString();
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
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            )),
                  )),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    "Cập nhật tài khoản",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Center(
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
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: imagePath == null
                                          ? NetworkImage(imageUser)
                                              as ImageProvider
                                          : FileImage(File(imagePath!)),
                                    )),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 55,
                                    width: 55,
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
                                      icon: Icon(
                                        Icons.edit,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          builder: (context) => Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 20.0),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  'Chọn ảnh từ',
                                                  style:
                                                      TextStyle(fontSize: 23.0),
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
                                                          pickMedia(ImageSource
                                                              .gallery);
                                                        },
                                                        icon: Icon(Icons.image),
                                                        label: Text(
                                                          'Thư viện',
                                                          style: TextStyle(
                                                              fontSize: 23),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                backgroundColor:
                                                                    greenALS)),
                                                    ElevatedButton.icon(
                                                      onPressed: () {
                                                        pickMedia(
                                                            ImageSource.camera);
                                                      },
                                                      icon: Icon(Icons.camera),
                                                      label: Text('Máy ảnh',
                                                          style: TextStyle(
                                                              fontSize: 23)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Họ tên',
                        style: TextStyle(fontSize: 22, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: fullNameController,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500),
                        onChanged: (value) {
                          fullName = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ',
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: addressController,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500),
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
    } else {
      context.read<UserBloc>().add(UserEvent.getImageUser(imageUser));
    }
    context.read<UserBloc>().add(UserEvent.getFullName(fullName!));
    context
        .read<AuthenticateBloc>()
        .add(AuthenticateEvent.fullNameChanged(fullName!));
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
