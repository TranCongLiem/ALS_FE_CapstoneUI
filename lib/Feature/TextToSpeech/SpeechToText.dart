import 'package:flutter/material.dart';

class SpeechToText extends StatefulWidget {
  const SpeechToText({Key? key}) : super(key: key);

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  // final Map<String, HighlightedWord> _highlights = {
  //   'flutter': HighlightedWord(
  //     onTap: () => print('flutter'),
  //     textStyle: const TextStyle(
  //       color: Colors.blue,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'voice': HighlightedWord(
  //     onTap: () => print('voice'),
  //     textStyle: const TextStyle(
  //       color: Colors.green,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'subscribe': HighlightedWord(
  //     onTap: () => print('subscribe'),
  //     textStyle: const TextStyle(
  //       color: Colors.red,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'like': HighlightedWord(
  //     onTap: () => print('like'),
  //     textStyle: const TextStyle(
  //       color: Colors.blueAccent,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   'comment': HighlightedWord(
  //     onTap: () => print('comment'),
  //     textStyle: const TextStyle(
  //       color: Colors.green,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  // };

  // late stt.SpeechToText _speech;
  // bool _isListening= false;
  // String _text= 'Pres the button and start speaking';
  // double _confidence= 1.0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _speech= stt.SpeechToText();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Image.asset(
            'assets/images/logo_ALS.png',
            width: 100,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffffffff),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.keyboard_voice),
      ),


    );
  }
  // void _listen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) => print('onError: $val'),
  //     );
  //     if (available) {
  //       setState(() => _isListening = true);
  //       _speech.listen(
  //         onResult: (val) => setState(() {
  //           _text = val.recognizedWords;
  //           if (val.hasConfidenceRating && val.confidence > 0) {
  //             _confidence = val.confidence;
  //           }
  //         }),
  //       );
  //     }
  //   } else {
  //     setState(() => _isListening = false);
  //     _speech.stop();
  //   }
  // }
}
