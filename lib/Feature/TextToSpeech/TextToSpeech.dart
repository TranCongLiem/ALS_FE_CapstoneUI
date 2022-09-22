import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuyển văn bản thành giọng nói'),
        backgroundColor: greenALS,
      ),
      body: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditingController = TextEditingController();
  speak(String text) async {
    await flutterTts.setLanguage("vi-VN");
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/anh_web.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                maxLines: 5,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Nhập để nói',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 10, color: greenALS),
                    )),
                controller: textEditingController,
                style: TextStyle(fontSize: 32.0, color: Colors.black),
              ),
            ),
          ),
          Text(
            'Lịch sử',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          saveText(),
          ElevatedButton(
            child: Text("Nhấn để phát"),
            onPressed: () => speak(textEditingController.text),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget saveText() => Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('1'),
          );
        },
      ),
    );
