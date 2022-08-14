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
      backgroundColor: const Color(0xffD9D9D9),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Image.asset('assets/images/logo_ALS.png', width: 100,),
          centerTitle: true,
          backgroundColor: const Color(0xffffffff),
        ),
      ),
      body: Home(),
    );
  }
}
class Home extends StatelessWidget{
  final FlutterTts flutterTts= FlutterTts();
  TextEditingController textEditingController= TextEditingController();
  speak(String text) async{
    await flutterTts.setLanguage("vi-VN");
    await flutterTts.speak(text);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Nhập để nói',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 10,
                        )

                    )
                ),
                controller: textEditingController,
              ),
            ),
            ElevatedButton(
              child: Text("Nhấn để phát"),
              onPressed: () => speak(textEditingController.text),
            )
          ],
        )
    );
  }
}