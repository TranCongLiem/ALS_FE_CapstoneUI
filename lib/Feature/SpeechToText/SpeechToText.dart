// import 'package:flutter/material.dart';
// import 'package:highlight_text/highlight_text.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:clipboard/clipboard.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:url_launcher/url_launcher.dart';

// import 'utils.dart';

// class SpeechToText extends StatefulWidget {
//   const SpeechToText({Key? key}) : super(key: key);

//   @override
//   State<SpeechToText> createState() => _SpeechToTextState();
// }

// class _SpeechToTextState extends State<SpeechToText> {

//   final Map<String, HighlightedWord> _highlights = {
//     'gọi': HighlightedWord(
//       onTap: () async{
//         const uri = 'tel:+1 222 060 888';
//         if (await canLaunch(uri)) {
//           await launch(uri);
//         } else{
//           throw 'Could not launch $uri';
//         }
//       },
//       // textStyle: const TextStyle(
//       //   color: Colors.red,
//       //   fontWeight: FontWeight.bold,
//       // ),
//     ),
//   };

//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Chạm nút và bắt đầu nói';
//   double _confidence = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//         // Text('Đã nhận diện: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
//         Text('Chuyển giọng nói thành văn bản'),
//             centerTitle: true,
//             actions: [
//               Builder(
//                 builder: (context) {
//                   return IconButton(
//                       onPressed: () async {
//                         await FlutterClipboard.copy(_text);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Đã sao chép")),
//                         );
//                       },
//                       icon: Icon(Icons.content_copy)
//                   );
//                 }
//               )
//             ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: _isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 115.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 200),
//         repeat: _isListening,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/anh_web.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           reverse: true,
//           child: Container(
//             padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//             child: TextHighlight(
//               text: _text,
//               words: _highlights,
//               textStyle: const TextStyle(
//                 fontSize: 32.0,
//                 color: Colors.black
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void _listen() async {
//     PermissionStatus microStatus= await Permission.microphone.request();
//     if(microStatus == PermissionStatus.granted){}
//     if(microStatus == PermissionStatus.denied){
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cần có quyền truy cập vào micro')));
//     }
//     if(microStatus == PermissionStatus.permanentlyDenied){
//       openAppSettings();
//     }
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       Future.delayed(Duration(seconds: 1), () {
//         Utils.scanText(_text);
//       });
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//       }

//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
// }