import 'package:capstone_ui/Feature/Chat/pages/groupchat_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:uuid/uuid.dart';
import '../../../Bloc/groupchat/groupchat_bloc.dart';
import '../../../Constant/constant.dart';
import '../providers/database_service.dart';
import 'dart:io';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
  // bool _isLoading = false;
  String groupChatImage = '';
  File? imageFile;
  MediaType _mediaType = MediaType.image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> groupNameKey = GlobalKey();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _textSpeech = '';
  final TextEditingController groupNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
    groupNameController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Tạo nhóm trò chuyện',
            style: TextStyle(fontSize: 23),
          ),
          backgroundColor: greenALS,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupChatPage(
                            userId: widget.userId, fullName: widget.fullName)),
                  ))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
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
                              image: imageFile == null
                                  ? NetworkImage("assets/images/logo_ALS.png")
                                      as ImageProvider
                                  : FileImage(imageFile!),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                              ),
                              onPressed: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Chọn ảnh từ',
                                          style: TextStyle(fontSize: 24.0),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  pickMedia(
                                                      ImageSource.gallery);
                                                },
                                                icon: Icon(
                                                  Icons.image,
                                                  size: 35,
                                                ),
                                                label: Text(
                                                  'Thư viện',
                                                  style:
                                                      TextStyle(fontSize: 24),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(10),
                                                    backgroundColor: greenALS)),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                pickMedia(ImageSource.camera);
                                              },
                                              icon: Icon(
                                                Icons.camera,
                                                size: 35,
                                              ),
                                              label: Text(
                                                'Máy ảnh',
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.all(10),
                                                  backgroundColor: greenALS),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Column(
                  children: [
                    Form(
                      key: formKey,
                      child: TextFormField(
                        controller: groupNameController,
                        key: groupNameKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val) {
                          setState(() {
                            groupName = val;
                          });
                        },
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                        decoration: InputDecoration(
                          hintText: 'Tên nhóm',
                          hintStyle: TextStyle(fontSize: 24),
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
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: IconButton(
                            onPressed: (() {
                              onListen();
                            }),
                            icon: Icon(
                              _speech.isListening ? Icons.mic : Icons.mic_none,
                              color:
                                  _speech.isListening ? greenALS : Colors.grey,
                              size: 35,
                            ),
                          ),
                        ),
                        validator: (val) => validateGroupName(val!),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (groupName != "") {
                              var uuid = Uuid();
                              var groupId = uuid.v1().toString();
                              DatabaseService(uid: widget.userId)
                                  .createGroup(groupId, widget.fullName,
                                      widget.userId, groupName)
                                  .whenComplete(() {});
                              createdGroupChatRequest(
                                groupId,
                                widget.userId,
                                groupName,
                              );
                              // Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GroupChatPage(
                                        userId: widget.userId,
                                        fullName: widget.fullName)),
                              );
                              Fluttertoast.showToast(
                                  msg: 'Tạo nhóm thành công',
                                  backgroundColor: greenALS,
                                  fontSize: 18.0);
                            }
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
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? validateGroupName(String title) {
    if (title == null || title.isEmpty) {
      return 'Vui lòng điền tên nhóm';
    }
    return null;
  }

  void createdGroupChatRequest(
      String groupId, String userId, String groupChatName) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference =
        firebaseStorage.ref('upload-image-groupchat').child(fileName);
    UploadTask uploadTask = reference.putFile(imageFile!);
    TaskSnapshot snapshot = await uploadTask;
    groupChatImage = await snapshot.ref.getDownloadURL();
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
      imageFile = File(file.path);
      setState(() {});
    }
  }

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
              groupName = val.recognizedWords;
              groupNameController.text = val.recognizedWords;
            }),
          );
        });
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
        print("Stop Listening");
      });
    }
  }

  void stopListen() {
    _speech.stop();
    setState(() {});
  }
}
