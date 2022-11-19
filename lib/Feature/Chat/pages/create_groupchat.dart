import 'package:capstone_ui/Feature/Chat/pages/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../Bloc/groupchat/groupchat_bloc.dart';
import '../../../Constant/constant.dart';
import '../providers/database_service.dart';
import 'dart:io';

enum MediaType {
  image,
  video;
}

class CreateGroupChat extends StatefulWidget {
  final String userId;
  final String fullName;
  const CreateGroupChat(
      {super.key, required this.userId, required this.fullName});

  @override
  State<CreateGroupChat> createState() => _CreateGroupChatState();
}

class _CreateGroupChatState extends State<CreateGroupChat> {
  String groupName = "";
  bool _isLoading = false;
  late String? imagePath;
  MediaType _mediaType = MediaType.image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePath = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo nhóm trò chuyện'),
        backgroundColor: greenALS,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: imagePath == null
                        ? NetworkImage("assets/images/logo_ALS.png")
                            as ImageProvider
                        : FileImage(File(imagePath!)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pickMedia(ImageSource.gallery);
                    },
                    child: Text(
                      'Chọn ảnh',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            _isLoading == true
                ? Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor),
                  )
                : Column(
                    children: [
                      TextField(
                        onChanged: (val) {
                          setState(() {
                            groupName = val;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Tên nhóm',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (groupName != "") {
                              setState(() {
                                _isLoading = true;
                              });
                              var uuid = Uuid();
                              var groupId = uuid.v1().toString();
                              DatabaseService(uid: widget.userId)
                                  .createGroup(groupId, widget.fullName,
                                      widget.userId, groupName)
                                  .whenComplete(() {
                                _isLoading = false;
                              });
                              createdGroupChatRequest(
                                  groupId,
                                  widget.userId,
                                  groupName,
                                  'https://media.istockphoto.com/id/1313777915/vector/als-awareness-month-vector-banner-for-social-media-card-poster-illustration-with-text-als.jpg?s=612x612&w=0&k=20&c=VBng-6ApRQNU7Vn-pL6Uu4K0Tz7vIvB7nmRS_CezhNI=');

                              Navigator.of(context).pop();
                              showSnackbar(context, Colors.green,
                                  "Tạo nhóm thành công.");
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
                              'Tạo nhóm',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void createdGroupChatRequest(String groupId, String userId,
      String groupChatName, String groupChatImage) {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference =
        firebaseStorage.ref('upload-image-groupchat').child(fileName);
    context.read<GroupchatBloc>().add(GroupchatEvent.CreatedGroupChatRequest(
        groupId, userId, groupChatName, groupChatImage));
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
