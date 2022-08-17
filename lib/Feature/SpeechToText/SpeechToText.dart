import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SpeechToText extends StatefulWidget {
  const SpeechToText({Key? key}) : super(key: key);

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giọng nói thành văn bản'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          PermissionStatus microStatus= await Permission.microphone.request();
          if(microStatus == PermissionStatus.granted){

          }
          if(microStatus == PermissionStatus.denied){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This permission is recommend')));
          }
          if(microStatus == PermissionStatus.permanentlyDenied){
            openAppSettings();
          }
        },
        child: Icon(Icons.keyboard_voice),

      ),


    );
  }
}
