import 'dart:io';

import 'package:capstone_ui/Feature/Chat/pages/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Constant/constant.dart';
import '../constants/color_constants.dart';
import '../providers/chat_provider.dart';
import '../providers/database_service.dart';
import '../providers/group_chat_provider.dart';
import 'group_info.dart';
import 'message_tile.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
class GroupChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  final String userId;
  const GroupChatPage(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName,required this.userId})
      : super(key: key);

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messageController = TextEditingController();
  String admin = "43b6fcf9-b69b-40b0-93ab-87092eb25715";
   late stt.SpeechToText _speech;
  bool _isListening = false;
  String _textSpeech = '';
  File? imageFile;
  bool isLoading = false;
  final FocusNode focusNode = FocusNode();
  String imageUrl = "";
  bool isShowSticker = false;
  late GroupChatProvider groupchatProvider;
  @override
  void initState() {
    getChatandAdmin();
    super.initState();
     _speech = stt.SpeechToText();
  }

  getChatandAdmin() {
    DatabaseService().getChats(widget.groupId).then((val) {
      setState(() {
        chats = val;
      });
    });
    // DatabaseService().getGroupAdmin(widget.groupId).then((val) {
    //   setState(() {
    //     admin = val;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: greenALS.withOpacity(0.6),
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                    context,
                    GroupInfo(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      adminName: admin,
                    ));
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
                chatMessages(),
                 buildInput()
            ],
          )
          // chat messages here
        
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   width: MediaQuery.of(context).size.width,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.grey[700],
          //     child: Row(children: [
          //       Expanded(
          //           child: TextFormField(
          //         controller: messageController,
          //         style: const TextStyle(color: Colors.white),
          //         decoration: const InputDecoration(
          //           hintText: "Send a message...",
          //           hintStyle: TextStyle(color: Colors.white, fontSize: 16),
          //           border: InputBorder.none,
          //         ),
          //       )),
          //       const SizedBox(
          //         width: 12,
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           sendMessage();
          //         },
          //         child: Container(
          //           height: 50,
          //           width: 50,
          //           decoration: BoxDecoration(
          //             color: Theme.of(context).primaryColor,
          //             borderRadius: BorderRadius.circular(30),
          //           ),
          //           child: const Center(
          //               child: Icon(
          //             Icons.send,
          //             color: Colors.white,
          //           )),
          //         ),
          //       )
          //     ]),
          //   ),
          // )
         
        ],
      ),
    );
  }

  chatMessages() {
    return Flexible(
      child: StreamBuilder(
        stream: chats,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return MessageTile(
                        message: snapshot.data.docs[index]['message'],
                        sender: snapshot.data.docs[index]['sender'],
                        sentByMe: widget.userName ==
                            snapshot.data.docs[index]['sender'],
                        type: snapshot.data.docs[index]['type'],
                            );
                  },
                )
              : Container();
        },
      ),
    );
  }

  sendMessage(String message, int type) {
    if (message.trim().isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": message,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch,
        "type": type,
      };

      DatabaseService(uid: widget.userId).sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
      });
    } else{
       Fluttertoast.showToast(
          msg: 'Vui lòng soạn tin nhắn',
          backgroundColor: ColorConstants.greyColor);
    }
  }

   Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: Icon(Icons.image),
                onPressed: () =>
                    getImage(widget.userId, widget.userId),
                
                color: greenALS,
              ),
            ),
            color: Colors.white,
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: Icon(Icons.face),
                onPressed: (){},
                color: greenALS,
              ),
            ),
            color: Colors.white,
          ),

          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                onSubmitted: (value) {
                  // onSendMessage(textEditingController.text, '',
                  //     TypeMessage.text, widget.userId, widget.arguments.peerId);
                 
                },
                style:
                    TextStyle(color: ColorConstants.primaryColor, fontSize: 18),
                controller: messageController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Soạn tin nhắn...',
                  hintStyle: TextStyle(color: ColorConstants.greyColor),
                  suffixIcon: IconButton(
                    onPressed: (() {
                      // onListen();
                    }),
                    icon: Icon(
                      _speech.isListening ? Icons.mic : Icons.mic_none,
                      color: _speech.isListening ? greenALS : Colors.grey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  // _textSpeech = value;
                },
                
                autofocus: true,
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: greenALS,
                ),
                // onPressed: () => onSendMessage(textEditingController.text, '',
                //     TypeMessage.text, widget.userId, widget.arguments.peerId),
                onPressed: (() {
                   sendMessage(messageController.text, 0);
                }),
                color: ColorConstants.primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: ColorConstants.greyColor2, width: 0.5)),
          color: Colors.white),
    );
  }
  // void onListen() async {
  //   bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) => print('onError: $val'));

  //   if (!_isListening) {
  //     if (available) {
  //       setState(() {
  //         _isListening = false;
  //         _speech.listen(
  //           onResult: (val) => setState(() {
  //             _textSpeech = val.recognizedWords;
  //             messageController.text = val.recognizedWords;
  //           }),
  //         );
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _isListening = false;
  //       _speech.stop();
  //       print("Stop Listening");
  //     });
  //   }
  // }

  // void stopListen() {
  //   _speech.stop();
  //   setState(() {});
  // }

   Future getImage(String userIdFrom, String userIdTo) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        uploadFile();
      }
    }
  }
  void getSticker() {
    // Hide keyboard when sticker appear
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }
  Future uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref('upload-image-groupchat').child(fileName);
    UploadTask uploadTask = reference.putFile(imageFile!);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        sendMessage(imageUrl, 1);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }
 
}
